# NUMERICAL_FLUXES=("central_flux" "roe" "l2roe" "entropy_conserving_flux")
# CORRECTION_PARAMETERS=("cDG" "cPlus")
# PDE_TYPES("navier_stokes" "euler" "physics_model")
pde_type="navier_stokes"
SGS_model_type="smagorinsky"
correction_parameter="cDG"
numerical_flux="central_flux"

cfl_number="0.1"
poly_degree="5"
number_of_grid_elements_per_dimension="8"

density_initial_condition_type="isothermal"
let number_of_DOF_per_dimension="(${poly_degree}+1)*${number_of_grid_elements_per_dimension}"
unsteady_data_filename="dofs0${number_of_DOF_per_dimension}_p${poly_degree}"

filename="determine_memory_allocation/input_p5.prm"

source ./create_prm_file.sh ${filename} \
${pde_type} \
${correction_parameter} \
${numerical_flux} \
${SGS_model_type} \
${poly_degree} \
${cfl_number} \
${unsteady_data_filename} \
${number_of_grid_elements_per_dimension} \
${density_initial_condition_type}

# scp brillon@narval.computecanada.ca:scratch/202