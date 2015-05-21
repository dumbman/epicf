#ifndef _SPATIAL_MESH_H_
#define _SPATIAL_MESH_H_

#include <math.h>
#include <stdlib.h>
#include <iostream>
#include <iomanip>
#include <boost/multi_array.hpp>
#include "config.h"
#include "vec2d.h"


class Spatial_mesh {
  public:
    double x_volume_size, y_volume_size;
    double x_cell_size, y_cell_size;
    int x_n_nodes, y_n_nodes;
    boost::multi_array<double, 2> charge_density;
    boost::multi_array<double, 2> potential;
    boost::multi_array<Vec2d, 2> electric_field;
  public:
    Spatial_mesh( Config &conf );
    void clear_old_density_values();
    void set_boundary_conditions( Config &conf );
    void print();
    void write_to_file( std::ofstream &output_file );
    virtual ~Spatial_mesh();
  private:
    // init
    void check_correctness_of_related_config_fields( Config &conf );
    void init_x_grid( Config &conf );
    void init_y_grid( Config &conf );
    void allocate_ongrid_values( );
    void set_boundary_conditions( const double phi_left, const double phi_right,
				  const double phi_top, const double phi_bottom );
    // print
    void print_grid( );
    void print_ongrid_values( );
    // config check
    void grid_x_size_gt_zero( Config &conf );
    void grid_x_step_gt_zero_le_grid_x_size( Config &conf );
    void grid_y_size_gt_zero( Config &conf );
    void grid_y_step_gt_zero_le_grid_y_size( Config &conf );
    void check_and_exit_if_not( const bool &should_be, const std::string &message );
};

#endif /* _SPATIAL_MESH_H_ */