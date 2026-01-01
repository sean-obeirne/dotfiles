#!/bin/bash
# Script to cycle workspaces forward/backward within monitor bounds
# Usage: workspace-scroll.sh [forward|backward]

# Configuration: Define workspace ranges for each monitor
# Format: "output_name:start:end"
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

# Calculate next workspace
if [[ "$DIRECTION" == "forward" ]]; then
    NEXT_WS=$((CURRENT_WS + 1))
    if [[ $NEXT_WS -gt $MAX ]]; then
        exit 0  # Don't wrap, just stay at max
    fi
elif [[ "$DIRECTION" == "backward" ]]; then
    NEXT_WS=$((CURRENT_WS - 1))
    if [[ $NEXT_WS -lt $MIN ]]; then
        exit 0  # Don't wrap, just stay at min
    fi
else
    echo "Invalid direction: $DIRECTION. Use 'forward' or 'backward'"
    exit 1
fi

# Switch to the workspace
i3-msg workspace number "$NEXT_WS"

# Explicitly focus the output for this workspace to ensure dunst shows there
if [[ $NEXT_WS -ge 1 && $NEXT_WS -le 5 ]]; then
    i3-msg focus output "$PRIMARY_MONITOR"
else
    i3-msg focus output "$SECONDARY_MONITOR"
fi

# Show workspace status notification
# Get all workspaces in the current monitor's range and their status
WORKSPACE_STATUS=""
for ws in $(seq $MIN $MAX); do
    # Count windows in this workspace using get_tree
    NUM_WINDOWS=$(i3-msg -t get_tree | jq "[.. | select(.type? == \"workspace\" and .num? == $ws) | .. | select(.type? == \"con\" and .window? != null)] | length")
    
    # Only show workspace if it's the current one OR has windows
    if [[ $ws -eq $NEXT_WS ]]; then
        # Current workspace - always show it
        WORKSPACE_STATUS+="[${ws}] "
    elif [[ $NUM_WINDOWS -gt 0 ]]; then
        # Workspace has windows - show it
        WORKSPACE_STATUS+="${ws} "
    fi
done

# Send notification
# dunstify -t 1000 -u low -r 9999 "Workspace ${NEXT_WS}" "$WORKSPACE_STATUS"
# dunstify -t 1000 -u low -r 9999 "Workspace ${NEXT_WS}" "2"
dunstify -t 1000 -u low -r 9999 -h int:x-dunst-monitor:2 "Workspace ${NEXT_WS}" "$WORKSPACE_STATUS"