#!/bin/bash

# Save the PID of the script itself
SCRIPT_PID=$1

# Function to monitor child processes
function monitor_children {
  # Get a list of child PIDs
  CHILD_PIDS=$(pgrep -P $SCRIPT_PID)

  # Loop through all child PIDs
  for pid in $CHILD_PIDS; do
    # Save the data of the child process
    echo "$(date): $(ps -p $pid -o cmd=)" >> child_processes.log
    sleep 2
    # Monitor the child process's children recursively
    monitor_children $pid
  done
}

# Start monitoring child processes
monitor_children $SCRIPT_PID

# Your script's logic here
# ...

# End of script
exit 0
