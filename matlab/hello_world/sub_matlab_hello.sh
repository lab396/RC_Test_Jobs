#!/bin/bash

# Hello world Matlab script with Slurm

#SBATCH -J hello
#SBATCH -A open
#SBATCH -p open
#SBATCH -c 1                              # one core per task
#SBATCH -t 1:00:00
##SBATCH --mem=1gb
#SBATCH -o hello-%j.out

# Load software (Matlab default is R2019b)
module load matlab

# Run hello world script
srun matlab -nodesktop < hello.m
