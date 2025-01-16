#!/bin/bash

#SBATCH --job-name=tftest
#SBATCH --account=open
#SBATCH --partition=open
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=00:10:00

# Get started
echo " "
echo "Job started on `hostname` at `date`"
echo " "

python tftest.py

# Finish up
echo " "
echo "Job Ended at `date`"
echo " "
