#!/bin/bash
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Now Playing
# @raycast.mode inline
#
# Optional parameters:
# @raycast.icon 🎧
# @raycast.packageName Fastpotify
# @raycast.refreshTime 10s
#
# Documentation:
# @raycast.description Show the track Fastpotify is playing.
# @raycast.author Fastpotify

set -euo pipefail
source "$(dirname "$0")/_fastpotify.sh"

fp now-playing
