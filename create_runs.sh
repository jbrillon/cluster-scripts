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

# #================================================================
# base_directory="aiaa"
# sub_directory="${base_directory}/2022-09-16"
# test_directory="${sub_directory}_local_test"
# poly_degree="5"
# number_of_grid_elements_per_dimension="16"
# walltime="2:59:00"
# ntasks_per_node=16
# memory_per_node="63G"
# #----------------------------------------------------------------
# nodes=16
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
# #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# nodes=8
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
# #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# poly_degree="3"
# number_of_grid_elements_per_dimension="16"
# nodes=4
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
# #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# #================================================================


# DNS RUN
# #================================================================
# base_directory="aiaa"
# sub_directory="${base_directory}/2022-09-20"
# test_directory="${sub_directory}_local_test"
# poly_degree="3"
# number_of_grid_elements_per_dimension="64"
# walltime="167:00:00"
# ntasks_per_node=16
# memory_per_node="63G"
# #----------------------------------------------------------------
# nodes=256
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "first_and_last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node}
# #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# #================================================================


#================================================================
base_directory="aiaa"
ntasks_per_node=16
memory_per_node="63G"
# #----------------------------------------------------------------
# # 96^3 TGV RUNS
# sub_directory="${base_directory}/2022-11-09_96dofs"
# test_directory="${sub_directory}_local_test"
# walltime="120:00:00"
# poly_degree="5"
# number_of_grid_elements_per_dimension="16"
# nodes=32
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux" "IR" "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cPlus" "two_point_flux" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "lax_friedrichs" "IR" "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true"
# #----------------------------------------------------------------
# # 48^3 TGV RUNS
# sub_directory="${base_directory}/2022-11-09_48dofs"
# test_directory="${sub_directory}_local_test"
# walltime="120:00:00"
# poly_degree="5"
# number_of_grid_elements_per_dimension="8"
# nodes=4
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux" "IR" "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cPlus" "two_point_flux" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "lax_friedrichs" "IR" "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true"
# #----------------------------------------------------------------
# # 24^3 TGV RUNS
# sub_directory="${base_directory}/2022-11-09_24dofs"
# test_directory="${sub_directory}_local_test"
# walltime="120:00:00"
# poly_degree="5"
# number_of_grid_elements_per_dimension="4"
# nodes=1
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux" "IR" "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cPlus" "two_point_flux" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "lax_friedrichs" "IR" "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true"
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# #----------------------------------------------------------------
# # 24^3 DHIT RUNS
# sub_directory="${base_directory}/2022-11-11_24dofs"
# test_directory="${sub_directory}_local_test"
# walltime="120:00:00"
# poly_degree="5"
# number_of_grid_elements_per_dimension="4"
# nodes=1
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux" "IR" "DHIT" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cPlus" "two_point_flux" "IR" "DHIT" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "lax_friedrichs" "IR" "DHIT" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true"
#----------------------------------------------------------------
# 128^3 DHIT RUNS
sub_directory="${base_directory}/2022-11-11_DHIT_test_128dofs"
test_directory="${sub_directory}_local_test"
walltime="23:00:00"
poly_degree="3"
number_of_grid_elements_per_dimension="32"
nodes=32
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux" "IR" "DHIT" "first_and_last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cPlus" "two_point_flux" "IR" "DHIT" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "lax_friedrichs" "IR" "DHIT" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true"
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#================================================================