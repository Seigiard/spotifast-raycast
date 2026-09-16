#!/bin/bash
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Next Track
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon ⏭
# @raycast.packageName Fastpotify
#
# Documentation:
# @raycast.description Skip to the next track in Fastpotify.
# @raycast.author Fastpotify

set -euo pipefail
source "$(dirname "$0")/_fastpotify.sh"

fp_announce next
