#!/bin/bash
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Skip Forward
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon ⏩
# @raycast.packageName Fastpotify
# @raycast.argument1 { "type": "text", "placeholder": "seconds", "optional": true }
#
# Documentation:
# @raycast.description Jump forward in the current track, 15 seconds unless told otherwise.
# @raycast.author Fastpotify

set -euo pipefail
source "$(dirname "$0")/_fastpotify.sh"

fp seek "${1:-15}"
sleep 0.3
fp now-playing
