# NUMERICAL_FLUXES=("central_flux" "roe" "l2roe" "two_point_flux")
# CORRECTION_PARAMETERS=("cDG" "cPlus")
# PDE_TYPES=("navier_stokes" "euler" "physics_model")
# SGS_MODEL_TYPES=("smagorinsky" "wall_adaptive_local_eddy_viscosity" "vreman")
# default parameters


# #================================================================
# base_directory="aiaa"
# sub_directory="${base_directory}/2022-09-06"
# test_directory="${sub_directory}_local_test"
# poly_degree="5"
# number_of_grid_elements_per_dimension="16"
# walltime="167:00:00"
# ntasks_per_node=16
# nodes=32
# memory_per_node="63G"
# #----------------------------------------------------------------
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux" "KG" "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cPlus" "two_point_flux" "KG" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cSD" "two_point_flux" "KG" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cHU" "two_point_flux" "KG" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
# #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cPlus" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cSD" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cHU" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
# #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cDG" "two_point_flux" "KG" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
# source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cPlus" "two_point_flux" "KG" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
# source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cSD" "two_point_flux" "KG" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
# source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cHU" "two_point_flux" "KG" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
# #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cDG" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
# source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cPlus" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
# source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cSD" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
# source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cHU" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
# #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# #================================================================

#================================================================
base_directory="aiaa"
sub_directory="${base_directory}/2022-09-16"
test_directory="${sub_directory}_local_test"
poly_degree="5"
number_of_grid_elements_per_dimension="16"
walltime="2:59:00"
ntasks_per_node=16
memory_per_node="63G"
#----------------------------------------------------------------
nodes=16
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
poly_degree="5"
number_of_grid_elements_per_dimension="16"
# TO DO: Somehow not redeclaring these two variables above causes them to be P=2 and nEl=4 -- to be figured out!
nodes=8
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#================================================================