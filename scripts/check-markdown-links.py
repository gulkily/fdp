#!/usr/bin/env python
"""Check local Markdown links without external dependencies.

Compatible with Python 2.7 and Python 3.
"""

from __future__ import print_function

import io
import os
import re
import sys


IGNORED_DIRECTORIES = set(['.git', '.idea', 'node_modules'])
LINK_PATTERN = re.compile(r'\[[^\]]*\]\(([^)]+)\)')


def markdown_files(root):
    files = []
    for directory, directories, names in os.walk(root):
        directories[:] = sorted(
            name for name in directories
            if name not in IGNORED_DIRECTORIES and not os.path.islink(os.path.join(directory, name))
        )
        for name in sorted(names):
            path = os.path.join(directory, name)
            if name.endswith('.md') and not os.path.islink(path) and os.path.isfile(path):
                files.append(path)
    return files


def target_is_external(target):
    return (
        not target or
        target.startswith('#') or
        '{' in target or
        '}' in target or
        target.startswith('http:') or
        target.startswith('https:') or
        target.startswith('mailto:')
    )


def main():
    root = os.path.abspath(os.getcwd())
    files = markdown_files(root)
    failures = []

    for path in files:
        with io.open(path, 'r', encoding='utf-8') as handle:
            source = handle.read()
        for match in LINK_PATTERN.finditer(source):
            original_target = match.group(1)
            target = original_target.strip()
            if target.startswith('<') and target.endswith('>'):
                target = target[1:-1]
            if target_is_external(target):
                continue

            target = target.split('#', 1)[0]
            resolved = os.path.abspath(os.path.join(os.path.dirname(path), target))
            if target and not os.path.exists(resolved):
                failures.append('%s -> %s' % (os.path.relpath(path, root), original_target))

    if failures:
        print('Broken local Markdown links:', file=sys.stderr)
        for failure in failures:
            print('- %s' % failure, file=sys.stderr)
        return 1

    print('Checked %d Markdown files: local links are valid.' % len(files))
    return 0


if __name__ == '__main__':
    sys.exit(main())
