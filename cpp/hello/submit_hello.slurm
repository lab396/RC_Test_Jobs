#!/bin/bash

#SBATCH --job-name=hello
#SBATCH --account=open
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=1GB
#SBATCH --time=05:00

echo "Job started on `hostname` at `date`"

# Load software
module purge
module load gcc

# Compile and run
g++ hello.cpp -o hello
./hello

# Finish up
echo "Job Ended at `date`"
