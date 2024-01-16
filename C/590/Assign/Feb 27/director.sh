#!/bin/bash
# Asher Andargachew
# 501101885
# aandargachew@torontomu.ca
# Set up variables
numWorkers=$1
sPID=$2

#trap function for sigint
function finish {
    # terminate signals
    echo "Caught SIGINT signal!"
    for ((i=1; i <= numWorkers; i++))
    do
       kill -9 $((sPID+i))
    done

    # remove files
    for ((i=1; i <= numWorkers; i++))
    do
       rm worker_$i
    done
    echo "Done with clean-up. Program terminates."
    exit
}

#trap sigint
trap finish SIGINT

# Create the worker processes
echo "Creating $numWorkers processes...."
for ((i=1; i<=$numWorkers; i++))
do
    ./worker worker_$i $(($sPID+$i))
done

# Main loop
while [ true ]
do
    display
    sleep 1
done

# Displays the content of each worker's file
function display
{
    clear
    for ((i=1; i <= numWorkers; i++))
    do
       echo "Current file: worker_"$i
       cat worker_$i
    done
    echo 
}