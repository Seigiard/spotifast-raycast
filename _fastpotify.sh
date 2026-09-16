#!/bin/bash
# Shared by the Fastpotify Raycast scripts. Not a command itself: it carries
# no @raycast metadata, so Raycast lists everything here except this file.
#
# Every command is `fastpotify <verb>` against the running app, so a script
# is one line and Raycast never has to know the protocol.

# Where the binary is. Set FASTPOTIFY_BIN to override, e.g. for a build that
# is not the installed one.
if [ -z "${FASTPOTIFY_BIN:-}" ]; then
    for candidate in \
        "$(command -v fastpotify 2>/dev/null)" \
        "/Applications/Fastpotify.app/Contents/MacOS/fastpotify" \
        "$HOME/Applications/Fastpotify.app/Contents/MacOS/fastpotify"; do
        if [ -n "$candidate" ] && [ -x "$candidate" ]; then
            FASTPOTIFY_BIN="$candidate"
            break
        fi
    done
fi

fp() {
    if [ -z "${FASTPOTIFY_BIN:-}" ]; then
        echo "Fastpotify is not installed"
        exit 1
    fi
    "$FASTPOTIFY_BIN" "$@"
}

# One field of the raw snapshot: 1 state, 2 title, 3 artists, 4 album,
# 5 position_ms, 6 duration_ms, 7 volume, 8 shuffle, 9 repeat.
#
# With nothing playing the app answers with a single word and no fields at
# all, and `cut -s` returns nothing rather than handing back that word as if
# it were the value asked for.
fp_field() {
    fp now-playing --raw 2>/dev/null | cut -s -f"$1"
}

# The current track's title, or empty when nothing plays.
fp_title() {
    fp_field 2
}

# Runs a track-changing command and prints whatever is playing afterwards.
# The app reports a command it has already carried out a moment later, and a
# HUD showing the previous track would read as the command having missed.
fp_announce() {
    local before after
    before="$(fp_title)"
    fp "$@" || exit $?
    for _ in 1 2 3 4 5 6; do
        sleep 0.25
        after="$(fp_title)"
        [ "$after" != "$before" ] && break
    done
    fp now-playing
}
