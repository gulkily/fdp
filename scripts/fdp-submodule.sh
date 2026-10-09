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
Usage: fdp-submodule.sh <install|sync>

Install FDP as the docs/fdp submodule in the current Git repository.
Synchronize the installed FDP submodule from its configured origin.
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

submodule_name() {
  local root="$1"

  [[ -f "$root/.gitmodules" ]] || return 1

  git config --file "$root/.gitmodules" --get-regexp '^submodule\..*\.path$' 2>/dev/null \
    | awk -v path="$FDP_PATH" '
      $2 == path {
        name = $1
        sub(/^submodule\./, "", name)
        sub(/\.path$/, "", name)
        print name
        exit
      }
    '
}

submodule_path_is_registered() {
  [[ -n "$(submodule_name "$1")" ]]
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

sync() {
  local root name target configured_url configured_branch current_branch

  root="$(repository_root)"
  name="$(submodule_name "$root" || true)"
  [[ -n "$name" ]] || die "$FDP_PATH is not registered; run the install command first"

  configured_url="$(git config --file "$root/.gitmodules" --get "submodule.$name.url" || true)"
  configured_branch="$(git config --file "$root/.gitmodules" --get "submodule.$name.branch" || true)"
  [[ "$configured_url" == "$FDP_URL" ]] \
    || die "$FDP_PATH is not configured as the FDP submodule"
  [[ "$configured_branch" == "$FDP_BRANCH" ]] \
    || die "$FDP_PATH is not configured to track $FDP_BRANCH"

  target="$root/$FDP_PATH"
  git -C "$target" rev-parse --is-inside-work-tree >/dev/null 2>&1 \
    || die "$FDP_PATH is not initialized; run git submodule update --init -- $FDP_PATH"
  git -C "$target" remote get-url origin >/dev/null 2>&1 \
    || die "$FDP_PATH has no origin remote; restore the submodule remote before syncing"

  [[ -z "$(git -C "$target" status --porcelain)" ]] \
    || die "$FDP_PATH has uncommitted changes; commit or discard them before syncing"
  [[ -z "$(git -C "$root" status --porcelain -- "$FDP_PATH")" ]] \
    || die "$FDP_PATH has an uncommitted pointer change; review it before syncing again"

  current_branch="$(git -C "$target" branch --show-current)"
  [[ "$current_branch" == "$FDP_BRANCH" ]] \
    || die "$FDP_PATH must be checked out on $FDP_BRANCH before syncing"

  git -C "$target" fetch origin "$FDP_BRANCH"
  git -C "$target" merge --ff-only FETCH_HEAD

  if git -C "$root" diff --quiet -- "$FDP_PATH"; then
    printf 'FDP is already up to date.\n'
  else
    printf 'Synchronized FDP at %s. Review and commit the submodule pointer.\n' "$FDP_PATH"
  fi
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
    sync)
      sync
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
