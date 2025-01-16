#!/bin/bash 

#SBATCH --job-name=starjob
#SBATCH --nodes=2 
#SBATCH --ntasks-per-node=24 
#SBATCH --mem=16GB
#SBATCH --time=01:00:00 
#SBATCH --partition=open 

module load starccm/17.06.008-R8

NODEFILE="$(pwd)/slurmhosts.$SLURM_JOB_ID.txt"
srun /bin/hostname -s &> $NODEFILE
NTASKS=`echo $NODEFILE | wc -l`

starccm+ -batch -np ${NTASKS} -machinefile ${NODEFILE} Test.sim >&output_1706.txt
