#!/bin/bash
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Skip Forward
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon ⏩
# @raycast.packageName Spotifast
# @raycast.argument1 { "type": "text", "placeholder": "seconds", "optional": true }
#
# Documentation:
# @raycast.description Jump forward in the current track, 15 seconds unless told otherwise.
# @raycast.author Spotifast

set -euo pipefail
source "$(dirname "$0")/_spotifast.sh"

fp seek "${1:-15}"
sleep 0.3
fp now-playing
