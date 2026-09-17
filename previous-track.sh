#!/bin/bash
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Previous Track
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon ⏮
# @raycast.packageName Spotifast
#
# Documentation:
# @raycast.description Go back to the previous track in Spotifast.
# @raycast.author Spotifast

set -euo pipefail
source "$(dirname "$0")/_spotifast.sh"

fp_announce previous
