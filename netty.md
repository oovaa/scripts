# netty

A small command-line tool that renders [`vnStat`](https://humdi.net/vnstat/)
traffic statistics as a clean, aligned bar-chart table — daily, weekly, and
monthly views with a download/upload split.

It parses `vnstat`'s **textual** output (not JSON), so it works across vnStat
versions that differ in their JSON support. Estimates are never shown.

The table is drawn with [`rich`](https://github.com/Textualize/rich), which
auto-aligns columns and handles wide/unicode characters (`↓`, `█`) correctly —
no manual padding, no drift.

---

## Prerequisites

| Requirement | Notes |
|-------------|-------|
| `vnstat`    | The traffic logger must be installed and recording. `netty` reads its database via the `vnstat` CLI. |
| Python 3.10+| Any reasonably modern CPython. |
| `uv`        | Optional, but preferred: used to create the venv and install `rich` on first run. Falls back to `python3 -m venv` if absent. |

### About `rich`

You do **not** install `rich` by hand. Homebrew / externally-managed Pythons
forbid both system-wide and `--user` installs, so on first run `netty` creates
a small virtual environment at `~/.local/share/netty/venv`, installs `rich`
into it (via `uv` or `python3 -m venv` + `pip`), and re-execs that venv's
`python3`. This is a one-time, non-interactive step that leaves your system
Python untouched. After that, `netty` starts instantly via the venv.

To pre-provision it yourself (optional):

```bash
uv venv ~/.local/share/netty/venv
uv pip install --python ~/.local/share/netty/venv/bin/python rich
```

The script carries inline [PEP 723](https://peps.python.org/pep-0723/) metadata
for documentation, but it does **not** run via `uv run` at runtime — doing so
left the terminal open on some setups (the process wouldn't return to the shell
without Ctrl-D). The venv + plain `python3` shebang avoids that.

---

## Installation

### 1. Install the prerequisites

**`uv`** (recommended everywhere — also bootstraps Python if needed):

```bash
# macOS / Linux
curl -LsSf https://astral.sh/uv/install.sh | sh
# or, if you already use Homebrew:
brew install uv
```

**Python 3.10+** — `uv` can fetch one for you, or use your system's:

```bash
# Debian/Ubuntu
sudo apt-get install -y python3
# macOS (Homebrew)
brew install python
# Arch
sudo pacman -S python
# Fedora
sudo dnf install -y python3
```

**`vnstat`** — the traffic logger (must be running and recording for data to appear):

```bash
# Debian/Ubuntu
sudo apt-get install -y vnstat
# macOS (Homebrew)
brew install vnstat
# Arch
sudo pacman -S vnstat
# Fedora
sudo dnf install -y vnstat
```

After installing, enable/start the daemon so it begins collecting:

```bash
sudo systemctl enable --now vnstat      # Linux (systemd)
# macOS: it runs via the Homebrew service or launches at boot
```

> `netty` itself needs no separate `rich` install — `uv` provisions it
> automatically on first run (see *About `rich`* above).

### 2. Install `netty`

Clone the repo and symlink the script into a directory on your `PATH` (so
`git pull` updates it in place):

```bash
git clone https://github.com/oovaa/scripts.git ~/repos/scripts
ln -sf ~/repos/scripts/netty ~/.omar-bin/netty   # or any PATH dir
hash -r
```

Then just run it:

```bash
netty
```

> If you prefer not to use the `uv` shebang, you can also run it explicitly
> with `uv run ~/repos/scripts/netty`, or install `rich` into a venv and call
> the script's Python directly.

---

## Usage

```
netty [-i IFACE] [-w [N]] [-d | -m]
```

| Flag | Description |
|------|-------------|
| *(none)* | Daily view only (today). |
| `-i IFACE` | Select a network interface (default: whatever `vnstat` reports first). |
| `-w [N]` | **Weekly** view: a fixed 7-row table for week *N*. `N=1` (default) = the 7 days ending today; `N=2` = the previous 7 days; `N=3` = the week before that, etc. |
| `-d` | Daily view only (explicit). |
| `-m` | Monthly view only. |
| `-h`, `--help` | Print the usage banner. |

Flags can be combined, e.g. `netty -i wlp2s0 -w 2`.

---

## Output

### Summary box

A panel at the top shows the interface name, the "since" date from `vnstat`,
and the all-time totals (download / upload / combined).

### Sections

Each section is a `rich` table with four columns:

| Column | Meaning |
|--------|---------|
| `Date` | The day (or month) the row covers. |
| `↓ download` | Inbound traffic, as a scaled bar + human-readable total. |
| `↑ upload` | Outbound traffic, same. |
| `Total` | Combined traffic for that row. |

### Bar scaling

Bars are scaled to the **maximum value in that section**:

- Within a week, the busiest day fills the bar; quieter days are proportionally
  shorter.
- A section with a single data point (e.g. the very first day of history)
  shows a full bar, because that one row *is* the max.

### Weekly windows

Each week is always a **7-row table**, one row per calendar day in that week's
window. Days that `vnstat` has no record for are shown as `0.00 B` with an
empty bar. This keeps the week shape consistent whether or not traffic exists
yet — as history accumulates, those zero rows fill in.

---

## Examples

```bash
netty            # today only
netty -w         # week 1 (last 7 days)
netty -w 2       # the previous week
netty -w 3       # the week before that
netty -m         # current month
netty -i eth0    # a specific interface
netty -i wlp2s0 -w
```

---

## Notes / design

- **No JSON, no `jq`.** Parsing tokenizes `number unit` pairs (e.g. `251 MiB`)
  from `vnstat -d` / `vnstat -m` / `vnstat`, so it is robust to minor changes in
  vnStat's column layout or version.
- **No estimates.** vnStat's projected/estimated rows are never displayed.
- **Alignment is delegated to `rich`.** Because `rich` measures display width
  (including wide glyphs), the columns stay aligned without hand-rolled padding.
- The script is a single self-contained file; the only runtime dependency
  (`rich`) is auto-installed into a venv at `~/.local/share/netty/venv` on
  first run, then runs under that venv's `python3`.
