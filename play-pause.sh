#!/bin/bash
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Play / Pause
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon ⏯
# @raycast.packageName Spotifast
#
# Documentation:
# @raycast.description Toggle playback in Spotifast.
# @raycast.author Spotifast

set -euo pipefail
source "$(dirname "$0")/_spotifast.sh"

fp play-pause
sleep 0.3
fp now-playing
