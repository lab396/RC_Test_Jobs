#!/bin/bash

# Example of running python script with a job array

#SBATCH -J hello
#SBATCH --partition=open
#SBATCH --account=open
#SBATCH --array=1-50                    # how many tasks in the array
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=8G
#SBATCH -t 10:00
#SBATCH -o hello-%j-%a.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lab396@psu.edu

# Load software
module load anaconda3

# Run python script with a command line argument
srun python pyarray.py $SLURM_ARRAY_TASK_ID
