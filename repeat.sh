#!/bin/bash
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Cycle Repeat
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🔁
# @raycast.packageName Spotifast
#
# Documentation:
# @raycast.description Step Spotifast through off, repeat all, and repeat one.
# @raycast.author Spotifast

set -euo pipefail
source "$(dirname "$0")/_spotifast.sh"

fp repeat
sleep 0.3
case "$(fp_field 9)" in
    track) echo "🔂 Repeat one" ;;
    context) echo "🔁 Repeat all" ;;
    off) echo "➡️ Repeat off" ;;
    *) echo "🔁 Repeat cycled" ;;
esac
