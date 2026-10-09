#!/usr/bin/env node

import { existsSync, readdirSync, readFileSync } from 'node:fs';
import { dirname, extname, join, relative, resolve } from 'node:path';

const root = resolve(process.cwd());
const ignoredDirectories = new Set(['.git', '.idea', 'node_modules']);
const markdownFiles = [];

function visit(directory) {
  for (const entry of readdirSync(directory, { withFileTypes: true })) {
    if (entry.isDirectory()) {
      if (!ignoredDirectories.has(entry.name)) visit(join(directory, entry.name));
    } else if (entry.isFile() && extname(entry.name) === '.md') {
      markdownFiles.push(join(directory, entry.name));
    }
  }
}

visit(root);

const failures = [];
for (const file of markdownFiles) {
  const source = readFileSync(file, 'utf8');
  for (const match of source.matchAll(/\[[^\]]*\]\(([^)]+)\)/g)) {
    let target = match[1].trim();
    if (target.startsWith('<') && target.endsWith('>')) target = target.slice(1, -1);
    if (
      !target ||
      target.startsWith('#') ||
      target.includes('{') ||
      target.includes('}') ||
      /^(https?:|mailto:)/.test(target)
    ) {
      continue;
    }

    target = target.split('#', 1)[0];
    if (target && !existsSync(resolve(dirname(file), target))) {
      failures.push(`${relative(root, file)} -> ${match[1]}`);
    }
  }
}

if (failures.length) {
  console.error('Broken local Markdown links:');
  console.error(failures.map((failure) => `- ${failure}`).join('\n'));
  process.exitCode = 1;
} else {
  console.log(`Checked ${markdownFiles.length} Markdown files: local links are valid.`);
}
