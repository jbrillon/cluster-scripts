# here we want to determine the number of nodes required for a simulation
time="1:00:00"
user_email="julien.brillon@mail.mcgill.ca"
compute_canada_username="brillon"
parameters_file="input.prm"
ntasks_per_node=16
memory_per_node="63G"
PHiLiP_DIM=3
run_on_temp_dir=false

# number of possible nodes that gives num_procs as a power of 2
NumberOfNodesArray=(2 4 8 16 32 64 128 256)

# set target directory
target_directory="outputs/jcp/verification/determine_allocation"
# create directory if it does not exist
if [ ! -d ${target_directory} ]; then
    echo "Creating target directory ${target_directory}"
    mkdir "${target_directory}"
fi

for number_of_nodes in ${NumberOfNodesArray[@]}
do
	nodes=${number_of_nodes}
	job_name="alloc_${number_of_nodes}_nodes"
	filename="${target_directory}/job_${number_of_nodes}_nodes.sh"
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
done
