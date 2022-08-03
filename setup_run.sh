#===================================================
# INPUTS:
#---------------------------------------------------
sub_directory=${1}
pde_type=${2}
SGS_model_type=${3}
correction_parameter=${4}
numerical_flux=${5}
#---------------------------------------------------
cfl_number="0.1"
poly_degree="5"
number_of_grid_elements_per_dimension="16"
density_initial_condition_type="isothermal"
# density_initial_condition_type="uniform"
let number_of_DOF_per_dimension="(${poly_degree}+1)*${number_of_grid_elements_per_dimension}"
unsteady_data_filename="turbulent_quantities"
#===================================================

# determine the simulation description parameters
turbulence_simulation_type="X"
fluid_type="X"
if [ ${pde_type} == "navier_stokes" ]; then
	turbulence_simulation_type="ILES"
	fluid_type="viscous"
elif [ ${pde_type} == "physics_model" ]; then
	turbulence_simulation_type="LES_${SGS_model_type}"
	fluid_type="viscous"
elif [ ${pde_type} == "euler" ]; then
	turbulence_simulation_type="ILES"
	fluid_type="inviscid"
else 
	echo "ERROR: Invalid pde_type"
	exit 0
fi

# set the run name
run_name="${fluid_type}_${turbulence_simulation_type}_${correction_parameter}_${numerical_flux}_dofs0${number_of_DOF_per_dimension}_p${poly_degree}"

# set target directory
run_directory="${sub_directory}/${run_name}"

# create directory if it does not exist
if [ ! -d ${run_directory} ]; then
	echo "Creating run directory and subdirectories ${run_directory}"
	mkdir "${run_directory}"
	# create subdirectories
	mkdir "${run_directory}/solution_files"
	mkdir "${run_directory}/restart_files"
fi
#---------------------------------------------------
# create prm file
#---------------------------------------------------
prm_filename="input.prm"
filename="${run_directory}/${prm_filename}"
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
#---------------------------------------------------


#---------------------------------------------------
# create job submission file
#---------------------------------------------------
time="96:00:00"
ntasks_per_node=64
user_email="julien.brillon@mail.mcgill.ca"
compute_canada_username="brillon"
parameters_file="${prm_filename}"
PHiLiP_DIM=3
run_on_temp_dir=false
nodes=8
job_name="${run_name}"
job_submission_script_filename="job_prm_file.sh"
filename="${run_directory}/${job_submission_script_filename}"
#---------------------------------------------------
# Generate job file
source ./create_job_file.sh \
${filename} \
${time} \
${job_name} \
${nodes} \
${ntasks_per_node} \
${user_email} \
${compute_canada_username} \
${parameters_file} \
${PHiLiP_DIM} \
${run_on_temp_dir}
