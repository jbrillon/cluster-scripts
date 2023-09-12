#===================================================
# INPUTS:
#---------------------------------------------------
sub_directory=${1}
pde_type=${2}
SGS_model_type_short=${3}
correction_parameter=${4}
numerical_flux_short=${5}
two_point_flux_type=${6}
flow_case_type=${7}
first_or_last_run=${8}
test_directory=${9}
poly_degree=${10}
number_of_grid_elements_per_dimension=${11}
walltime=${12}
ntasks_per_node=${13}
nodes=${14}
memory_per_node=${15}
run_standard_dg=${16}
overintegration=${17}
flux_nodes_type=${18}
SGS_model_constant=${19}
physics_model_type=${20}
cfl_number=${21}
final_time=${22}
is_cpu_timing_run=${23}
poly_degree_max_large_scales=${24}
#---------------------------------------------------
let number_of_processors=${nodes}*${ntasks_per_node}
#---------------------------------------------------
let number_of_DOF_per_dimension="(${poly_degree}+1)*${number_of_grid_elements_per_dimension}"
unsteady_data_filename="turbulent_quantities"
#===================================================

if [ ! -d ${sub_directory} ]; then
    echo "Creating directory for runs: ${sub_directory}"
    mkdir "${sub_directory}"
fi

if [ ! -d ${test_directory} ]; then
    echo "Creating directory for local testing of runs: ${test_directory}"
    mkdir "${test_directory}"
fi

# determine SGS model type name from the short name
SGS_model_type="X"
if [ ${SGS_model_type_short} == "SMAG" ]; then
    SGS_model_type="smagorinsky"
elif [ ${SGS_model_type_short} == "WALE" ]; then
    SGS_model_type="wall_adaptive_local_eddy_viscosity"
elif [ ${SGS_model_type_short} == "VRMN" ]; then
    SGS_model_type="vreman"
elif [ ${SGS_model_type_short} == "SI.SMAG" ]; then
    SGS_model_type="shear_improved_smagorinsky"
else 
    echo "ERROR: Invalid SGS_model_type_short"
    exit 0
fi

# determine numerical flux name from the short name
numerical_flux="X"
if [ ${numerical_flux_short} == "LxF" ]; then
    numerical_flux="lax_friedrichs"
elif [ ${numerical_flux_short} == "Roe" ]; then
    numerical_flux="roe"
elif [ ${numerical_flux_short} == "L2R" ]; then
    numerical_flux="l2roe"
elif [ ${numerical_flux_short} == "2PF" ]; then
    numerical_flux="two_point_flux"
elif [ ${numerical_flux_short} == "2PF-LxF" ]; then
    numerical_flux="two_point_flux_with_lax_friedrichs_dissipation"
elif [ ${numerical_flux_short} == "2PF-Roe" ]; then
    numerical_flux="two_point_flux_with_roe_dissipation"
elif [ ${numerical_flux_short} == "2PF-L2R" ]; then
    numerical_flux="two_point_flux_with_l2roe_dissipation"
else 
    echo "ERROR: Invalid numerical_flux_short"
    exit 0
fi

# determine the simulation description parameters
turbulence_simulation_type="X"
fluid_type="X"
if [ ${pde_type} == "navier_stokes" ]; then
    turbulence_simulation_type="ILES"
    fluid_type="viscous"
elif [ ${pde_type} == "physics_model" ]; then
    fluid_type="viscous"
    if [ ${physics_model_type} == "navier_stokes_model" ]; then
        turbulence_simulation_type="ILES"
    elif [ ${physics_model_type} == "large_eddy_simulation" ]; then
        turbulence_simulation_type="LES_${SGS_model_type_short}_MC-${SGS_model_constant}"
    else 
        echo "ERROR: Invalid physics_model_type"
        exit 0
    fi
elif [ ${pde_type} == "physics_model_filtered" ]; then
    fluid_type="viscous"
    if [ ${physics_model_type} == "navier_stokes_model" ]; then
        turbulence_simulation_type="ILES_filtered"
    elif [ ${physics_model_type} == "large_eddy_simulation" ]; then
        turbulence_simulation_type="LES_filtered_pL${poly_degree_max_large_scales}_${SGS_model_type_short}_MC-${SGS_model_constant}"
    else 
        echo "ERROR: Invalid physics_model_type"
        exit 0
    fi
elif [ ${pde_type} == "euler" ]; then
    turbulence_simulation_type="ILES"
    fluid_type="inviscid"
else 
    echo "ERROR: Invalid pde_type"
    exit 0
fi

# set the scheme name
if [ ${run_standard_dg} == "true" ]; then
    scheme_name="std_strong_DG"
else 
    scheme_name="NSFR_${correction_parameter}_${two_point_flux_type}"
fi
# set the scheme details
scheme_details="${flux_nodes_type}_OI-${overintegration}"

# set the run name
run_name="${fluid_type}_${flow_case_type}_${turbulence_simulation_type}_${scheme_name}_${numerical_flux_short}_${scheme_details}_dofs0${number_of_DOF_per_dimension}_p${poly_degree}_CFL-${cfl_number}_procs${number_of_processors}"

# set target directory
run_directory="${sub_directory}/${run_name}"
# create directory if it does not exist
if [ ! -d ${run_directory} ]; then
    echo "Creating run directory and subdirectories ${run_directory}"
    mkdir "${run_directory}"
    # create subdirectories
    mkdir "${run_directory}/solution_files"
    mkdir "${run_directory}/restart_files"
    mkdir "${run_directory}/flow_field_files"
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
    mkdir "${run_directory_test}/flow_field_files"
fi
#- - - - - - - - - - - - - - - - - - - - - - - - - -

#---------------------------------------------------
# create bash file for submitting all jobs
#---------------------------------------------------
submit_jobs_filename="submit_jobs.sh"
filename="${sub_directory}/${submit_jobs_filename}"
if [ ${first_or_last_run} == "first" ] || [ ${first_or_last_run} == "first_and_last" ]; then
    echo "Creating ${filename} ..."
    if test -f "${filename}"; then
        rm ${filename}
    fi
    echo 'TARGET_DIR=(\'>>${filename}
    echo "done."
fi
echo ${run_name}' \'>>${filename}
if [ ${first_or_last_run} == "last" ] || [ ${first_or_last_run} == "first_and_last" ]; then
    echo ')'>>${filename}
    echo ''>>${filename}
    echo 'for j in ${!TARGET_DIR[@]}; do'>>${filename}
    echo '    cd ${TARGET_DIR[$j]}'>>${filename}
    echo '    sbatch job_prm_file.sh'>>${filename}
    echo '    cd ../'>>${filename}
    echo 'done'>>${filename}
    chmod +x ${filename}
fi
#---------------------------------------------------

#- - - - - - - - - - - - - - - - - - - - - - - - - -
# FOR TESTING
#- - - - - - - - - - - - - - - - - - - - - - - - - -
test_jobs_filename="test_jobs.sh"
filename="${test_directory}/${test_jobs_filename}"
if [ ${first_or_last_run} == "first" ] || [ ${first_or_last_run} == "first_and_last" ]; then
    echo "Creating ${filename} ..."
    if test -f "${filename}"; then
        rm ${filename}
    fi
    echo 'TARGET_DIR=(\'>>${filename}
    echo "done."
fi
echo ${run_name}' \'>>${filename}
if [ ${first_or_last_run} == "last" ] || [ ${first_or_last_run} == "first_and_last" ]; then
    echo ')'>>${filename}
    echo ''>>${filename}
    echo 'for j in ${!TARGET_DIR[@]}; do'>>${filename}
    echo '    echo "================================================="'>>${filename}
    echo '    echo "STARTING: ${TARGET_DIR[$j]}"'>>${filename}
    echo '    echo "================================================="'>>${filename}
    echo '    cp /home/julien/Codes/PHiLiP/build_release/bin/PHiLiP_3D ${TARGET_DIR[$j]}/;'>>${filename}
    echo '    cd ${TARGET_DIR[$j]};'>>${filename}
    echo '    /usr/bin/mpirun "-np" "8" PHiLiP_3D "-i" "input.prm"'>>${filename}
    echo '    cd ../;'>>${filename}
    echo '    echo "================================================="'>>${filename}
    echo '    echo "COMPLETED: ${TARGET_DIR[$j]}"'>>${filename}
    echo '    echo "================================================="'>>${filename}
    echo 'done'>>${filename}
    chmod +x ${filename}
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
${unsteady_data_filename} \
${number_of_grid_elements_per_dimension} \
${two_point_flux_type} \
${flow_case_type} \
${run_standard_dg} \
${overintegration} \
${flux_nodes_type} \
${SGS_model_constant} \
${physics_model_type} \
${cfl_number} \
${final_time} \
${is_cpu_timing_run} \
${poly_degree_max_large_scales}
#---------------------------------------------------

#---------------------------------------------------
# create job submission file
#---------------------------------------------------
user_email="julien.brillon@mail.mcgill.ca"
compute_canada_username="brillon"
parameters_file="${prm_filename}"
PHiLiP_DIM=3
run_on_temp_dir=false
job_name="${run_name}"
job_submission_script_filename="job_prm_file.sh"
filename="${run_directory}/${job_submission_script_filename}"
#---------------------------------------------------

#---------------------------------------------------
# Generate job file
#---------------------------------------------------
source ./create_job_file.sh \
${filename} \
${walltime} \
${job_name} \
${nodes} \
${ntasks_per_node} \
${user_email} \
${compute_canada_username} \
${parameters_file} \
${PHiLiP_DIM} \
${run_on_temp_dir} \
${memory_per_node} \
"log-%j.out"
#---------------------------------------------------

#---------------------------------------------------
# JOB FILE FOR CPU TIMING RUN
#---------------------------------------------------
if [ ${is_cpu_timing_run} == "true" ]; then
    submit_cpu_job_filename="job_cpu_timing_runs.sh"
    filename="${sub_directory}/${submit_cpu_job_filename}"
    if [ ${first_or_last_run} == "first" ] || [ ${first_or_last_run} == "first_and_last" ]; then
        echo "Creating ${filename} ..."
        if test -f "${filename}"; then
            rm ${filename}
        fi

        time=${walltime}
        username=${compute_canada_username}
        dimension_of_problem=${PHiLiP_DIM}
        output_filename="log-%j.out"

        let number_of_processors=${nodes}*${ntasks_per_node}

        echo "#!/bin/bash">>${filename}
        echo "#SBATCH --time=${time}">>${filename}
        echo "#SBATCH --account=rrg-nadaraja-ac">>${filename}
        echo "#SBATCH --job-name=${fluid_type}_${flow_case_type}_cpu_timing">>${filename}
        echo "#SBATCH --output=${output_filename}">>${filename}
        echo "#SBATCH --nodes=${nodes}">>${filename}
        echo "##SBATCH --ntasks-per-node=${ntasks_per_node}                          ## <-- refer to https://docs.computecanada.ca/wiki/Advanced_MPI_scheduling">>${filename}
        echo "#SBATCH --ntasks=${number_of_processors}">>${filename}
        echo "##SBATCH --mem=${memory_per_node}                                       ## <-- total shared memory; --mem=0 means to reserve all the available memory on each node assigned to the job">>${filename}
        echo "#SBATCH --mem-per-cpu=3048M">>${filename}
        echo "#SBATCH --mail-user=${user_email} ## <-- for receiving job updates via email">>${filename}
        echo "#SBATCH --mail-type=ALL                               ## <-- what kind of updates to receive by email">>${filename}
        echo " ">>${filename}
        echo "SLURM_USER=\"${username}\"                    ## <-- Enter compute canada username here">>${filename}
        echo "PARAMETERS_FILE=\"${parameters_file}\" ## <-- Enter .prm filename here">>${filename}
        echo "PHiLiP_DIMENSIONS=\"${dimension_of_problem}\"                    ## WARNING: must correspond to the DIM in the .prm file">>${filename}
        echo "NUM_PROCS=\"${number_of_processors}\"                           ## WARNING: must correspond to nodes*(ntasks-per-node) above">>${filename}
        echo "RUN_ON_TMPDIR=${run_on_temp_dir}                      ## Set as true for fast write speeds, however, output files will only be copied to your job submit directory once mpirun has completed.">>${filename}
        echo " ">>${filename}
        echo "PHiLiP_EXECUTABLE=\"/home/\${SLURM_USER}/scratch/PHiLiP_\${PHiLiP_DIMENSIONS}D_20230815\"">>${filename}
        echo " ">>${filename}
        echo "## Below are the modules needed to run the executable">>${filename}
        echo "module --force purge # not needed?">>${filename}
        echo "module load StdEnv/2020 # not needed?">>${filename}
        echo "##module load intel/2020.1.217">>${filename}
        echo "module load gcc/9.3.0 # not needed?">>${filename}
        echo "module load openmpi/4.0.3 # required">>${filename}
        echo " ">>${filename}
        echo "if [ \${RUN_ON_TMPDIR} = true ]; then">>${filename}
        echo "    cd \${SLURM_TMPDIR};">>${filename}
        echo "fi">>${filename}
        echo "">>${filename}

        echo 'TARGET_DIR=(\'>>${filename}
        echo "done."
    fi
    echo ${run_name}' \'>>${filename}
    if [ ${first_or_last_run} == "last" ] || [ ${first_or_last_run} == "first_and_last" ]; then
        echo ')'>>${filename}
        echo ''>>${filename}
        echo 'for j in ${!TARGET_DIR[@]}; do'>>${filename}
        echo '    echo "================================================="'>>${filename}
        echo '    echo "STARTING: ${TARGET_DIR[$j]}"'>>${filename}
        echo '    echo "================================================="'>>${filename}
        echo '    cd ${TARGET_DIR[$j]};'>>${filename}
        echo "    mpirun -n \${NUM_PROCS} \"\${PHiLiP_EXECUTABLE}\" -i \"\${SLURM_SUBMIT_DIR}/\${TARGET_DIR[\$j]}/\${PARAMETERS_FILE}\"">>${filename}
        echo '    cd ../;'>>${filename}
        echo '    echo "================================================="'>>${filename}
        echo '    echo "COMPLETED: ${TARGET_DIR[$j]}"'>>${filename}
        echo '    echo "================================================="'>>${filename}
        echo 'done'>>${filename}
        echo " ">>${filename}
        echo "if [ \${RUN_ON_TMPDIR} = true ]; then">>${filename}
        echo "    # Get output files, exclude subdirectories">>${filename}
        echo "    rsync -axvH --no-g --no-p --exclude='*/' \${SLURM_TMPDIR}/* \${SLURM_SUBMIT_DIR};">>${filename}
        echo "fi">>${filename}
        chmod +x ${filename}
    fi
    echo "done."
fi
#---------------------------------------------------

#- - - - - - - - - - - - - - - - - - - - - - - - - -
# FOR TESTING
#- - - - - - - - - - - - - - - - - - - - - - - - - -
prm_filename="input.prm"
filename="${run_directory_test}/${prm_filename}"
poly_degree_for_testing=${poly_degree}
number_of_grid_elements_per_dimension_for_testing=${number_of_grid_elements_per_dimension}
source ./create_prm_file.sh ${filename} \
${pde_type} \
${correction_parameter} \
${numerical_flux} \
${SGS_model_type} \
${poly_degree_for_testing} \
${unsteady_data_filename} \
${number_of_grid_elements_per_dimension_for_testing} \
${two_point_flux_type} \
${flow_case_type} \
${run_standard_dg} \
${overintegration} \
${flux_nodes_type} \
${SGS_model_constant} \
${physics_model_type} \
${cfl_number} \
${final_time} \
${is_cpu_timing_run} \
${poly_degree_max_large_scales}
#---------------------------------------------------

#---------------------------------------------------
# Generate file with parameters for assembling mpi
#---------------------------------------------------
filename="${run_directory}/parameters_for_assembling_mpi_files.txt"
source ./create_file_with_parameters_for_assembling_mpi.sh \
${filename} \
${flow_case_type} \
${poly_degree} \
${number_of_grid_elements_per_dimension} \
${number_of_processors}
#---------------------------------------------------