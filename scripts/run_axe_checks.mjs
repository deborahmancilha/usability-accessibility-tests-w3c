import AxeBuilder from "@axe-core/playwright";
import { chromium } from "playwright";
import { mkdir, writeFile } from "node:fs/promises";
import path from "node:path";

const beforeUrl = process.env.W3C_BEFORE_URL ?? "https://www.w3.org/WAI/demos/bad/before/survey.html";
const afterUrl = process.env.W3C_AFTER_URL ?? "https://www.w3.org/WAI/demos/bad/after/survey.html";
const outputDir = process.env.AXE_OUTPUT_DIR ?? path.join("results", "axe");
const failOnViolations = process.env.AXE_FAIL_ON_VIOLATIONS === "true";
const startedAt = new Date().toISOString();

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
      testedUrl: results.url,
      timestamp: results.timestamp,
      engine: `${results.testEngine.name} ${results.testEngine.version}`,
      runner: results.testRunner.name,
      userAgent: results.testEnvironment.userAgent,
      viewport: `${results.testEnvironment.windowWidth}x${results.testEnvironment.windowHeight}`,
      violations: results.violations.length,
      incomplete: results.incomplete.length,
      passes: results.passes.length,
      impactCounts,
      violationRules: results.violations.map((violation) => violation.id),
      incompleteRules: results.incomplete.map((item) => item.id),
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
  `Execution started: ${startedAt}`,
  "",
  "| Page | URL | Tool | Viewport | Violations | Incomplete | Passes | Impact summary | Rules with violations | JSON |",
  "| ---- | --- | ---- | -------- | ---------- | ---------- | ------ | -------------- | --------------------- | ---- |",
  ...summary.map((item) => {
    const impacts = Object.entries(item.impactCounts)
      .map(([impact, count]) => `${impact}: ${count}`)
      .join(", ") || "none";
    const rules = item.violationRules.join(", ") || "none";
    return `| ${item.page} | ${item.testedUrl} | ${item.engine} via ${item.runner} | ${item.viewport} | ${item.violations} | ${item.incomplete} | ${item.passes} | ${impacts} | ${rules} | ${item.file} |`;
  }),
  "",
  "Incomplete rules:",
  "",
  ...summary.map((item) => `- ${item.page}: ${item.incompleteRules.join(", ") || "none"}`),
  "",
  "User agents:",
  "",
  ...summary.map((item) => `- ${item.page}: ${item.userAgent}`),
  "",
  "Note: axe automatiza parte da avaliacao. Achados manuais de teclado, foco, linguagem e usabilidade continuam necessarios.",
  "",
].join("\n");

await writeFile(path.join(outputDir, "summary.md"), markdown, "utf8");
console.table(summary.map(({ page, violations, incomplete, passes }) => ({ page, violations, incomplete, passes })));

if (failOnViolations && summary.some((item) => item.violations > 0)) {
  process.exitCode = 1;
}
