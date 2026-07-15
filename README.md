# Bash Scripts Collection

This repository contains a collection of Bash scripts designed to automate various tasks.

## Scripts

### [meta-overview.bash](meta-overview.bash)

This script allows you to toggle the Overview feature in KRunner with the Meta key.

Usage: `./meta-overview.bash`

### [wifi](wifi)

This script allows you to toggle your Wi-Fi status on and off using the `nmcli` command.

Usage: `./wifi`

### [uniupdate](uniupdate)

This script automates the process of updating and upgrading your system packages, npm packages, and Python packages.

Usage: `./uniupdate`

### [netty](netty)

Renders `vnstat` traffic statistics (daily / weekly / monthly) as a clean, aligned bar chart with download/upload split. Parses vnStat's textual output (no JSON/jq needed), so it works across vnStat versions. No estimates shown.

Usage: `./netty [-i interface] [-w [N]] [-d [N]|-m]`

By default shows the Daily section only (today). `-w [N]` shows a weekly view (per-day rows for week *N*; N=1 = most recent 7 days, N=2 = the previous week, etc.). `-d [N]` shows a single day: N=1 = today, N=2 = yesterday, etc. `-m` shows the Monthly section. A week/day with no data prints an empty table. `-d`/`daily` and `-w`/`weekly` can be combined with `-i`.

## Requirements

- Python 3.10+ (`python3` on your `PATH`)
- `uv` (optional, preferred) — used to create the venv and install `rich` on first run; falls back to `python3 -m venv` if absent
- `vnstat`

No manual install of `rich`: the script's shebang (`#!/usr/bin/env python3`) runs it directly. On first run it creates a venv at `~/.local/share/netty/venv`, installs `rich` into it, and re-execs that venv's Python. Subsequent runs start instantly via the venv. Just run `./netty`.

For each script, additional requirements may apply (e.g., Git, nmcli, npm, pip)

## Notes

- Ensure that you have the necessary permissions to run these scripts.
- To use these scripts from anywhere, move them to one of your PATH directories.


# Git Automation Script

This Bash script automates common Git operations, making it easier to add changes, commit, tag, and push to a remote repository. It's designed to streamline the workflow and provide a convenient way to perform these tasks in a single script.

## Features

- Adds changes to the staging area.
- Commits changes with a timestamped message.
- Creates a tag (optional, if a tag name is provided).
- Pushes changes and tags to the remote repository.

## Usage

```bash
./gacp <commit_message> [tag_name]
```

- `<commit_message>`: Required. The commit message for the changes.
- `[tag_name]`: Optional. If provided, creates a tag with the specified name.

## Examples

```bash
./gacp "Initial commit"
```

```bash
./gacp "Feature XYZ implemented" v1.0.0
```

## Requirements

- Bash shell
- Git installed and configured

## Notes

- Ensure that you have the necessary permissions to perform Git operations and then move the script to one of your path directories.

## License

This script is released under the [MIT License](LICENSE).
