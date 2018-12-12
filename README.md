Ef is a software for charged particles dynamics simulation.
It's primary areas of application are accelerator science and plasma physics. 

Ef focuses on nonrelativistic energies. 
Currently, particular emphasis is placed on low-energy beams, such that can be found in ion sources and electron guns.

Particles dynamics is traced under action of external electromagnetic fields. 
Particle self-interaction is taken into account with [particle-in-cell](https://en.wikipedia.org/wiki/Particle-in-cell) method.

Attention is given to integration with CAD software to allow for simulation of complex real-life experimental setups.
An experimental plugin for [FreeCAD](http://www.freecadweb.org/) exists.

Ef is a free software -- it's source code is open and avaible for modification and redistribution. 
It is written mostly in C++. 
Basic MPI support allows to take advantage of parallel execution in multiprocessor environment.

[Development goals](https://github.com/epicf/ef/wiki/1-Rationale-and-Aims) 
and 
[current features](https://github.com/epicf/ef/wiki/3-Feature-Matrix-and-Development-Roadmap) 
are described in detail in appropriate wiki sections,
as well as [installation procedure](https://github.com/epicf/ef/wiki/4-Installation). 
Some usage [examples](https://github.com/epicf/ef/wiki/Examples) are also given.
=======
Ef is a software for simulation of charged particles dynamics. It's primary areas of application are accelerator science and plasma physics. Below are several examples of the simulations that can be done with this program:

<p align="center">
<a href="https://github.com/epicf/ef/wiki/Single-Particle-In-Uniform-Magnetic-Field"><img src="https://github.com/epicf/ef/blob/dev/doc/figs/single_particle_in_magnetic_field/3d.png" width="400"/></a>
<a href="https://github.com/epicf/ef/wiki/Ribbon-Beam-Contour"><img src="https://raw.githubusercontent.com/epicf/ef/dev/doc/figs/ribbon_beam_contour/countour_beam.png" width="250"/>
</a>
<br>
<a href="https://github.com/epicf/ef/wiki/Single-Particle-In-Uniform-Magnetic-Field">Single particle in uniform magnetic field;</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="https://github.com/epicf/ef/wiki/Ribbon-Beam-Contour">Widening of a ribbon beam during the propagation</a>
</p>

<p align="center">
<br>
<a href="https://github.com/epicf/ef/wiki/Contour-of-Ribbon-Beam-In-Uniform-Magnetic-Field"><img src="https://github.com/epicf/ef/raw/dev/doc/figs/ribbon_beam_in_magnetic_field_contour/mgn_field_ribbon_contour.png" width="300"/></a>
<br>
<a href="https://github.com/epicf/ef/wiki/Contour-of-Ribbon-Beam-In-Uniform-Magnetic-Field">Ribbon beam in uniform magnetic field</a>
</p>

<p align="center">
<br>
<a href="https://github.com/epicf/ef/wiki/Potential-well-of-cylindrical-beam-in-tube"><img src="https://github.com/epicf/ef/blob/dev/doc/figs/potential_well_of_beam_in_tube/potential.png" width="300"/></a>
<a href="https://github.com/epicf/ef/wiki/Child-Langmuir-Law-for-Planar-Diode"><img src="https://github.com/epicf/ef/blob/dev/doc/figs/ex5_diode_childs_law/diode_VC.png" width="300"/></a>
<br>
<a href="https://github.com/epicf/ef/wiki/Potential-well-of-cylindrical-beam-in-tube">Potential of electron beam inside conducting tube;</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="https://github.com/epicf/ef/wiki/Child-Langmuir-Law-for-Planar-Diode">Volt-Ampere characteristic of a planar diode</a>
</p>

Ef focuses on nonrelativistic energies.
Particular emphasis is placed on low-energy beams, such that can be found in ion sources and electron guns.
A motivation behind the program, the scope and the general goals are discussed [here](https://github.com/epicf/ef/wiki/Motivation-and-Goals).

Particles dynamics is traced under action of external electromagnetic fields. 
Particle self-interaction is taken into account with [particle-in-cell](https://github.com/epicf/ef/wiki/What-It-Is-and-How-It-Works#intuitive-introduction-to-particle-in-cell-method) method. Detailed description of the mathematical model can be found [here](https://github.com/epicf/ef/wiki/What-It-Is-and-How-It-Works#mathematical-model-description).

Attention is given to integration with CAD software to allow for simulation of complex real-life experimental setups.
An experimental plugin for FreeCAD [exists](https://github.com/epicf/ef/wiki/Freecad-and-Paraview).


Ef is a free software -- it's source code is open and avaible for
modification and redistribution.
Python (this one) and [C++](https://github.com/epicf/ef) versions are available.
Python version is easy to install and experiment with.
It's speed should be sufficient to perform example computations and small-scale
simulations but for large-scale simulations C++ version is the choice.


[Current features](https://github.com/epicf/ef/wiki/Current-Features-and-Development-Roadmap) 
are described in detail in appropriate wiki sections,
as well as [installation procedure](https://github.com/epicf/ef/wiki/Installation). 
Some usage [examples](https://github.com/epicf/ef/wiki/Examples) are also given.

