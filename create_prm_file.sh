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

# determine if using standard DG or split form
if [ ${run_standard_dg} == "true" ]; then
    use_split_form="false"
else 
    use_split_form="true"
fi

# Flow + LES variables
# -- Default values
density_initial_condition_type="isothermal"
reference_length="1.0" # note: this actually serves no purpose in PHiLiP
# -- Case specific values
if [ ${flow_case_type} == "TGV" ]; then
    flow_case_type_long="taylor_green_vortex"
    cfl_number="0.1"
    mach_infinity="0.1"
    reynolds_number_inf="1600.0"
    prandtl_number="0.71"
    temperature_inf="273.15"
    final_time="20.001"
    grid_left_bound="-3.141592653589793238"
    grid_right_bound="3.141592653589793238"
    apply_initial_condition_method="interpolate_initial_condition_function"
    # apply_initial_condition_method="project_initial_condition_function"
    input_flow_setup_filename_prefix="setup"
    output_velocity_field_at_fixed_times="true"
    output_velocity_field_times_string="8.0 9.0 "
    number_of_times_to_output_velocity_field="2"
    output_velocity_field_at_equidistant_nodes="true"
    output_vorticity_magnitude_field_in_addition_to_velocity="true"
    # LES parameters
    turbulent_prandtl_number="0.6"
    smagorinsky_model_constant="0.12"
    WALE_model_constant="0.5"
    vreman_model_constant="0.036"
    ratio_of_filter_width_to_cell_size="1.0"
elif [ ${flow_case_type} == "DHIT" ]; then
    flow_case_type_long="decaying_homogeneous_isotropic_turbulence"
    cfl_number="0.1"
    mach_infinity="0.0007873837059678"
    reynolds_number_inf="1618.416650320742"
    prandtl_number="0.70760"
    temperature_inf="296.7072674352833"
    final_time="2.001"
    grid_left_bound="0.0"
    grid_right_bound="6.283185307179586476"
    apply_initial_condition_method="read_values_from_file_and_project"
    input_flow_setup_filename_prefix="./setup_files/setup"
    output_velocity_field_at_fixed_times="true"
    output_velocity_field_times_string="0.0 1.0 2.0 "
    number_of_times_to_output_velocity_field="3"
    output_velocity_field_at_equidistant_nodes="true"
    output_vorticity_magnitude_field_in_addition_to_velocity="true"
    # LES parameters
    turbulent_prandtl_number="0.6"
    smagorinsky_model_constant="0.12"
    WALE_model_constant="0.5"
    vreman_model_constant="0.036"
    ratio_of_filter_width_to_cell_size="1.0"
else 
    echo "ERROR: Invalid flow_case_type '${flow_case_type}'"
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
echo "set dimension = 3">>${filename}
echo "set run_type = flow_simulation">>${filename}
echo "set pde_type = ${pde_type}">>${filename}
echo "set model_type = large_eddy_simulation">>${filename}
echo "set solution_vtk_files_directory_name = ./solution_files">>${filename}
echo "set output_high_order_grid = false">>${filename}
echo " ">>${filename}
echo "# DG formulation">>${filename}
echo "set use_weak_form = false">>${filename}
echo "set use_collocated_nodes = true">>${filename}
echo "set use_split_form = ${use_split_form}">>${filename}
echo "set use_classical_FR = false">>${filename}
echo "set flux_reconstruction = ${correction_parameter}">>${filename}
echo "set use_inverse_mass_on_the_fly = true">>${filename}
echo "set use_periodic_bc = true">>${filename}
echo " ">>${filename}
echo "# numerical fluxes">>${filename}
echo "set two_point_num_flux_type = ${two_point_flux_type}">>${filename}
echo "set conv_num_flux = ${numerical_flux}">>${filename}
echo "set diss_num_flux = symm_internal_penalty">>${filename}
echo " ">>${filename}
echo "# ODE solver">>${filename}
echo "subsection ODE solver">>${filename}
echo "  set ode_output = quiet">>${filename}
echo "  set ode_solver_type = runge_kutta">>${filename}
echo "  set output_solution_every_dt_time_intervals = 0.0">>${filename}
echo "  set runge_kutta_method = ssprk3_ex">>${filename}
echo "end">>${filename}
echo " ">>${filename}
echo "# freestream Mach number">>${filename}
echo "subsection euler">>${filename}
echo "  set reference_length = ${reference_length}">>${filename}
echo "  set mach_infinity = ${mach_infinity}">>${filename}
echo "end">>${filename}
echo " ">>${filename}
echo "# freestream Reynolds number and Prandtl number">>${filename}
echo "subsection navier_stokes">>${filename}
echo "  set prandtl_number = ${prandtl_number}">>${filename}
echo "  set reynolds_number_inf = ${reynolds_number_inf}">>${filename}
echo "  set temperature_inf = ${temperature_inf}">>${filename}
echo "end">>${filename}
echo " ">>${filename}
echo "# Physics Model (if pde_type == physics_model)">>${filename}
echo "subsection physics_model">>${filename}
echo "  subsection large_eddy_simulation">>${filename}
echo "    set euler_turbulence = false">>${filename}
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
echo "  set courant_friedrich_lewy_number = ${cfl_number}">>${filename}
echo "  set adaptive_time_step = true">>${filename}
echo "  set unsteady_data_table_filename = ${unsteady_data_filename}">>${filename}
echo "  set output_restart_files = false">>${filename}
echo "  set restart_files_directory_name = restart_files">>${filename}
echo "  set output_restart_files_every_dt_time_intervals = 1.0">>${filename}
echo "  subsection grid">>${filename}
echo "    set grid_degree = 1">>${filename}
echo "    set grid_left_bound = ${grid_left_bound}">>${filename}
echo "    set grid_right_bound = ${grid_right_bound}">>${filename}
echo "    set number_of_grid_elements_per_dimension = ${number_of_grid_elements_per_dimension_}">>${filename}
echo "  end">>${filename}
echo "  subsection taylor_green_vortex">>${filename}
echo "    set density_initial_condition_type = ${density_initial_condition_type}">>${filename}
echo "  end">>${filename}
echo "  set apply_initial_condition_method = ${apply_initial_condition_method}">>${filename}
echo "  set input_flow_setup_filename_prefix = ${input_flow_setup_filename_prefix}">>${filename}
echo "  subsection output_velocity_field">>${filename}
echo "    set output_velocity_field_at_fixed_times = ${output_velocity_field_at_fixed_times}">>${filename}
echo "    set output_velocity_field_times_string = ${output_velocity_field_times_string}">>${filename}
echo "    set number_of_times_to_output_velocity_field = ${number_of_times_to_output_velocity_field}">>${filename}
echo "    set output_velocity_field_at_equidistant_nodes = ${output_velocity_field_at_equidistant_nodes}">>${filename}
echo "    set output_vorticity_magnitude_field_in_addition_to_velocity = ${output_vorticity_magnitude_field_in_addition_to_velocity}">>${filename}
echo "    set output_flow_field_files_directory_name = flow_field_files">>${filename}
echo "  end">>${filename}
echo "end">>${filename}
echo "done."