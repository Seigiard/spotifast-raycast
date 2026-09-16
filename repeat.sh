#!/bin/bash
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Cycle Repeat
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🔁
# @raycast.packageName Fastpotify
#
# Documentation:
# @raycast.description Step Fastpotify through off, repeat all, and repeat one.
# @raycast.author Fastpotify

set -euo pipefail
source "$(dirname "$0")/_fastpotify.sh"

fp repeat
sleep 0.3
case "$(fp_field 9)" in
    track) echo "🔂 Repeat one" ;;
    context) echo "🔁 Repeat all" ;;
    off) echo "➡️ Repeat off" ;;
    *) echo "🔁 Repeat cycled" ;;
esac
