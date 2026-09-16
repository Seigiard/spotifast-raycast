# Fastpotify in Raycast

Raycast script commands for the running Fastpotify: play/pause, next,
previous, seek, volume, shuffle, repeat, and the playing track. They are thin
wrappers around `fastpotify <verb>`, which talks to the instance already
running rather than starting a second one.

## Installation

### Requirements

- macOS with [Raycast](https://www.raycast.com/) installed;
- Fastpotify installed in `/Applications/Fastpotify.app` (or a custom binary
  selected with `FASTPOTIFY_BIN`);
- a Fastpotify build that supports the remote-control verbs listed below.

### Add the commands to Raycast

1. Clone this repository into a permanent directory:

   ```bash
   mkdir -p ~/Raycast
   git clone https://github.com/Seigiard/fastpotify-raycast.git ~/Raycast/fastpotify-raycast
   ```

2. Open **Raycast Settings → Extensions → Script Commands**.
3. Click **Add Directories** and choose `~/Raycast/fastpotify-raycast`.
4. Search Raycast for `Fastpotify`. Optionally assign aliases or hotkeys to
   commands such as **Play / Pause**, **Next Track**, and **Now Playing**.

To install updates later, run:

```bash
git -C ~/Raycast/fastpotify-raycast pull
```

The scripts find the binary inside `/Applications/Fastpotify.app`. If your
binary is elsewhere, set `FASTPOTIFY_BIN` in the environment Raycast uses.

They need a Fastpotify that answers the verbs below. That is not in a
released build yet. The proposed upstream change was
[Fastpotify PR #34](https://github.com/crmne/spotifast/pull/34), which was
closed without merging. Installing a released build over a compatible custom
build removes the verbs, and the scripts will report "Fastpotify is not
installed" or "not running, or predates remote control".

## The commands underneath

Every script is `fastpotify <verb>`, so the same verbs work from a terminal,
a launcher, or a keyboard shortcut tool:

```
fastpotify play-pause          fastpotify volume 40
fastpotify play                fastpotify volume-up [percent]
fastpotify pause               fastpotify volume-down [percent]
fastpotify next                fastpotify mute
fastpotify previous            fastpotify shuffle
fastpotify seek 15             fastpotify repeat
fastpotify seek -- -15         fastpotify show
fastpotify now-playing [--raw]
```

`now-playing` prints one readable line. `--raw` prints the fields
tab-separated — state, title, artists, album, position_ms, duration_ms,
volume, shuffle, repeat — which is what the scripts read when they need one
value.

A verb exits non-zero and says so when Fastpotify is not running.

## Linux

These scripts are macOS and Windows only. On Linux Fastpotify is an MPRIS
player, so `playerctl --player=fastpotify play-pause` already does the same
job, and the verbs above refuse to run rather than duplicating it.
