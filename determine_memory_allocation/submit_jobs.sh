for poly_degree in $(seq 5 2 7)
do
	for number_of_nodes in $(seq 1 1 10)
	do
		filename="job_${number_of_nodes}_nodes_p${poly_degree}.sh"
		# Submit job
		sbatch ${filename}
	done
done
