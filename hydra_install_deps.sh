# Create folder for output
mkdir out

# Install dependencies
module add openmpi/1.8.1
module add gcc-4.8

# Install PETSc
cd
mkdir petsc
mkdir petsc/debug
mkdir petsc/opt
### get source
#git clone -b maint https://bitbucket.org/petsc/petsc petsc
wget http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-3.6.2.tar.gz
tar -xvzf petsc-lite-3.6.2.tar.gz
cd petsc-3.6.2

### compile debug-version
PETSC_FLAGS="--with-cc=mpicc --with-cxx=mpic++ --with-fc=0 --with-clanguage=cxx \
        --download-hypre=yes \
        --download-metis=yes --download-parmetis=yes  --download-superlu_dist" 
        #--download-mumps=yes --with-scalapack --with-fc=gfortran \
./configure ${PETSC_FLAGS} --prefix=${HOME}/petsc/debug --with-debugging=1
make PETSC_DIR=${HOME}/petsc-3.6.2 PETSC_ARCH=arch-linux2-cxx-debug all
make PETSC_DIR=${HOME}/petsc-3.6.2 PETSC_ARCH=arch-linux2-cxx-debug test
make install DESTDIR=${HOME}/petsc/debug
#make distclean
cd ..
rm -rf petsc-3.6.2

### compile production-version
tar -xvzf petsc-lite-3.6.2.tar.gz
cd petsc-3.6.2
./configure ${PETSC_FLAGS} --prefix=${HOME}/petsc/opt --with-debugging=0
make PETSC_DIR=${HOME}/petsc-3.6.2 PETSC_ARCH=arch-linux2-cxx-opt all
make PETSC_DIR=${HOME}/petsc-3.6.2 PETSC_ARCH=arch-linux2-cxx-opt test
make install DESTDIR=${HOME}/petsc/opt
cd ../
rm -rf petsc-3.6.2
rm petsc-lite-3.6.2.tar.gz


# Install HDF5
cd
mkdir hdf5
cd hdf5
yumdownloader hdf5-openmpi-devel.x86_64 &&
yumdownloader hdf5-openmpi.x86_64 &&
for x in *.rpm; do rpm2cpio $x | cpio -idv ; done


# Install OCE
cd
mkdir OCE
cd OCE
yumdownloader OCE-devel.x86_64 &&
yumdownloader OCE-draw.x86_64 &&
yumdownloader OCE-foundation.x86_64 &&
yumdownloader OCE-modeling.x86_64 &&
yumdownloader OCE-ocaf.x86_64 &&
yumdownloader OCE-visualization.x86_64 &&
for x in *.rpm; do rpm2cpio $x | cpio -idv; done
