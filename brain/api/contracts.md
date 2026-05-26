# Contracts

## Purpose
Define user-visible command contracts.

## How To Use
- Update when command inputs, outputs, or failure modes change.

## Template
- `set` replaces saved roots.
- `ls` prints callable project names alphabetically.
- `rename` creates aliases only.
- duplicate names fail until resolved with an alias.
- script execution auto-detects package manager by lockfile.
