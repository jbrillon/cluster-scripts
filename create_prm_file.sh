filename=${1}
pde_type=${2}
correction_parameter=${3}
numerical_flux=${4}
SGS_model_type=${5}
poly_degree_=${6}
unsteady_data_filename=${7}
number_of_grid_elements_per_dimension_=${8}
two_point_flux_type=${9}
flow_case_type=${10}
run_standard_dg=${11}
overintegration=${12}
flux_nodes_type=${13}
SGS_model_constant=${14}
physics_model_type=${15}
cfl_number=${16}
final_time=${17}
# determine if using standard DG or split form
if [ ${run_standard_dg} == "true" ]; then
    use_split_form="false"
else 
    use_split_form="true"
fi

# Flow + LES variables
# -- Common values
smagorinsky_model_constant=${SGS_model_constant} #"0.12" -- DHIT, 0.1 TGV
WALE_model_constant=${SGS_model_constant} #"0.5"
vreman_model_constant=${SGS_model_constant} #"0.036"
reference_length="1.0" # note: this actually serves no purpose in PHiLiP
constant_time_step="0"
do_compute_unsteady_data_and_write_to_table="true"
# -- Case specific values
if [ ${flow_case_type} == "TGV" ]; then
    flow_case_type_long="taylor_green_vortex"
    density_initial_condition_type="isothermal"
    # cfl_number="0.1"
    mach_infinity="0.1"
    reynolds_number_inf="1600.0"
    prandtl_number="0.71"
    temperature_inf="273.15"
    # final_time="20.001"
    #final_time="10.001"
    grid_left_bound="-3.141592653589793238"
    grid_right_bound="3.141592653589793238"
    # apply_initial_condition_method="interpolate_initial_condition_function"
    apply_initial_condition_method="project_initial_condition_function"
    input_flow_setup_filename_prefix="setup"
    output_velocity_field_times_string="8.0 9.0 "
    output_vorticity_magnitude_field_in_addition_to_velocity="true"
    all_boundaries_are_periodic="true"
    # LES parameters
    turbulent_prandtl_number="0.6"
    ratio_of_filter_width_to_cell_size="1.0"
    # solution output
    output_solution_fixed_times_string="4.0 5.0 8.0 9.0 10.0 12.0 15.0 16.0 20.0 "
    output_solution_at_exact_fixed_times="true"
elif [ ${flow_case_type} == "DHIT" ]; then
    flow_case_type_long="decaying_homogeneous_isotropic_turbulence"
    # cfl_number="0.2"
    mach_infinity="0.0007873837059678"
    reynolds_number_inf="1618.416650320742"
    prandtl_number="0.70760"
    temperature_inf="296.7072674352833"
    # final_time="2.001"
    grid_left_bound="0.0"
    grid_right_bound="6.283185307179586476"
    apply_initial_condition_method="read_values_from_file_and_project"
    input_flow_setup_filename_prefix="./setup_files/setup"
    output_velocity_field_at_fixed_times="true"
    output_velocity_field_times_string="0.0 0.5 1.0 1.5 2.0 "
    output_vorticity_magnitude_field_in_addition_to_velocity="true"
    all_boundaries_are_periodic="true"
    # LES parameters
    turbulent_prandtl_number="0.6"
    ratio_of_filter_width_to_cell_size="1.0"
    # solution output
    output_solution_at_fixed_times="true"
    output_solution_fixed_times_string="0.0 0.5 1.0 1.5 2.0 "
    output_solution_at_exact_fixed_times="true"
    adaptive_time_step="true"
elif [ ${flow_case_type} == "TCF" ]; then
    flow_case_type_long="channel_flow"
    channel_friction_velocity_reynolds_number="180"
    all_boundaries_are_periodic="false"
    turbulent_channel_number_of_cells_x_direction="42"
    turbulent_channel_number_of_cells_y_direction="42"
    turbulent_channel_number_of_cells_z_direction="42"
    turbulent_channel_mesh_stretching_function_type="carton_de_wiart_et_al"
    # turbulent_channel_mesh_stretching_function_type="gullbrand"
    # turbulent_channel_mesh_stretching_function_type="hopw"
    xvelocity_initial_condition_type="laminar"
    # xvelocity_initial_condition_type="turbulent"
    output_solution_at_fixed_times="false"
    output_solution_fixed_times_string=" "
    output_solution_at_exact_fixed_times="false"
    adaptive_time_step="true"
else 
    echo "ERROR: Invalid flow_case_type '${flow_case_type}'"
    exit 0
fi
# modify parameters if CPU timing run
if [ ${is_cpu_timing_run} == "true" ]; then 
    output_velocity_field_at_fixed_times="false"
    output_solution_at_fixed_times="false"
    adaptive_time_step="false"
    constant_time_step="0.00001"
    do_compute_unsteady_data_and_write_to_table="false"
elif [ ${is_cpu_timing_run} == "false" ]; then 
    output_velocity_field_at_fixed_times="true"
    output_solution_at_fixed_times="true"
    adaptive_time_step="true"
else
    echo "ERROR: Invalid is_cpu_timing_run '${is_cpu_timing_run}'"
    exit 0
fi

echo "Creating ${filename} ..."
if test -f "${filename}"; then
    rm ${filename}
fi
touch ${filename}
echo "# Listing of Parameters">>${filename}
echo "# ---------------------">>${filename}
echo " ">>${filename}
echo "# Solver dim and run type">>${filename}
echo "set dimension = 3">>${filename}
echo "set run_type = flow_simulation">>${filename}
echo " ">>${filename}
echo "# DG related parameters">>${filename}
echo "set overintegration = ${overintegration}">>${filename}
echo "set use_weak_form = false">>${filename}
echo "set flux_nodes_type = ${flux_nodes_type}">>${filename}
echo "set use_split_form = ${use_split_form}">>${filename}
echo "set use_curvilinear_split_form = false">>${filename}
echo "set use_weight_adjusted_mass = false">>${filename}
echo "set all_boundaries_are_periodic = ${all_boundaries_are_periodic}">>${filename}
echo "set check_same_coords_in_weak_dg = false">>${filename}
echo "set flux_reconstruction = ${correction_parameter}">>${filename}
echo "set flux_reconstruction_aux = kDG">>${filename}
echo "set use_inverse_mass_on_the_fly = true">>${filename}
echo " ">>${filename}
echo "# PDE">>${filename}
echo "set pde_type = ${pde_type}">>${filename}
echo "set model_type = ${physics_model_type}">>${filename}
echo " ">>${filename}
echo "# numerical fluxes">>${filename}
echo "set two_point_num_flux_type = ${two_point_flux_type}">>${filename}
echo "set conv_num_flux = ${numerical_flux}">>${filename}
echo "set diss_num_flux = symm_internal_penalty">>${filename}
echo " ">>${filename}
echo "# additional parameters">>${filename}
echo "set solution_vtk_files_directory_name = solution_files">>${filename}
echo "set output_high_order_grid = false">>${filename}
echo "set enable_higher_order_vtk_output = true">>${filename}
echo "set do_renumber_dofs = false">>${filename}
echo " ">>${filename}
echo "# ODE solver">>${filename}
echo "subsection ODE solver">>${filename}
echo "  set ode_output = quiet">>${filename}
echo "  set ode_solver_type = runge_kutta">>${filename}
echo "  set output_solution_every_dt_time_intervals = 0.0">>${filename}
echo "  set output_solution_at_fixed_times = ${output_solution_at_fixed_times}">>${filename}
echo "  set output_solution_fixed_times_string = ${output_solution_fixed_times_string}">>${filename}
echo "  set output_solution_at_exact_fixed_times = ${output_solution_at_exact_fixed_times}">>${filename}
echo "  set runge_kutta_method = ssprk3_ex">>${filename}
echo "end">>${filename}
echo " ">>${filename}
echo "# Euler; freestream Mach number">>${filename}
echo "subsection euler">>${filename}
echo "  set reference_length = ${reference_length}">>${filename}
echo "  set mach_infinity = ${mach_infinity}">>${filename}
echo "  set gamma_gas = 1.4">>${filename}
echo "end">>${filename}
echo " ">>${filename}
echo "# Navier-Stokes; freestream Reynolds number and Prandtl number">>${filename}
echo "subsection navier_stokes">>${filename}
echo "  set prandtl_number = ${prandtl_number}">>${filename}
echo "  set reynolds_number_inf = ${reynolds_number_inf}">>${filename}
echo "  set temperature_inf = ${temperature_inf}">>${filename}
echo "  set nondimensionalized_isothermal_wall_temperature = 1.0">>${filename}
echo "  set thermal_boundary_condition_type = adiabatic">>${filename}
echo "  set use_constant_viscosity = false">>${filename}
echo "  set nondimensionalized_constant_viscosity = 1.0">>${filename}
echo "end">>${filename}
echo " ">>${filename}
echo "# Physics Model (if pde_type == physics_model)">>${filename}
echo "subsection physics_model">>${filename}
echo "  set euler_turbulence = false">>${filename}
echo "  subsection large_eddy_simulation">>${filename}
echo "    set SGS_model_type = ${SGS_model_type}">>${filename}
echo "    set turbulent_prandtl_number = ${turbulent_prandtl_number}">>${filename}
echo "    set smagorinsky_model_constant = ${smagorinsky_model_constant}">>${filename}
echo "    set WALE_model_constant = ${WALE_model_constant}">>${filename}
echo "    set vreman_model_constant = ${vreman_model_constant}">>${filename}
echo "    set ratio_of_filter_width_to_cell_size = ${ratio_of_filter_width_to_cell_size}">>${filename}
echo "  end">>${filename}
echo "end">>${filename}
echo " ">>${filename}
echo "# Flow Solver">>${filename}
echo "subsection flow_solver">>${filename}
echo "  set flow_case_type = ${flow_case_type_long}">>${filename}
echo "  set poly_degree = ${poly_degree_}">>${filename}
echo "  set final_time = ${final_time}">>${filename}
echo "  set constant_time_step = ${constant_time_step}">>${filename}
echo "  set courant_friedrichs_lewy_number = ${cfl_number}">>${filename}
echo "  set unsteady_data_table_filename = ${unsteady_data_filename}">>${filename}
echo "  set steady_state = false">>${filename}
echo "  set adaptive_time_step = ${adaptive_time_step}">>${filename}
echo "  set output_restart_files = false">>${filename}
echo "  set restart_files_directory_name = restart_files">>${filename}
echo "  set output_restart_files_every_dt_time_intervals = 1.0">>${filename}
echo "  subsection grid">>${filename}
echo "    set grid_degree = 1">>${filename}
echo "    set grid_left_bound = ${grid_left_bound}">>${filename}
echo "    set grid_right_bound = ${grid_right_bound}">>${filename}
echo "    set number_of_grid_elements_per_dimension = ${number_of_grid_elements_per_dimension_}">>${filename}
echo "  end">>${filename}
if [ ${flow_case_type} == "TGV" ]; then
    echo "  subsection taylor_green_vortex">>${filename}
    echo "    set density_initial_condition_type = ${density_initial_condition_type}">>${filename}
    echo "    set check_nonphysical_flow_case_behavior = true">>${filename}
    echo "  end">>${filename}
elif [ ${flow_case_type} == "TCF" ]; then
    echo "  subsection channel_flow">>${filename}
    echo "    set channel_friction_velocity_reynolds_number = ${channel_friction_velocity_reynolds_number}">>${filename}
    echo "    set turbulent_channel_number_of_cells_x_direction = ${turbulent_channel_number_of_cells_x_direction}">>${filename}
    echo "    set turbulent_channel_number_of_cells_y_direction = ${turbulent_channel_number_of_cells_y_direction}">>${filename}
    echo "    set turbulent_channel_number_of_cells_z_direction = ${turbulent_channel_number_of_cells_z_direction}">>${filename}
    echo "    set turbulent_channel_mesh_stretching_function_type = ${turbulent_channel_mesh_stretching_function_type}">>${filename}
    echo "    set xvelocity_initial_condition_type = ${xvelocity_initial_condition_type}">>${filename}
    echo "  end">>${filename}
fi
echo "  set apply_initial_condition_method = ${apply_initial_condition_method}">>${filename}
echo "  set input_flow_setup_filename_prefix = ${input_flow_setup_filename_prefix}">>${filename}
echo "  subsection output_velocity_field">>${filename}
echo "    set output_velocity_field_at_fixed_times = ${output_velocity_field_at_fixed_times}">>${filename}
echo "    set output_velocity_field_times_string = ${output_velocity_field_times_string}">>${filename}
echo "    set output_vorticity_magnitude_field_in_addition_to_velocity = ${output_vorticity_magnitude_field_in_addition_to_velocity}">>${filename}
echo "    set output_flow_field_files_directory_name = flow_field_files">>${filename}
echo "  end">>${filename}
echo "  set do_compute_unsteady_data_and_write_to_table = ${do_compute_unsteady_data_and_write_to_table}">>${filename}
echo "end">>${filename}
echo "done."