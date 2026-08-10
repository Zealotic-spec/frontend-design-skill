#!/usr/bin/env bash
#
# Installs frontend-design-skill and, optionally, the third-party design skills
# it conducts — fetched from their own upstream repos so authors keep the credit.
#
#   ./install.sh                  main skill only
#   ./install.sh --with-catalog   main skill + every auto-installable skill in CATALOG.md
#   ./install.sh --list           show what --with-catalog would install, install nothing
#   ./install.sh --force          overwrite skills that are already installed
#   ./install.sh --dir <path>     install somewhere other than ~/.claude/skills
#
# Nothing is ever deleted. An already-installed skill is skipped unless --force,
# and --force replaces only that one directory.

set -euo pipefail

TARGET="${HOME}/.claude/skills"
WITH_CATALOG=0
FORCE=0
LIST_ONLY=0
REPO_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# name|repo|path-inside-repo
CATALOG_SKILLS=(
  "emil-design-eng|emilkowalski/skills|skills/emil-design-eng"
  "apple-design|emilkowalski/skills|skills/apple-design"
  "animation-vocabulary|emilkowalski/skills|skills/animation-vocabulary"
  "find-animation-opportunities|emilkowalski/skills|skills/find-animation-opportunities"
  "improve-animations|emilkowalski/skills|skills/improve-animations"
  "review-animations|emilkowalski/skills|skills/review-animations"
  "pick-ui-library|emilkowalski/skills|skills/pick-ui-library"
  "prototype|emilkowalski/skills|skills/prototype"
  "impeccable|pbakaus/impeccable|plugin/skills/impeccable"
  "ui-ux-pro-max|nextlevelbuilder/ui-ux-pro-max-skill|.claude/skills/ui-ux-pro-max"
  "ui-styling|mrgoonie/claudekit-skills|plugins/web-dev-tools/skills/ui-styling"
)

bold()  { printf '\033[1m%s\033[0m\n' "$*"; }
info()  { printf '  %s\n' "$*"; }
warn()  { printf '  \033[33m!\033[0m %s\n' "$*"; }
ok()    { printf '  \033[32m+\033[0m %s\n' "$*"; }
skip()  { printf '  \033[2m=\033[0m %s\n' "$*"; }

while [ $# -gt 0 ]; do
  case "$1" in
    --with-catalog) WITH_CATALOG=1 ;;
    --force)        FORCE=1 ;;
    --list)         LIST_ONLY=1 ;;
    --dir)          TARGET="${2:?--dir needs a path}"; shift ;;
    -h|--help)      sed -n '2,20p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *)              echo "unknown option: $1" >&2; exit 2 ;;
  esac
  shift
done

if [ "$LIST_ONLY" = 1 ]; then
  bold "--with-catalog would install ${#CATALOG_SKILLS[@]} skills into ${TARGET}:"
  for entry in "${CATALOG_SKILLS[@]}"; do
    IFS='|' read -r name repo _ <<< "$entry"
    printf '  %-32s %s\n' "$name" "https://github.com/${repo}"
  done
  echo
  info "Unattributed skills are listed in CATALOG.md and are never fetched automatically."
  exit 0
fi

command -v git >/dev/null || { echo "git is required" >&2; exit 1; }

# install_dir <source> <name>  — copy one skill directory, honouring --force
install_dir() {
  local src="$1" name="$2" dest="${TARGET}/${2}"
  if [ ! -d "$src" ]; then
    warn "${name}: not found upstream at $(basename "$src") — upstream layout may have changed"
    return 1
  fi
  if [ -d "$dest" ] && [ "$FORCE" != 1 ]; then
    skip "${name} already installed (--force to replace)"
    return 0
  fi
  rm -rf -- "$dest"
  # -L dereferences: some repos ship a skill as a symlink into a shared directory,
  # and copying the link itself would land a dangling pointer in ~/.claude/skills.
  cp -RL -- "$src" "$dest"
  if [ ! -f "${dest}/SKILL.md" ]; then
    warn "${name}: installed but has no SKILL.md — upstream layout may have changed"
    return 1
  fi
  ok "$name"
}

mkdir -p -- "$TARGET"

bold "Installing frontend-design-skill → ${TARGET}"
install_dir "${REPO_ROOT}/skills/frontend-design-skill" "frontend-design-skill"

if [ "$WITH_CATALOG" != 1 ]; then
  echo
  info "Catalog skills not installed. Run with --with-catalog to add them,"
  info "or --list to see what that would fetch."
  exit 0
fi

WORK="$(mktemp -d)"
trap 'rm -rf -- "$WORK"' EXIT

echo
bold "Fetching catalog skills from upstream"
info "Four shallow clones, ~200 MB of traffic. Give it a few minutes."

last_repo=""
for entry in "${CATALOG_SKILLS[@]}"; do
  IFS='|' read -r name repo path <<< "$entry"

  clone="${WORK}/${repo//\//__}"
  if [ ! -d "$clone" ]; then
    [ "$repo" != "$last_repo" ] && info "→ ${repo}"
    last_repo="$repo"
    if ! git clone --depth 1 --quiet "https://github.com/${repo}.git" "$clone" 2>/dev/null; then
      warn "could not clone ${repo} — skipping its skills"
      mkdir -p "$clone"   # mark as attempted so we don't retry per skill
      continue
    fi
  fi

  install_dir "${clone}/${path}" "$name" || true
done

echo
bold "Done."
info "Skills live in ${TARGET}. Restart Claude Code to pick them up."
info "Licenses and attribution for every skill above: CATALOG.md"
