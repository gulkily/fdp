#!/usr/bin/env bash

# Exercises the README's Git-native FDP workflow using only local, disposable
# repositories. It never reads or modifies the repository that contains it.

set -euo pipefail

fixture_dir="$(mktemp -d "${TMPDIR:-/tmp}/fdp-git-workflow.XXXXXX")"
case "$fixture_dir" in
  "${TMPDIR:-/tmp}"/fdp-git-workflow.*) ;;
  *) printf 'unexpected fixture path: %s\n' "$fixture_dir" >&2; exit 1 ;;
esac
trap 'rm -rf -- "$fixture_dir"' EXIT

upstream_work="$fixture_dir/upstream-work"
upstream_bare="$fixture_dir/upstream.git"
host="$fixture_dir/host"
clone="$fixture_dir/clone"

configure_identity() {
  git -C "$1" config user.name 'FDP fixture'
  git -C "$1" config user.email 'fdp-fixture@example.invalid'
}

git init -q "$upstream_work"
configure_identity "$upstream_work"
printf 'first\n' >"$upstream_work/README.md"
git -C "$upstream_work" add README.md
git -C "$upstream_work" commit -qm 'initial upstream'
git -C "$upstream_work" branch -M master
git clone -q --bare "$upstream_work" "$upstream_bare"
git -C "$upstream_work" remote add origin "$upstream_bare"

git init -q "$host"
configure_identity "$host"
printf 'host\n' >"$host/README.md"
git -C "$host" add README.md
git -C "$host" commit -qm 'initial host'
git -c protocol.file.allow=always -C "$host" submodule add --branch master "$upstream_bare" docs/fdp >/dev/null
test "$(git -C "$host" config --file .gitmodules --get submodule.docs/fdp.url)" = "$upstream_bare"
test "$(git -C "$host" config --file .gitmodules --get submodule.docs/fdp.branch)" = master
test "$(git -C "$host" diff --cached --name-only | sort)" = $'.gitmodules\ndocs/fdp'
git -C "$host" commit -qm 'add fdp'

git clone -q "$host" "$clone"
test ! -e "$clone/docs/fdp/README.md"
git -c protocol.file.allow=always -C "$clone" submodule update --init -- docs/fdp >/dev/null
test -e "$clone/docs/fdp/README.md"

printf 'second\n' >>"$upstream_work/README.md"
git -C "$upstream_work" commit -am 'advance upstream' -q
git -C "$upstream_work" push -q origin master
test -z "$(git -C "$host" status --porcelain)"
test -z "$(git -C "$host/docs/fdp" status --porcelain)"
test "$(git -C "$host/docs/fdp" branch --show-current)" = master
git -C "$host/docs/fdp" fetch origin master >/dev/null
git -C "$host/docs/fdp" merge --ff-only FETCH_HEAD >/dev/null
test -n "$(git -C "$host" diff -- docs/fdp)"

pointer_before="$(git -C "$host" ls-files -s docs/fdp)"
printf 'dirty\n' >"$host/docs/fdp/dirty.txt"
test -n "$(git -C "$host/docs/fdp" status --porcelain)"
test "$(git -C "$host" ls-files -s docs/fdp)" = "$pointer_before"

printf 'FDP Git workflow fixture passed.\n'
