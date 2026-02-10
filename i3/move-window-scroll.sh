#!/bin/bash
# Script to move focused window to next/previous workspace within monitor bounds
# Usage: move-window-scroll.sh [forward|backward]

# Configuration: Define workspace ranges for each monitor
PRIMARY_MONITOR="DP-4"    # Primary monitor
PRIMARY_RANGE="1:5"       # Workspaces 1-5
SECONDARY_MONITOR="DP-2"  # Secondary monitor
SECONDARY_RANGE="6:10"    # Workspaces 6-10

DIRECTION="${1:-forward}"

# Get current workspace and focused output
CURRENT_WS=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true) | .num')
FOCUSED_OUTPUT=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true) | .output')

# Determine workspace range based on focused monitor
if [[ "$FOCUSED_OUTPUT" == "$PRIMARY_MONITOR" ]]; then
    IFS=':' read -r MIN MAX <<< "$PRIMARY_RANGE"
elif [[ "$FOCUSED_OUTPUT" == "$SECONDARY_MONITOR" ]]; then
    IFS=':' read -r MIN MAX <<< "$SECONDARY_RANGE"
else
    echo "Unknown monitor: $FOCUSED_OUTPUT"
    exit 1
fi

# Calculate target workspace
if [[ "$DIRECTION" == "forward" ]]; then
    TARGET_WS=$((CURRENT_WS + 1))
    if [[ $TARGET_WS -gt $MAX ]]; then
        exit 0  # Don't move beyond max
    fi
elif [[ "$DIRECTION" == "backward" ]]; then
    TARGET_WS=$((CURRENT_WS - 1))
    if [[ $TARGET_WS -lt $MIN ]]; then
        exit 0  # Don't move beyond min
    fi
else
    echo "Invalid direction: $DIRECTION. Use 'forward' or 'backward'"
    exit 1
fi

# Move container to target workspace and follow it
i3-msg move container to workspace number "$TARGET_WS"
i3-msg workspace number "$TARGET_WS"
