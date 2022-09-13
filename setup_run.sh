#===================================================
# INPUTS:
#---------------------------------------------------
sub_directory=${1}
pde_type=${2}
SGS_model_type=${3}
correction_parameter=${4}
numerical_flux=${5}
two_point_flux_type=${6}
flow_case_type=${7}
first_or_last_run=${8}
test_directory=${9}
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
run_name="${fluid_type}_${turbulence_simulation_type}_${correction_parameter}_${two_point_flux_type}_${numerical_flux}_dofs0${number_of_DOF_per_dimension}_p${poly_degree}"

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

#- - - - - - - - - - - - - - - - - - - - - - - - - -
# FOR TESTING
#- - - - - - - - - - - - - - - - - - - - - - - - - -
# set target directory
run_directory_test="${test_directory}/${run_name}"
# create directory if it does not exist
if [ ! -d ${run_directory_test} ]; then
    echo "Creating run directory and subdirectories ${run_directory_test}"
    mkdir "${run_directory_test}"
    # create subdirectories
    mkdir "${run_directory_test}/solution_files"
    mkdir "${run_directory_test}/restart_files"
fi
#- - - - - - - - - - - - - - - - - - - - - - - - - -

#---------------------------------------------------
# create bash file for submitting all jobs
#---------------------------------------------------
submit_jobs_filename="submit_jobs.sh"
filename="${sub_directory}/${submit_jobs_filename}"
if [ ${first_or_last_run} == "first" ]; then
    echo "Creating ${filename} ..."
    if test -f "${filename}"; then
        rm ${filename}
    fi
    echo 'TARGET_DIR=(\'>>${filename}
    echo "done."
fi
echo ${run_name}' \'>>${filename}
if [ ${first_or_last_run} == "last" ]; then
echo ')'>>${filename}
echo ''>>${filename}
echo 'for j in ${!TARGET_DIR[@]}; do'>>${filename}
echo '    cd ${TARGET_DIR[$j]}'>>${filename}
echo '    sbatch job_prm_file.sh'>>${filename}
echo '    cd ../'>>${filename}
echo 'done'>>${filename}
chmod +x ${filename}
fi

#- - - - - - - - - - - - - - - - - - - - - - - - - -
# FOR TESTING
#- - - - - - - - - - - - - - - - - - - - - - - - - -
test_jobs_filename="test_jobs.sh"
filename="${test_directory}/${test_jobs_filename}"
if [ ${first_or_last_run} == "first" ]; then
    echo "Creating ${filename} ..."
    if test -f "${filename}"; then
        rm ${filename}
    fi
    echo 'TARGET_DIR=(\'>>${filename}
    echo "done."
fi
echo ${run_name}' \'>>${filename}
if [ ${first_or_last_run} == "last" ]; then
echo ')'>>${filename}
echo ''>>${filename}
echo 'for j in ${!TARGET_DIR[@]}; do'>>${filename}
echo '    echo "================================================="'>>${filename}
echo '    echo "STARTING: ${TARGET_DIR[$j]}"'>>${filename}
echo '    echo "================================================="'>>${filename}
echo '    /usr/bin/mpirun "-np" "4" "/home/julien/Codes/2022-06-15/PHiLiP/build_release/bin/PHiLiP_3D" "-i" "${TARGET_DIR[$j]}/input.prm"'>>${filename}
echo '    echo "================================================="'>>${filename}
echo '    echo "COMPLETED: ${TARGET_DIR[$j]}"'>>${filename}
echo '    echo "================================================="'>>${filename}
echo 'done'>>${filename}
fi
#- - - - - - - - - - - - - - - - - - - - - - - - - -

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
${density_initial_condition_type} \
${two_point_flux_type} \
${flow_case_type}

#- - - - - - - - - - - - - - - - - - - - - - - - - -
# FOR TESTING
#- - - - - - - - - - - - - - - - - - - - - - - - - -
prm_filename="input.prm"
filename="${run_directory_test}/${prm_filename}"
source ./create_prm_file.sh ${filename} \
${pde_type} \
${correction_parameter} \
${numerical_flux} \
${SGS_model_type} \
"2" \
${cfl_number} \
${unsteady_data_filename} \
"4" \
${density_initial_condition_type} \
${two_point_flux_type} \
${flow_case_type}
#---------------------------------------------------


#---------------------------------------------------
# create job submission file
#---------------------------------------------------
time="167:00:00"
ntasks_per_node=16
nodes=32
memory_per_node="63G"
user_email="julien.brillon@mail.mcgill.ca"
compute_canada_username="brillon"
parameters_file="${prm_filename}"
PHiLiP_DIM=3
run_on_temp_dir=false
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
${run_on_temp_dir} \
${memory_per_node}