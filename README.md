# termcode

`termcode` is a small macOS CLI for finding local JavaScript projects, opening them, and running package scripts without remembering where every repo lives.

## Usage

```sh
termcode set ~/Documents/code ~/Documents/code/_kitchen_sink ~/Documents/code/_turbo ~/Documents/code/micro-startups
termcode ls
termcode plotkeys dev
termcode open plotkeys
termcode . plotkeys
termcode rename plot-keys plotkeys
```

`termcode set` saves the roots to `${TERMCODE_CONFIG_DIR:-${XDG_CONFIG_HOME:-$HOME/.config}/termcode}/roots`.
Aliases created by `termcode rename` are saved to `aliases` in the same directory.

## Install From Source

```sh
git clone https://github.com/your-name/termcode.git
cd termcode
./install.sh
```

By default, the installer copies `bin/termcode` to:

```sh
~/.local/bin/termcode
```

To choose another install location:

```sh
TERMCODE_INSTALL_DIR=/usr/local/bin ./install.sh
```

## Homebrew Preparation

A formula template lives at `packaging/homebrew/termcode.rb.template`.
After tagging a release, replace the placeholder repository URL and checksum, then publish it through a tap.

## Project Discovery Rule

Discovery is intentionally simple:

- search only the roots configured with `termcode set`
- include only direct child folders
- include only folders containing `package.json`
- list callable names alphabetically
- report duplicate callable names instead of guessing

## Commands

```sh
termcode set <paths...>
termcode ls
termcode rename <current-name-or-path> <new-alias>
termcode open <project>
termcode . <project>
termcode <project> <script> [args...]
```

Runner detection is based on lockfiles in the project directory:

- `bun.lockb` or `bun.lock`: `bun`
- `pnpm-lock.yaml`: `pnpm`
- `yarn.lock`: `yarn`
- `package-lock.json`, `npm-shrinkwrap.json`, or no lockfile: `npm`

## Development

```sh
./bin/termcode --help
./bin/termcode --version
./tests/run.sh
```

See `brain/PROJECT_INDEX.md` and `brain/tasks/backlog.md` for future work.
