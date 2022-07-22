filename=${1}
pde_type=${2}
correction_parameter=${3}
numerical_flux=${4}
SGS_model_type=${5}
poly_degree=${6}
cfl_number=${7}
unsteady_data_filename=${8}
number_of_grid_elements_per_dimension=${9}
density_initial_condition_type=${10}
echo "Creating ${filename} ..."
if test -f "${filename}"; then
	rm ${filename}
fi
touch ${filename}
echo "# Listing of Parameters">>${filename}
echo "# ---------------------">>${filename}
echo "# Number of dimensions">>${filename}
echo " ">>${filename}
echo "set dimension = 3">>${filename}
echo "set run_type = flow_simulation">>${filename}
echo "set pde_type = ${pde_type}">>${filename}
echo "set model_type = large_eddy_simulation">>${filename}
echo "set solution_vtk_files_directory_name = ./solution_files">>${filename}
echo " ">>${filename}
echo "# DG formulation">>${filename}
echo "set use_weak_form = false">>${filename}
echo "set use_collocated_nodes = true">>${filename}
echo "set use_split_form = true">>${filename}
echo "set use_classical_FR = false">>${filename}
echo "set flux_reconstruction = ${correction_parameter}">>${filename}
echo "set use_inverse_mass_on_the_fly = true">>${filename}
echo " ">>${filename}
echo "# numerical fluxes">>${filename}
echo "set conv_num_flux = ${numerical_flux}">>${filename}
echo "set diss_num_flux = symm_internal_penalty">>${filename}
echo " ">>${filename}
echo "# ODE solver">>${filename}
echo "subsection ODE solver">>${filename}
echo "  set ode_output = quiet">>${filename}
echo "  set ode_solver_type = explicit">>${filename}
echo "  set output_solution_every_dt_time_intervals = 0.0">>${filename}
echo "  subsection explicit solver options">>${filename}
echo "    set runge_kutta_order = 4">>${filename}
echo "  end">>${filename}
echo "end">>${filename}
echo " ">>${filename}
echo "# freestream Mach number">>${filename}
echo "subsection euler">>${filename}
echo "  set mach_infinity = 0.1">>${filename}
echo "end">>${filename}
echo " ">>${filename}
echo "# freestream Reynolds number and Prandtl number">>${filename}
echo "subsection navier_stokes">>${filename}
echo "  set prandtl_number = 0.71">>${filename}
echo "  set reynolds_number_inf = 1600.0">>${filename}
echo "end">>${filename}
echo " ">>${filename}
echo "# Physics Model (if pde_type == physics_model)">>${filename}
echo "subsection physics_model">>${filename}
echo "  subsection large_eddy_simulation">>${filename}
echo "    set euler_turbulence = false">>${filename}
echo "    set SGS_model_type = ${SGS_model_type}">>${filename}
echo "    set turbulent_prandtl_number = 0.6">>${filename}
echo "    set smagorinsky_model_constant = 0.12">>${filename}
echo "    set WALE_model_constant = 0.5">>${filename}
echo "    set vreman_model_constant = 0.036">>${filename}
echo "    set ratio_of_filter_width_to_cell_size = 1.0">>${filename}
echo "  end">>${filename}
echo "end">>${filename}
echo " ">>${filename}
echo "# Flow Solver">>${filename}
echo "subsection flow_solver">>${filename}
echo "  set flow_case_type = taylor_green_vortex">>${filename}
echo "  set poly_degree = ${poly_degree}">>${filename}
echo "  set final_time = 20.0">>${filename}
echo "  set courant_friedrich_lewy_number = ${cfl_number}">>${filename}
echo "  set adaptive_time_step = true">>${filename}
echo "  set unsteady_data_table_filename = ${unsteady_data_filename}">>${filename}
echo "  set output_restart_files = false">>${filename}
echo "  set restart_files_directory_name = restart_files">>${filename}
echo "  set output_restart_files_every_dt_time_intervals = 1.0">>${filename}
echo "  subsection grid">>${filename}
echo "    set grid_degree = 1">>${filename}
echo "    set grid_left_bound = 0.0">>${filename}
echo "    set grid_right_bound = 6.28318530717958623200">>${filename}
echo "    set number_of_grid_elements_per_dimension = ${number_of_grid_elements_per_dimension}">>${filename}
echo "  end">>${filename}
echo "  subsection taylor_green_vortex">>${filename}
echo "    set density_initial_condition_type = ${density_initial_condition_type}">>${filename}
echo "  end">>${filename}
echo "end">>${filename}
echo "done."