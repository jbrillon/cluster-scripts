flow_case_type_=${1}
poly_degree_=${2}
number_of_grid_elements_per_dimension_=${3}
number_of_processors_=${4}

filename="parameters_for_assembling_mpi_files.txt"
echo "Creating ${filename} ..."
if test -f "${filename}"; then
    rm ${filename}
fi
touch ${filename}
echo "${flow_case_type_}">>${filename}
echo "${poly_degree_}">>${filename}
echo "${number_of_grid_elements_per_dimension_}">>${filename}
echo "${number_of_processors_}">>${filename}