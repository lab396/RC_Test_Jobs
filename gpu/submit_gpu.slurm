#!/bin/bash

#SBATCH --job-name=gpu_check
#SBATCH --partition=sla-prio
#SBATCH --account=dml129-engagement_gpu
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --gpus=1
#SBATCH --mem=1gb
#SBATCH --time=00:05:00
#SBATCH --error=gpu_check.%j.err
#SBATCH --output=gpu_check.%j.log


echo "Job started at `date` on `hostname`"

nvidia-smi
sleep 5m

echo "Job complete at `date`"
