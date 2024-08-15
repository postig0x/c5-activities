#!/bin/bash

# Function to create a zombie process
create_zombie() {
    bash -c "( (sleep 5; exit 0) & ); sleep 10" &
    echo "Zombie process created. Parent PID: $!"
}

# Function to create a high CPU usage process
create_high_cpu() {
    bash -c "while true; do echo 'High CPU usage' > /dev/null; done" &
    echo "High CPU usage process created. PID: $!"
}

# Function to create a high memory usage process
create_high_memory() {
    bash -c "while true; do memory=$(dd if=/dev/zero bs=10M count=100 2>/dev/null); sleep 1; done" &
    echo "High memory usage process created. PID: $!"
}

# Main script
echo "Creating different types of processes..."

create_zombie
zombie_parent=$!

create_high_cpu
high_cpu_pid=$!

create_high_memory
high_memory_pid=$!

echo "Processes created. Use 'ps' commands to observe them."
echo "For example:"
echo "  ps aux | grep -E 'zombie|High CPU|High memory'"
echo "  ps -eo pid,ppid,cmd,stat"
echo "  top -b -n 1"

echo "Press Enter to terminate the high CPU and high memory processes..."
read

kill $high_cpu_pid
kill $high_memory_pid

echo "High CPU and high memory processes terminated."
echo "The zombie process will clean up on its own after a short while."

echo "Script completed. You can continue to observe the processes."
