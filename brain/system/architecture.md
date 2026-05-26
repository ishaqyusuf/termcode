# Architecture

## Purpose
Track the technical shape of the CLI.

## How To Use
- Update when command parsing, config storage, or resolver behavior changes.
- Link important decisions from `brain/decisions/`.

## Template
- Entry point: `bin/termcode`
- Config directory: `${TERMCODE_CONFIG_DIR:-${XDG_CONFIG_HOME:-$HOME/.config}/termcode}`
- Config files: `roots` as newline-delimited canonical paths and `aliases` as tab-separated alias/path records.
- Resolver: scan configured roots at runtime
- Project rule: direct child folder containing `package.json`
- Duplicate handling: report ambiguous callable names instead of choosing one implicitly.
- Runner: auto-detect lockfile in the order `bun`, `pnpm`, `yarn`, `npm`.
