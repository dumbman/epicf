#ifndef _FIELD_SOLVER_H_
#define _FIELD_SOLVER_H_

#include <petscksp.h>
#include <boost/multi_array.hpp>
#include "spatial_mesh.h"

class Field_solver {
  public:
    Field_solver( Spatial_mesh &spat_mesh );
    void eval_potential( Spatial_mesh &spat_mesh );
    void eval_fields_from_potential( Spatial_mesh &spat_mesh );
    virtual ~Field_solver();
  private:
    Vec phi_vec, rhs;
    Mat A;
    KSP ksp;
    PC pc;
    PetscInt rstart, rend, nlocal;
    void alloc_petsc_vector( Vec *x, PetscInt size, const char *name );
    void get_vector_ownership_range_and_local_size_for_each_process(
	Vec *x, PetscInt *rstart, PetscInt *rend, PetscInt *nlocal );
    void alloc_petsc_matrix( Mat *A,
			     PetscInt nrow_local, PetscInt ncol_local,
			     PetscInt nrow, PetscInt ncol,
			     PetscInt nonzero_per_row );
    void alloc_petsc_matrix_seqaij( Mat *A, PetscInt nrow, PetscInt ncol, PetscInt nonzero_per_row );
    void construct_equation_matrix( Mat *A,
				    int nx, int ny, int nz,
				    double dx, double dy, double dz,
				    PetscInt nlocal, PetscInt rstart, PetscInt rend );
    void create_solver_and_preconditioner( KSP *ksp, PC *pc, Mat *A );
    void construct_d2dx2_in_3d( Mat *d2dx2_3d, int nx, int ny, int nz, PetscInt rstart, PetscInt rend  );
    void construct_d2dy2_in_3d( Mat *d2dy2_3d, int nx, int ny, int nz, PetscInt rstart, PetscInt rend  );
    void construct_d2dz2_in_3d( Mat *d2dz2_3d, int nx, int ny, int nz, PetscInt rstart, PetscInt rend  );
    void multiply_pattern_along_diagonal( Mat *result, Mat *pattern, int pattern_size, int n_times,
					  PetscInt rstart, PetscInt rend );
    void construct_d2dx2_in_2d( Mat *d2dx2, int nx, int ny );
    void construct_d2dy2_in_2d( Mat *d2dy2, int nx, int ny );
    // Solve potential
    void solve_poisson_eqn( Spatial_mesh &spat_mesh );
    void init_rhs_vector( Spatial_mesh &spat_mesh );
    int kronecker_delta( int i,  int j );
    void transfer_solution_to_spat_mesh( Spatial_mesh &spat_mesh );
    // Eval fields from potential
    double boundary_difference( double phi1, double phi2, double dx );
    double central_difference( double phi1, double phi2, double dx );
};

#endif /* _FIELD_SOLVER_H_ */
