#!/bin/bash
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Increase Volume
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🔊
# @raycast.packageName Spotifast
# @raycast.argument1 { "type": "text", "placeholder": "percent", "optional": true }
#
# Documentation:
# @raycast.description Raise Spotifast's volume, by 10 points unless told otherwise.
# @raycast.author Spotifast

set -euo pipefail
source "$(dirname "$0")/_spotifast.sh"

fp volume-up "${1:-10}"
sleep 0.3
volume="$(fp_field 7)"
echo "🔊 ${volume:-—}%"
