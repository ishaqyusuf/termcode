# Termcode CLI

## Purpose
Track the main CLI feature.

## How To Use
- Update as command behavior ships.

## Accepted Plan
- Build a macOS shell CLI installable with curl first and Homebrew later.
- Scan configured roots for direct child package projects.
- Support aliases without folder renames.
- Support Finder and VS Code open commands.
- Auto-detect the package runner by lockfile.

## Shipped Behavior
- `termcode set <paths...>` stores canonical root directories.
- `termcode ls` lists discovered project names and alias names with paths.
- Duplicate callable names are reported as ambiguous instead of resolved implicitly.
- `termcode rename <name-or-path> <alias>` stores an alias for a resolved project path.
- `termcode open <project>` opens Finder, and `termcode . <project>` opens VS Code.
- `termcode <project> <script> [args...]` runs scripts through `bun`, `pnpm`, `yarn`, or `npm` based on lockfiles.
