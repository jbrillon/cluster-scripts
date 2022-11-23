filename=${1}
flow_case_type_=${2}
poly_degree_=${3}
number_of_grid_elements_per_dimension_=${4}
number_of_processors_=${5}

echo "Creating ${filename} ..."
if test -f "${filename}"; then
    rm ${filename}
fi
touch ${filename}
echo "${flow_case_type_}">>${filename}
echo "${poly_degree_}">>${filename}
echo "${number_of_grid_elements_per_dimension_}">>${filename}
echo "${number_of_processors_}">>${filename}