#!/bin/bash
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Previous Track
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon ⏮
# @raycast.packageName Fastpotify
#
# Documentation:
# @raycast.description Go back to the previous track in Fastpotify.
# @raycast.author Fastpotify

set -euo pipefail
source "$(dirname "$0")/_fastpotify.sh"

fp_announce previous
