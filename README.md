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

Usage: `./netty [-i interface] [-w [N]] [-d|-m]`

By default shows the Daily section only (today). `-w` shows a weekly view (per-day rows for the most recent 7 days); `-w 2` shows the previous week, `-w 3` the one before (N defaults to 1). A week with no data prints `no data for week N`. `-m` shows the Monthly section, `-d` the Daily section explicitly.

## Requirements

- Python 3.10+ (uses [`rich`](https://github.com/Textualize/rich) for the table)
- `vnstat`
- Install the dependency with: `uv pip install --system rich`  (or `pip install rich`)

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
