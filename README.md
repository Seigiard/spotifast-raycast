# Spotifast in Raycast

Raycast script commands for the running Spotifast: play/pause, next,
previous, seek, volume, shuffle, repeat, and the playing track. They are thin
wrappers around `spotifast <verb>`, which talks to the instance already
running rather than starting a second one.

## Installation

### Requirements

- macOS with [Raycast](https://www.raycast.com/) installed;
- Spotifast installed in `/Applications/Spotifast.app` (or a custom binary
  selected with `SPOTIFAST_BIN`);
- a Spotifast build that supports the remote-control verbs listed below.

### Add the commands to Raycast

1. Clone this repository into a permanent directory:

   ```bash
   mkdir -p ~/Raycast
   git clone https://github.com/Seigiard/spotifast-raycast.git ~/Raycast/spotifast-raycast
   ```

2. Open **Raycast Settings → Extensions → Script Commands**.
3. Click **Add Directories** and choose `~/Raycast/spotifast-raycast`.
4. Search Raycast for `Spotifast`. Optionally assign aliases or hotkeys to
   commands such as **Play / Pause**, **Next Track**, and **Now Playing**.

To install updates later, run:

```bash
git -C ~/Raycast/spotifast-raycast pull
```

The scripts use `spotifast` or `fastpotify` from `PATH`, or the binary inside
`/Applications/Spotifast.app` (still named `fastpotify` there). Installs
updated from before the rename keep `/Applications/Fastpotify.app`, and that
path works too. If your binary is elsewhere, set `SPOTIFAST_BIN` in the
environment Raycast uses.

They need a Spotifast that answers the verbs below. That is not in a
released build yet. The proposed upstream change was
[Spotifast PR #34](https://github.com/crmne/spotifast/pull/34), which was
closed without merging. Installing a released build over a compatible custom
build removes the verbs, and the scripts will report "Spotifast is not
installed" or "not running, or predates remote control".

## The commands underneath

Every script is `spotifast <verb>`, so the same verbs work from a terminal,
a launcher, or a keyboard shortcut tool:

```
spotifast play-pause           spotifast volume 40
spotifast play                 spotifast volume-up [percent]
spotifast pause                spotifast volume-down [percent]
spotifast next                 spotifast mute
spotifast previous             spotifast shuffle
spotifast seek 15              spotifast repeat
spotifast seek -- -15          spotifast show
spotifast now-playing [--raw]
```

`now-playing` prints one readable line. `--raw` prints the fields
tab-separated — state, title, artists, album, position_ms, duration_ms,
volume, shuffle, repeat — which is what the scripts read when they need one
value.

A verb exits non-zero and says so when Spotifast is not running.

## Linux

These scripts are macOS and Windows only. On Linux Spotifast is an MPRIS
player, so `playerctl --player=fastpotify play-pause` already does the same
job, and the verbs above refuse to run rather than duplicating it.
