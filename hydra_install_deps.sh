# Install PETSc
module add openmpi/1.8.1
cd
#git clone -b maint https://bitbucket.org/petsc/petsc petsc
wget http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-3.6.2.tar.gz
tar -xvzf petsc-lite-3.6.2.tar.gz
rm petsc-lite-3.6.2.tar.gz
mv petsc-3.6.2 petsc
cd petsc
./configure --with-cc=mpicc --with-cxx=mpic++ --with-fc=0 --with-clanguage=cxx
make PETSC_DIR=${HOME}/petsc PETSC_ARCH=arch-linux2-cxx-debug all
make PETSC_DIR=${HOME}/petsc PETSC_ARCH=arch-linux2-cxx-debug test

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
