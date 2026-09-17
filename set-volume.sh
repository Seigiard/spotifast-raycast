#!/bin/bash
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Set Volume
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🎚
# @raycast.packageName Spotifast
# @raycast.argument1 { "type": "text", "placeholder": "0-100" }
#
# Documentation:
# @raycast.description Set Spotifast's volume to a percentage.
# @raycast.author Spotifast

set -euo pipefail
source "$(dirname "$0")/_spotifast.sh"

fp volume "$1"
sleep 0.3
volume="$(fp_field 7)"
echo "🎚 ${volume:-$1}%"
