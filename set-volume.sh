#!/bin/bash
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Set Volume
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🎚
# @raycast.packageName Fastpotify
# @raycast.argument1 { "type": "text", "placeholder": "0-100" }
#
# Documentation:
# @raycast.description Set Fastpotify's volume to a percentage.
# @raycast.author Fastpotify

set -euo pipefail
source "$(dirname "$0")/_fastpotify.sh"

fp volume "$1"
sleep 0.3
volume="$(fp_field 7)"
echo "🎚 ${volume:-$1}%"
