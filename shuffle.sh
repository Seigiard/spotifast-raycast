#!/bin/bash
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle Shuffle
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🔀
# @raycast.packageName Fastpotify
#
# Documentation:
# @raycast.description Turn shuffle on or off in Fastpotify.
# @raycast.author Fastpotify

set -euo pipefail
source "$(dirname "$0")/_fastpotify.sh"

fp shuffle
sleep 0.3
case "$(fp_field 8)" in
    on) echo "🔀 Shuffle on" ;;
    off) echo "➡️ Shuffle off" ;;
    *) echo "🔀 Shuffle toggled" ;;
esac
