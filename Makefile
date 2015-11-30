### Allows better regexp support.
SHELL:=/bin/bash -O extglob

##### Compilers
##### Prll
#export OMPI_CXX=clang++
CC = mpic++
#CC = mpiicpc 
HDF5FLAGS=-isystem${HOME}/hdf5/usr/include/openmpi-x86_64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_BSD_SOURCE 
PETSCFLAGS=-isystem${HOME}/petsc/arch-linux2-cxx-debug/include/ -isystem${HOME}/petsc/include/
OCEFLAGS=-isystem${HOME}/OCE/usr/include/oce -isystem${HOME}/OCE/usr/include
WARNINGS=-Wall -fbounds-check -Warray-bounds -fsanitize=address
CFLAGS = ${HDF5FLAGS} ${PETSCFLAGS} ${OCEFLAGS} -O2 -std=c++11
LDFLAGS = 

### Libraries
COMMONLIBS=-lm
BOOSTLIBS=-lboost_program_options
PETSCLIBS=-L${HOME}/petsc/arch-linux2-cxx-debug/lib/ -lpetsc
OPENCASCADELIBS=-L${HOME}/OCE/usr/lib64 -lTKXSBase -lTKernel -lTKBRep -lTKMath -lTKSTEP -lTKBool -lTKTopAlgo -lTKPrim -Wl,-rpath -Wl,${HOME}/OCE/usr/lib64
HDF5LIBS=-L${HOME}/hdf5/usr/lib64/openmpi/lib -lhdf5_hl -lhdf5 -Wl,-z,relro -lpthread -lz -ldl -lm -Wl,-rpath -Wl,${HOME}/hdf5/usr/lib64/openmpi/lib
LIBS=${COMMONLIBS} ${BOOSTLIBS} ${PETSCLIBS} ${OPENCASCADELIBS} ${HDF5LIBS}


### Sources and executable
CPPSOURCES=$(wildcard *.cpp)
CPPHEADERS=$(wildcard *.h)
OBJECTS=$(CPPSOURCES:%.cpp=%.o)
EXECUTABLE=epicf.out
MAKE=make
SUBDIRS=doc

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@ $(LIBS)

$(OBJECTS):%.o:%.cpp $(CPPHEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: allsubdirs $(SUBDIRS) clean cleansubdirs cleanall

allsubdirs: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

all: $(EXECUTABLE) doc

clean: 
	rm -f *.o *.out *.mod *.zip

cleansubdirs:
	for X in $(SUBDIRS); do $(MAKE) clean -C $$X; done 

cleanall: clean cleansubdirs

