#!/bin/bash
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Play / Pause
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon ⏯
# @raycast.packageName Fastpotify
#
# Documentation:
# @raycast.description Toggle playback in Fastpotify.
# @raycast.author Fastpotify

set -euo pipefail
source "$(dirname "$0")/_fastpotify.sh"

fp play-pause
sleep 0.3
fp now-playing
