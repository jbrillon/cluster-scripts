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

#---------------------------------------------------
# create bash file for submitting all jobs
#---------------------------------------------------
submit_jobs_filename="${target_directory}/submit_det_mem_alloc_jobs.sh"
echo "Creating ${submit_jobs_filename} ..."
if test -f "${submit_jobs_filename}"; then
    rm ${submit_jobs_filename}
fi
echo 'TARGET_DIR=(\'>>${submit_jobs_filename}
echo "done."

for number_of_nodes in ${NumberOfNodesArray[@]}
do
	nodes=${number_of_nodes}
	job_name="alloc_${number_of_nodes}_nodes"
	job_sub_file_name="job_${number_of_nodes}_nodes.sh"
	filename="${target_directory}/${job_sub_file_name}"
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
	${memory_per_node} \
	"%x-%j.out"
	# add line to bash file that submits all jobs
	echo ${job_sub_file_name}' \'>>${submit_jobs_filename}
done

echo ')'>>${submit_jobs_filename}
echo ''>>${submit_jobs_filename}
echo 'for j in ${!TARGET_DIR[@]}; do'>>${submit_jobs_filename}
echo '    sbatch ${TARGET_DIR[$j]}'>>${submit_jobs_filename}
echo 'done'>>${submit_jobs_filename}
chmod +x ${submit_jobs_filename}
