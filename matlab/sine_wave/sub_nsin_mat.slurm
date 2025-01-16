#!/bin/bash

#SBATCH --job-name=matlab_test
#SBATCH --account=icds_internal_use
#SBATCH --partition=sla-prio
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --mem-per-cpu=4GB
#SBATCH --time=20:00:00
#SBATCH --output=%x.%j.out

module load matlab
matlab -batch read_nsin
