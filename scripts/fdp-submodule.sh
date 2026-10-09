#!/usr/bin/env bash

set -euo pipefail

readonly FDP_PATH="docs/fdp"
readonly FDP_URL="https://github.com/gulkily/fdp.git"
readonly FDP_BRANCH="master"

die() {
  printf 'fdp-submodule: %s\n' "$*" >&2
  exit 1
}

usage() {
  cat <<'EOF'
Usage: fdp-submodule.sh install

Install FDP as the docs/fdp submodule in the current Git repository.
EOF
}

repository_root() {
  local root

  root="$(git rev-parse --show-toplevel 2>/dev/null)" \
    || die "run this command from inside a Git working tree"

  if [[ "$(git -C "$root" rev-parse --is-bare-repository)" == "true" ]]; then
    die "a non-bare Git working tree is required"
  fi

  printf '%s\n' "$root"
}

submodule_path_is_registered() {
  local root="$1"

  [[ -f "$root/.gitmodules" ]] || return 1

  git config --file "$root/.gitmodules" --get-regexp '^submodule\..*\.path$' 2>/dev/null \
    | awk -v path="$FDP_PATH" '$2 == path { found = 1 } END { exit !found }'
}

install() {
  local root target

  root="$(repository_root)"
  target="$root/$FDP_PATH"

  if [[ -e "$target" || -L "$target" ]]; then
    die "$FDP_PATH already exists; move or remove the conflicting path before installing"
  fi

  if submodule_path_is_registered "$root"; then
    die "$FDP_PATH is already registered as a submodule; initialize it or use the sync command"
  fi

  git -C "$root" submodule add --branch "$FDP_BRANCH" "$FDP_URL" "$FDP_PATH"
  printf 'Installed FDP at %s. Review and commit .gitmodules and the submodule pointer.\n' "$FDP_PATH"
}

main() {
  if [[ "$#" -ne 1 ]]; then
    usage >&2
    exit 2
  fi

  case "$1" in
    install)
      install
      ;;
    -h|--help)
      usage
      ;;
    *)
      usage >&2
      exit 2
      ;;
  esac
}

main "$@"
