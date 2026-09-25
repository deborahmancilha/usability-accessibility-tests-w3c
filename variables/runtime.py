from __future__ import annotations

import os
import sys
from copy import deepcopy
from pathlib import Path
from typing import Any

import yaml

ROOT_DIR = Path(__file__).resolve().parents[1]
CONFIG_DIR = ROOT_DIR / "config"


def get_variables() -> dict[str, Any]:
    env = os.getenv("ENV", "w3c").strip().lower()
    config = _load_config(env)

    viewport = config["viewport"]
    w3c = config.get("w3c", {})

    return {
        "ENV": env,
        "ROOT_DIR": str(ROOT_DIR),
        "BASE_URL": os.getenv("BASE_URL", str(config["base_url"])),
        "BROWSER": os.getenv("BROWSER", str(config["browser"])),
        "HEADLESS": _as_bool(os.getenv("HEADLESS"), default=_as_bool(config["headless"])),
        "BROWSER_TIMEOUT": str(config["timeout"]),
        "LOCALE": str(config["locale"]),
        "VIEWPORT_WIDTH": int(viewport["width"]),
        "VIEWPORT_HEIGHT": int(viewport["height"]),
        "RESULTS_DIR": str(ROOT_DIR / str(config["results_dir"])),
        "W3C_BEFORE_URL": os.getenv("W3C_BEFORE_URL", str(w3c.get("before_url", ""))),
        "W3C_AFTER_URL": os.getenv("W3C_AFTER_URL", str(w3c.get("after_url", ""))),
        "PYTHON_EXECUTABLE": sys.executable,
    }


def _load_config(env: str) -> dict[str, Any]:
    defaults_path = CONFIG_DIR / "defaults.yaml"
    env_path = CONFIG_DIR / "environments" / f"{env}.yaml"
    if not env_path.exists():
        available = ", ".join(
            sorted(path.stem for path in (CONFIG_DIR / "environments").glob("*.yaml"))
        )
        raise ValueError(f"Ambiente '{env}' nao encontrado. Ambientes disponiveis: {available}")

    defaults = _read_yaml(defaults_path)
    environment = _read_yaml(env_path)
    return _deep_merge(defaults, environment)


def _read_yaml(path: Path) -> dict[str, Any]:
    with path.open(encoding="utf-8") as file:
        data = yaml.safe_load(file) or {}
    if not isinstance(data, dict):
        raise ValueError(f"Arquivo de configuracao invalido: {path}")
    return data


def _deep_merge(base: dict[str, Any], override: dict[str, Any]) -> dict[str, Any]:
    merged = deepcopy(base)
    for key, value in override.items():
        if isinstance(value, dict) and isinstance(merged.get(key), dict):
            merged[key] = _deep_merge(merged[key], value)
        else:
            merged[key] = value
    return merged


def _as_bool(value: Any, *, default: bool | None = None) -> bool:
    if value is None:
        if default is None:
            raise ValueError("Valor booleano ausente")
        return default
    if isinstance(value, bool):
        return value
    normalized = str(value).strip().lower()
    if normalized in {"1", "true", "yes", "y", "on"}:
        return True
    if normalized in {"0", "false", "no", "n", "off"}:
        return False
    raise ValueError(f"Valor booleano invalido: {value!r}")
