import AxeBuilder from "@axe-core/playwright";
import { chromium } from "playwright";
import { mkdir, writeFile } from "node:fs/promises";
import path from "node:path";

const beforeUrl = process.env.W3C_BEFORE_URL ?? "https://www.w3.org/WAI/demos/bad/before/survey.html";
const afterUrl = process.env.W3C_AFTER_URL ?? "https://www.w3.org/WAI/demos/bad/after/survey.html";
const outputDir = process.env.AXE_OUTPUT_DIR ?? path.join("results", "axe");
const failOnViolations = process.env.AXE_FAIL_ON_VIOLATIONS === "true";

const targets = [
  { name: "before", url: beforeUrl },
  { name: "after", url: afterUrl },
];

await mkdir(outputDir, { recursive: true });
const browser = await chromium.launch({ headless: true });
const summary = [];

try {
  for (const target of targets) {
    const context = await browser.newContext({ viewport: { width: 1366, height: 768 } });
    const page = await context.newPage();
    await page.goto(target.url, { waitUntil: "domcontentloaded" });

    const results = await new AxeBuilder({ page })
      .withTags(["wcag2a", "wcag2aa", "wcag21a", "wcag21aa", "best-practice"])
      .analyze();

    const file = path.join(outputDir, `${target.name}.json`);
    await writeFile(file, JSON.stringify(results, null, 2), "utf8");

    const impactCounts = results.violations.reduce((counts, violation) => {
      const impact = violation.impact ?? "unknown";
      counts[impact] = (counts[impact] ?? 0) + 1;
      return counts;
    }, {});

    summary.push({
      page: target.name,
      url: target.url,
      violations: results.violations.length,
      incomplete: results.incomplete.length,
      passes: results.passes.length,
      impactCounts,
      file,
    });

    await context.close();
  }
} finally {
  await browser.close();
}

const markdown = [
  "# Axe Accessibility Summary",
  "",
  "| Page | Violations | Incomplete | Passes | Impact summary | JSON |",
  "| ---- | ---------- | ---------- | ------ | -------------- | ---- |",
  ...summary.map((item) => {
    const impacts = Object.entries(item.impactCounts)
      .map(([impact, count]) => `${impact}: ${count}`)
      .join(", ") || "none";
    return `| ${item.page} | ${item.violations} | ${item.incomplete} | ${item.passes} | ${impacts} | ${item.file} |`;
  }),
  "",
  "Note: axe automatiza parte da avaliacao. Achados manuais de teclado, foco, linguagem e usabilidade continuam necessarios.",
  "",
].join("\n");

await writeFile(path.join(outputDir, "summary.md"), markdown, "utf8");
console.table(summary.map(({ page, violations, incomplete, passes }) => ({ page, violations, incomplete, passes })));

if (failOnViolations && summary.some((item) => item.violations > 0)) {
  process.exitCode = 1;
}
