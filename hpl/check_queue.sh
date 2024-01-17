#!/bin/bash

clear

# Infinite loop to check job queue status every 10 seconds
while true; do
    echo "Checking SLURM job queue:"
    squeue --me # Display the job queue for the current user
    echo ; echo
    sleep 10        # Wait for 10 seconds before the next check
done

