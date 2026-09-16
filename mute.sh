#!/bin/bash
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle Mute
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🔇
# @raycast.packageName Fastpotify
#
# Documentation:
# @raycast.description Mute Fastpotify, or restore the volume it had.
# @raycast.author Fastpotify

set -euo pipefail
source "$(dirname "$0")/_fastpotify.sh"

fp mute
sleep 0.3
volume="$(fp_field 7)"
case "$volume" in
    0) echo "🔇 Muted" ;;
    "") echo "🔇 Mute toggled" ;;
    *) echo "🔊 ${volume}%" ;;
esac
