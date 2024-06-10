#!/bin/bash

# salloc a node before you run this because petsc configure uses srun

# replace with equivalent modules on your cluster
# if module is not available, follow readme.md to manually install
ml gcc mvapich2 mkl python/3.9.12-rkxvr6 netcdf-c netcdf-cxx netcdf-fortran fftw

[[ "$(python3 -V)" =~ "Python 3" ]] && echo "Python 3 is installed"

# building and installing petsc 3.19.6 in packages directory
mkdir packages
cd packages

wget https://ftp.mcs.anl.gov/pub/petsc/petsc-3.19.tar.gz
tar -xvf petsc-3.19.tar.gz

pip3 install --user configure

cp ../install/py_scripts/petsc_configure.py ./petsc-3.19.6
cd petsc-3.19.6
python3 petsc_configure.py --mkl-only --dryrun
python3 petsc_configure.py --mkl-only

make PETSC_DIR=`pwd` PETSC_ARCH=petsc_configure all
make PETSC_DIR=`pwd` PETSC_ARCH=petsc_configure check

# build and install spherepack
cd ..
git clone https://github.com/comp-physics/spherepack3.2.git
cd spherepack3.2
make

# build and install makedepf90
cd ..
git clone https://github.com/comp-physics/makedepf90.git
cd makedepf90
# it works without setting prefix
make
make install