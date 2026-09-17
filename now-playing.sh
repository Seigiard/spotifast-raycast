#!/bin/bash
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Now Playing
# @raycast.mode inline
#
# Optional parameters:
# @raycast.icon 🎧
# @raycast.packageName Spotifast
# @raycast.refreshTime 10s
#
# Documentation:
# @raycast.description Show the track Spotifast is playing.
# @raycast.author Spotifast

set -euo pipefail
source "$(dirname "$0")/_spotifast.sh"

fp now-playing
