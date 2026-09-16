#!/bin/bash
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Fastpotify
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🪟
# @raycast.packageName Fastpotify
#
# Documentation:
# @raycast.description Bring the Fastpotify window forward, starting it if it is not running.
# @raycast.author Fastpotify

set -euo pipefail
source "$(dirname "$0")/_fastpotify.sh"

# `show` reaches a running instance. Nothing answers when the app is not
# running, so launch it the way the Dock would.
if ! fp show 2>/dev/null; then
    open -a Fastpotify
fi
