#!/bin/bash

#SBATCH --job-name=parjulia
#SBATCH --account=open
#SBATCH --partition=open
#SBATCH --nodes=3
#SBATCH --ntasks-per-node=4
#SBATCH --mem=4GB
#SBATCH --time=00:20:00

# load julia
module load intel impi mkl julia
echo "Modules loaded:"
module list

# resource info
export OMP_NUM_THREADS=$(( SLURM_NNODES * SLURM_NTASKS_PER_NODE ))
export JULIA_NUM_THREADS=$(( SLURM_NNODES * SLURM_NTASKS_PER_NODE ))
echo "nodes = $SLURM_NNODES, tasks per node = $SLURM_NTASKS_PER_NODE"
echo "OMP_NUM_THREADS = $OMP_NUM_THREADS, JULIA_NUM_THREADS = $JULIA_NUM_THREADS"

# Run the job itself
julia parcheck.jl

echo "Job ${SLURM_JOB_NAME} ended at `date`"
