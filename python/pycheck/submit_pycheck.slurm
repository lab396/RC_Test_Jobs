#!/bin/bash

#### Scheduler Directives ####

#SBATCH --job-name=pycheck
#SBATCH --account=open
#SBATCH --partition=open
#SBATCH --nodes=1
#SBATCH --ntasks_per_node=1
#SBATCH --mem=1GB
#SBATCH --time=00:05:00


#### Job is launched when placed on compute nodes ####
echo " "
echo "Job started at `date` on `hostname`"
echo " "
start=`date +%N`
totalcores=$(( $PBS_NUM_NODES * $PBS_NUM_PPN ))


#### Initialize Software Environment and Parameters ####

# Verify python version
pyver=$( python --version )

# Use original submission directory as the working directory
cd $PBS_O_WORKDIR

# Set input/output, if necessary
pyinput='in_pycheck.csv'
pyoutput='out_pycheck.txt'


#### Execute your job ####

python pycheck.py > $pyoutput

end=`date +%N`
runtime_ns=$(( end - start ))
runtime_ms=$(( $runtime_ns / 1000000 ))
echo "Job ended at $(date)"


#### Job Output ####

echo " "
echo "Cores per node:  $PBS_NUM_PPN"
echo "Total cores:     $totalcores"
echo "Runtime [ms]:    $runtime_ms"
echo "Input file:      $pyinput"
echo "Output file:     $pyoutput"
echo "Python verion:   $pyver"
echo " "

