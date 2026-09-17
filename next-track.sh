#!/bin/bash
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Next Track
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon ⏭
# @raycast.packageName Spotifast
#
# Documentation:
# @raycast.description Skip to the next track in Spotifast.
# @raycast.author Spotifast

set -euo pipefail
source "$(dirname "$0")/_spotifast.sh"

fp_announce next
