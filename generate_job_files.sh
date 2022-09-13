filename="job_parameters_file.sh"
time="1:00:00"
job_name="run_parameters_file"
nodes=2
ntasks_per_node=40
user_email="julien.brillon@mail.mcgill.ca"
compute_canada_username="brillon"
parameters_file="my_parameters_file.prm"
dimension_of_problem=2
run_on_temp_dir=false
memory_per_node=0

source ./create_job_file.sh \
${filename} \
${time} \
${job_name} \
${nodes} \
${ntasks_per_node} \
${user_email} \
${compute_canada_username} \
${parameters_file} \
${dimension_of_problem} \
${run_on_temp_dir} \
${memory_per_node}

