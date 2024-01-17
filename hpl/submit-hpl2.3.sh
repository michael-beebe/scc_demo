#!/bin/bash

#SBATCH --job-name=hpl
#SBATCH --partition=nocona
#SBATCH --nodes=2
#SBATCH --exclusive
#SBATCH --ntasks-per-node=32
#SBATCH --cpus-per-task=2
#SBATCH --time=0:30:00
#SBATCH --output=%j.%N.out
#SBATCH --error=%j.%N.err

echo "SLURM_JOB_NODELIST = $SLURM_JOB_NODELIST"
echo "SLURM_JOB_NUM_NODES = $SLURM_JOB_NUM_NODES"
echo "SLURM_NTASKS = $SLURM_NTASKS"

ml gcc/10.1.0 openmpi/3.1.6 hpl/2.3-openmp

export OMP_NUM_THREADS=2
mpirun --mca btl self,vader --map-by l3cache xhpl
# mpirun xhpl

