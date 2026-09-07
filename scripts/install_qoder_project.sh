#!/usr/bin/env bash
set -euo pipefail

FRAMEWORK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_DIR="${1:-.}"
PROJECT_DIR="$(cd "$PROJECT_DIR" && pwd)"

fail() {
  printf 'ERROR: %s\n' "$1" >&2
  exit 1
}

info() {
  printf '%s\n' "$1"
}

[[ -d "$FRAMEWORK_DIR/skills" ]] || fail "missing framework skills directory: $FRAMEWORK_DIR/skills"
[[ -f "$FRAMEWORK_DIR/.qoder/rules/enterprise-ai-framework.md" ]] || fail "missing Qoder rule file"
[[ -f "$FRAMEWORK_DIR/.qoder/settings.example.json" ]] || fail "missing Qoder settings example"
[[ -f "$FRAMEWORK_DIR/scripts/scan_project.sh" ]] || fail "missing project scanner"

mkdir -p "$PROJECT_DIR/.qoder/rules" "$PROJECT_DIR/.qoder/skills"

cp "$FRAMEWORK_DIR/.qoder/rules/enterprise-ai-framework.md" "$PROJECT_DIR/.qoder/rules/enterprise-ai-framework.md"
cp "$FRAMEWORK_DIR/.qoder/settings.example.json" "$PROJECT_DIR/.qoder/settings.json"

rm -rf "$PROJECT_DIR/.qoder/skills"
mkdir -p "$PROJECT_DIR/.qoder/skills"
cp -R "$FRAMEWORK_DIR/skills/." "$PROJECT_DIR/.qoder/skills/"

if [[ ! -f "$PROJECT_DIR/AGENTS.md" && -f "$FRAMEWORK_DIR/docs/usage/examples/AGENTS.example.md" ]]; then
  cp "$FRAMEWORK_DIR/docs/usage/examples/AGENTS.example.md" "$PROJECT_DIR/AGENTS.md"
fi

bash "$FRAMEWORK_DIR/scripts/scan_project.sh" "$PROJECT_DIR" --write >/dev/null

if [[ -f "$PROJECT_DIR/.gitignore" ]]; then
  if ! grep -qxF ".agent/" "$PROJECT_DIR/.gitignore"; then
    printf '\n.agent/\n' >> "$PROJECT_DIR/.gitignore"
  fi
else
  printf '.agent/\n' > "$PROJECT_DIR/.gitignore"
fi

info "Qoder project integration installed."
info "Project: $PROJECT_DIR"
info "Installed:"
info "- .qoder/settings.json"
info "- .qoder/rules/enterprise-ai-framework.md"
info "- .qoder/skills/"
info "- .agent/"
info ""
info "Restart Qoder or reopen the project, then test with:"
info "INIT"
info "API_DOC ControllerFile.php"
