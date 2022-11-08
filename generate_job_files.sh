#---------------------------------------------------
# create job submission file
#---------------------------------------------------
filename="job_prm_file.sh"
walltime="167:00:00"
job_name="run_parameters_file"
nodes=256
ntasks_per_node=16
user_email="julien.brillon@mail.mcgill.ca"
compute_canada_username="brillon"
parameters_file="input.prm"
PHiLiP_DIM=3
run_on_temp_dir=false
memory_per_node="63G"
#---------------------------------------------------
# Generate job file
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
${memory_per_node}
