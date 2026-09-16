#!/bin/bash
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Decrease Volume
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🔉
# @raycast.packageName Fastpotify
# @raycast.argument1 { "type": "text", "placeholder": "percent", "optional": true }
#
# Documentation:
# @raycast.description Lower Fastpotify's volume, by 10 points unless told otherwise.
# @raycast.author Fastpotify

set -euo pipefail
source "$(dirname "$0")/_fastpotify.sh"

fp volume-down "${1:-10}"
sleep 0.3
volume="$(fp_field 7)"
echo "🔉 ${volume:-—}%"
