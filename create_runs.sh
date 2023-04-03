# NUMERICAL_FLUXES=("central_flux" "roe" "l2roe" "two_point_flux")
# CORRECTION_PARAMETERS=("cDG" "cPlus")
# PDE_TYPES=("navier_stokes" "euler" "physics_model")
# SGS_MODEL_TYPES=("smagorinsky" "wall_adaptive_local_eddy_viscosity" "vreman")

#================================================================
# DEFAULT PARAMETERS
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
base_directory="jcp01"
ntasks_per_node=16
memory_per_node="63G"
#----------------------------------------------------------------
# - two point flux type, options are : <KG | IR | CH | Ra>
TP_FLUX_type="IR"
#================================================================
# Guide to choosing nodes based on DOFs
# nodes/DOFs: 1/24^3 (P5), 4/48^3 (P5), 32/96^3 (P5), 256/256^3 (P3)

# SMAG, WALE, VRMN
# LxF, Roe, L2R, 2PF, 2PF-LxF, 2PF-Roe, 2PF-L2R

#================================================================
# SOLVER VERIFICATION SECTION
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
sub_directory="${base_directory}/verification"
test_directory="${sub_directory}_local_test"
walltime="168:00:00"
poly_degree="3"
number_of_grid_elements_per_dimension="64"
nodes=64
#----------------------------------------------------------------
# DNS NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1 (i.e. no over-integration)
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation"
# DNS NSFR cDG with IR two-point numerical flux, on GLL flux nodes, n_quad=P+1 (i.e. no over-integration)
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GLL" "0.1" "large_eddy_simulation"
# DNS Standard Strong DG on GL flux nodes with n_quad=2*(P+1)
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" "4" "GL" "0.1" "large_eddy_simulation"
# DNS Standard Strong DG on GLL flux nodes with n_quad=2*(P+1)
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" "4" "GLL" "0.1" "large_eddy_simulation"
#----------------------------------------------------------------
#================================================================

#================================================================
# SOLVER VERIFICATION SECTION
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


#----------------------------------------------------------------
# 24^3 DHIT RUNS
sub_directory="${base_directory}/2022-11-29_TGV_SPECTRA_24dofs"
test_directory="${sub_directory}_local_test"
walltime="60:00:00"
poly_degree="5"
number_of_grid_elements_per_dimension="4"
nodes=1
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux" "IR" "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cPlus" "two_point_flux" "IR" "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"

#----------------------------------------------------------------
# 48^3 DHIT RUNS
sub_directory="${base_directory}/2022-11-29_TGV_SPECTRA_48dofs"
test_directory="${sub_directory}_local_test"
walltime="60:00:00"
poly_degree="5"
number_of_grid_elements_per_dimension="8"
nodes=4
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux" "IR" "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cPlus" "two_point_flux" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cPlus" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cDG" "two_point_flux" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cPlus" "two_point_flux" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cDG" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cPlus" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"

#----------------------------------------------------------------
# 96^3 DHIT RUNS (cDG and c+)
sub_directory="${base_directory}/2022-11-29_TGV_SPECTRA_96dofs_cDG_cPlus"
test_directory="${sub_directory}_local_test"
walltime="60:00:00"
poly_degree="5"
number_of_grid_elements_per_dimension="16"
nodes=32
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux" "IR" "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cPlus" "two_point_flux" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cPlus" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cDG" "two_point_flux" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cPlus" "two_point_flux" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cDG" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cPlus" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"

#----------------------------------------------------------------
# 96^3 DHIT RUNS (cSD and cHU)
sub_directory="${base_directory}/2022-11-29_TGV_SPECTRA_96dofs_cSD_cHU"
test_directory="${sub_directory}_local_test"
walltime="60:00:00"
poly_degree="5"
number_of_grid_elements_per_dimension="16"
nodes=32
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cSD" "two_point_flux" "IR" "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cHU" "two_point_flux" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cSD" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cHU" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cSD" "two_point_flux" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cHU" "two_point_flux" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cSD" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cHU" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"


#================================================================