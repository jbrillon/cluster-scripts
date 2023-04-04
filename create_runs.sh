# NUMERICAL_FLUXES=("central_flux" "roe" "l2roe" "two_point_flux")
# CORRECTION_PARAMETERS=("cDG" "cPlus")
# PDE_TYPES=("navier_stokes" "euler" "physics_model")
# SGS_MODEL_TYPES=("smagorinsky" "wall_adaptive_local_eddy_viscosity" "vreman")

#================================================================
# DEFAULT PARAMETERS
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
base_directory="outputs/jcp"
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

if [ ! -d ${base_directory} ]; then
    echo "Creating base directory for runs: ${base_directory}"
    mkdir "${base_directory}"
fi

#================================================================
# (1A) FLUX NODES TYPE / BASELINE NSFR SCHEME | 96^3 DOFs
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
sub_directory="${base_directory}/flux_nodes"
test_directory="${sub_directory}_local_test"
walltime="60:00:00"
poly_degree="5"
number_of_grid_elements_per_dimension="16"
nodes=32
#----------------------------------------------------------------
# NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1 (i.e. no over-integration)
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation"
# NSFR cDG with IR two-point numerical flux, on GLL flux nodes, n_quad=P+1 (i.e. no over-integration)
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GLL" "0.1" "large_eddy_simulation"
# Standard Strong DG on GL flux nodes with n_quad=2*(P+1)
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" "6" "GL" "0.1" "large_eddy_simulation"
# Standard Strong DG on GLL flux nodes with n_quad=2*(P+1)
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" "6" "GLL" "0.1" "large_eddy_simulation"
#----------------------------------------------------------------
#================================================================

#================================================================
# (1B) OVER-INTEGRATION WITH NSFR | 96^3 DOFs
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
sub_directory="${base_directory}/over_integration"
test_directory="${sub_directory}_local_test"
walltime="60:00:00"
poly_degree="5"
number_of_grid_elements_per_dimension="16"
nodes=32
#----------------------------------------------------------------
# NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=2*(P+1)
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "6" "GL" "0.1" "large_eddy_simulation"
# NSFR cDG with IR two-point numerical flux, on GLL flux nodes, n_quad=2*(P+1)
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "6" "GLL" "0.1" "large_eddy_simulation"
#----------------------------------------------------------------
#================================================================

#================================================================
# (2) SOLVER VERIFICATION SECTION | 256^3 DOFs
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
sub_directory="${base_directory}/verification"
test_directory="${sub_directory}_local_test"
walltime="168:00:00"
poly_degree="3"
number_of_grid_elements_per_dimension="64"
nodes=64
#----------------------------------------------------------------
# NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1 (i.e. no over-integration)
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation"
# NSFR cDG with IR two-point numerical flux, on GLL flux nodes, n_quad=P+1 (i.e. no over-integration)
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GLL" "0.1" "large_eddy_simulation"
# Standard Strong DG on GL flux nodes with n_quad=2*(P+1)
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" "4" "GL" "0.1" "large_eddy_simulation"
# Standard Strong DG on GLL flux nodes with n_quad=2*(P+1)
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" "4" "GLL" "0.1" "large_eddy_simulation"
#----------------------------------------------------------------
#================================================================

#================================================================
# (3) LES SUB-GRID SCALE MODELLING | 96^3 DOFs
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
sub_directory="${base_directory}/sgs_model"
test_directory="${sub_directory}_local_test"
walltime="60:00:00"
poly_degree="5"
number_of_grid_elements_per_dimension="16"
nodes=32
#----------------------------------------------------------------
# SGS MODEL CONSTANTS TO RUN:
# Smagorinsky with C=0.18 (from original Smagorinsky paper, also in the Nicoud Ducros paper -- theoretical value for isotropic turbulence)
# Smagorinsky with C=0.10 (from Flad and Gassner)
# WALE with C=0.5 (from Nicoud and Ducros isotropic turbulence -- page 10 of the pdf)
# Vreman with C=0.081 (from Cs=0.18)
#----------------------------------------------------------------
# -------- GL FLUX NODES -------- 
#----------------------------------------------------------------
sub_directory="${base_directory}/sgs_model_GL_flux_nodes"
test_directory="${sub_directory}_local_test"
# NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1, LES with SMAG model with C=0.18
source ./setup_run.sh ${sub_directory} "physics_model" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.18" "large_eddy_simulation"
# NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1, LES with SMAG model with C=0.10
source ./setup_run.sh ${sub_directory} "physics_model" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.10" "large_eddy_simulation"
# NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1, LES with WALE model with C=0.5
source ./setup_run.sh ${sub_directory} "physics_model" "WALE" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.50" "large_eddy_simulation"
# NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1, LES with VRMN model with C=0.081
source ./setup_run.sh ${sub_directory} "physics_model" "VRMN" "cDG" "2PF" ${TP_FLUX_type} "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.081" "large_eddy_simulation"
#----------------------------------------------------------------
# -------- GLL FLUX NODES -------- 
#----------------------------------------------------------------
sub_directory="${base_directory}/sgs_model_GLL_flux_nodes"
test_directory="${sub_directory}_local_test"
# NSFR cDG with IR two-point numerical flux, on GLL flux nodes, n_quad=P+1, LES with SMAG model with C=0.18
source ./setup_run.sh ${sub_directory} "physics_model" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GLL" "0.18" "large_eddy_simulation"
# NSFR cDG with IR two-point numerical flux, on GLL flux nodes, n_quad=P+1, LES with SMAG model with C=0.10
source ./setup_run.sh ${sub_directory} "physics_model" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GLL" "0.10" "large_eddy_simulation"
# NSFR cDG with IR two-point numerical flux, on GLL flux nodes, n_quad=P+1, LES with WALE model with C=0.5
source ./setup_run.sh ${sub_directory} "physics_model" "WALE" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GLL" "0.50" "large_eddy_simulation"
# NSFR cDG with IR two-point numerical flux, on GLL flux nodes, n_quad=P+1, LES with VRMN model with C=0.081
source ./setup_run.sh ${sub_directory} "physics_model" "VRMN" "cDG" "2PF" ${TP_FLUX_type} "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GLL" "0.081" "large_eddy_simulation"
#----------------------------------------------------------------
#================================================================

#================================================================
# (4) UPWIND DISSIPATION | 96^3 DOFs
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
sub_directory="${base_directory}/upwind_dissipation"
test_directory="${sub_directory}_local_test"
walltime="60:00:00"
poly_degree="5"
number_of_grid_elements_per_dimension="16"
nodes=32
#----------------------------------------------------------------
# -------- GL FLUX NODES -------- 
#----------------------------------------------------------------
sub_directory="${base_directory}/upwind_dissipation_GL_flux_nodes"
test_directory="${sub_directory}_local_test"
# NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF-LxF" ${TP_FLUX_type} "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.18" "large_eddy_simulation"
# NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF-Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.18" "large_eddy_simulation"
# NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF-L2R" ${TP_FLUX_type} "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.18" "large_eddy_simulation"
#----------------------------------------------------------------
# -------- GLL FLUX NODES -------- 
#----------------------------------------------------------------
sub_directory="${base_directory}/upwind_dissipation_GLL_flux_nodes"
test_directory="${sub_directory}_local_test"
# NSFR cDG with IR two-point numerical flux, on GLL flux nodes, n_quad=P+1
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF-LxF" ${TP_FLUX_type} "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GLL" "0.18" "large_eddy_simulation"
# NSFR cDG with IR two-point numerical flux, on GLL flux nodes, n_quad=P+1
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF-Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GLL" "0.18" "large_eddy_simulation"
# NSFR cDG with IR two-point numerical flux, on GLL flux nodes, n_quad=P+1
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF-L2R" ${TP_FLUX_type} "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GLL" "0.18" "large_eddy_simulation"
#----------------------------------------------------------------
#================================================================

# #----------------------------------------------------------------
# # 24^3 DHIT RUNS
# sub_directory="${base_directory}/2022-11-29_TGV_SPECTRA_24dofs"
# test_directory="${sub_directory}_local_test"
# walltime="60:00:00"
# poly_degree="5"
# number_of_grid_elements_per_dimension="4"
# nodes=1
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux" "IR" "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cPlus" "two_point_flux" "IR" "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"

# #----------------------------------------------------------------
# # 48^3 DHIT RUNS
# sub_directory="${base_directory}/2022-11-29_TGV_SPECTRA_48dofs"
# test_directory="${sub_directory}_local_test"
# walltime="60:00:00"
# poly_degree="5"
# number_of_grid_elements_per_dimension="8"
# nodes=4
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux" "IR" "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cPlus" "two_point_flux" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cPlus" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cDG" "two_point_flux" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cPlus" "two_point_flux" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cDG" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cPlus" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"

# #----------------------------------------------------------------
# # 96^3 DHIT RUNS (cDG and c+)
# sub_directory="${base_directory}/2022-11-29_TGV_SPECTRA_96dofs_cDG_cPlus"
# test_directory="${sub_directory}_local_test"
# walltime="60:00:00"
# poly_degree="5"
# number_of_grid_elements_per_dimension="16"
# nodes=32
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux" "IR" "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cPlus" "two_point_flux" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cPlus" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cDG" "two_point_flux" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cPlus" "two_point_flux" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cDG" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cPlus" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"

# #----------------------------------------------------------------
# # 96^3 DHIT RUNS (cSD and cHU)
# sub_directory="${base_directory}/2022-11-29_TGV_SPECTRA_96dofs_cSD_cHU"
# test_directory="${sub_directory}_local_test"
# walltime="60:00:00"
# poly_degree="5"
# number_of_grid_elements_per_dimension="16"
# nodes=32
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cSD" "two_point_flux" "IR" "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cHU" "two_point_flux" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cSD" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cHU" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cSD" "two_point_flux" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cHU" "two_point_flux" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cSD" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cHU" "two_point_flux_with_l2roe_dissipation" "IR" "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false"
# #================================================================
