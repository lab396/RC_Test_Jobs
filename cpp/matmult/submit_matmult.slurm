#!/bin/bash

#SBATCH --job-name=matmult_job
#SBATCH --account=open
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=4GB
#SBATCH --time=05:00

echo "Job started on `hostname` at `date`"

# Load software
module purge
module load gcc

# Compile and run
g++ matmult.cpp -o matmult
./matmult 1000 1200 1000

# Finish up
echo "Job Ended at `date`"
