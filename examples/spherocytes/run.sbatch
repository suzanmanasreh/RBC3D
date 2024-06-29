#!/bin/bash

#SBATCH --account=gts-sbryngelson3
#SBATCH -N4 --ntasks-per-node=24
#SBATCH --mem-per-cpu=2G
#SBATCH -t8:00:00
#SBATCH -q embers
#SBATCH --mail-user=smanasreh6@gatech.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH -o "./run_logs/spheres4.log"

cd $SLURM_SUBMIT_DIR

cd ../..

ml gcc mvapich2 mkl netcdf-fortran fftw cmake

# ./rbc.sh cmake
cd build
# make -j 24
cd spherocytes

# srun ./sphere_init2
srun sphere_tube