#!/bin/bash

# Total duration to run the stress test (in seconds)
TOTAL_DURATION=900  # 15 minutes

# Spike duration (in seconds)
SPIKE_DURATION=600 # 10 minutes

# Rest duration (in seconds)
REST_DURATION=30 # 1/2 minute

# Stress the CPU with 3 workers
CPU_WORKERS=3

# Function to start stress test
echo "Starting stress test spike for $SPIKE_DURATION seconds..."
stress --cpu $CPU_WORKERS --timeout $SPIKE_DURATION & STRESS_PID=$! #STRESS_PID is an environment variable assignment of process ID (PID) of the last background process that was run 
