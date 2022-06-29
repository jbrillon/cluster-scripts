time="1:00:00"
ntasks_per_node=64
user_email="julien.brillon@mail.mcgill.ca"
compute_canada_username="brillon"
parameters_file="input_p5.prm"
PHiLiP_DIM=3
run_on_temp_dir=false

for number_of_nodes in $(seq 1 1 10)
do
	nodes=${number_of_nodes}
	job_name="${number_of_nodes}_nodes_p5"
	filename="determine_memory_allocation/job_${number_of_nodes}_nodes_p5.sh"
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
done
