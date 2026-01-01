#!/bin/bash
# Script to cycle focus between monitors in i3wm

# Get the currently focused workspace
focused_ws=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true) | .name')

# Get the output (monitor) that has this workspace
current_output=$(i3-msg -t get_workspaces | jq -r ".[] | select(.name==\"$focused_ws\") | .output")

# Get list of active outputs in order
outputs=$(i3-msg -t get_outputs | jq -r '.[] | select(.active==true) | .name')

# Convert outputs to array
output_array=($outputs)
num_outputs=${#output_array[@]}

# Find index of current output
current_index=-1
for i in "${!output_array[@]}"; do
    if [[ "${output_array[$i]}" == "$current_output" ]]; then
        current_index=$i
        break
    fi
done

# Calculate next output index (wrap around)
next_index=$(( (current_index + 1) % num_outputs ))
next_output="${output_array[$next_index]}"

# Focus the next output
i3-msg focus output "$next_output"
