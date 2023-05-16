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

# #================================================================
# # (1A) FLUX NODES TYPE / BASELINE NSFR SCHEME | 96^3 DOFs
# #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# sub_directory="${base_directory}/flux_nodes"
# test_directory="${sub_directory}_local_test"
# walltime="60:00:00"
# poly_degree="5"
# number_of_grid_elements_per_dimension="16"
# nodes=32
# #----------------------------------------------------------------
# # NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1 (i.e. no over-integration)
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation"
# # NSFR cDG with IR two-point numerical flux, on GLL flux nodes, n_quad=P+1 (i.e. no over-integration)
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GLL" "0.1" "large_eddy_simulation"
# # Standard Strong DG on GL flux nodes with n_quad=2*(P+1)
# walltime="168:00:00"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" "6" "GL" "0.1" "large_eddy_simulation"
# # Standard Strong DG on GLL flux nodes with n_quad=2*(P+1)
# walltime="168:00:00"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" "6" "GLL" "0.1" "large_eddy_simulation"
# #----------------------------------------------------------------
# #================================================================

# #================================================================
# # (1B) OVER-INTEGRATION WITH NSFR | 96^3 DOFs
# #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# sub_directory="${base_directory}/over_integration"
# test_directory="${sub_directory}_local_test"
# walltime="60:00:00"
# poly_degree="5"
# number_of_grid_elements_per_dimension="16"
# nodes=32
# #----------------------------------------------------------------
# # NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=2*(P+1)
# walltime="168:00:00"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "6" "GL" "0.1" "large_eddy_simulation"
# # NSFR cDG with IR two-point numerical flux, on GLL flux nodes, n_quad=2*(P+1)
# walltime="168:00:00"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "6" "GLL" "0.1" "large_eddy_simulation"
# #----------------------------------------------------------------
# #================================================================

# #================================================================
# # (2) SOLVER VERIFICATION SECTION | 256^3 DOFs
# #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# sub_directory="${base_directory}/verification"
# test_directory="${sub_directory}_local_test"
# walltime="168:00:00"
# poly_degree="3"
# number_of_grid_elements_per_dimension="64"
# nodes=256
# #----------------------------------------------------------------
# # NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1 (i.e. no over-integration)
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation"
# # NSFR cDG with IR two-point numerical flux, on GLL flux nodes, n_quad=P+1 (i.e. no over-integration)
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GLL" "0.1" "large_eddy_simulation"
# # Standard Strong DG on GL flux nodes with n_quad=2*(P+1)
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" "4" "GL" "0.1" "large_eddy_simulation"
# # Standard Strong DG on GLL flux nodes with n_quad=2*(P+1)
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" "4" "GLL" "0.1" "large_eddy_simulation"
# #----------------------------------------------------------------
# #================================================================

# #================================================================
# # (3) LES SUB-GRID SCALE MODELLING | 96^3 DOFs
# #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# sub_directory="${base_directory}/sgs_model"
# test_directory="${sub_directory}_local_test"
# walltime="60:00:00"
# poly_degree="5"
# number_of_grid_elements_per_dimension="16"
# nodes=32
# #----------------------------------------------------------------
# # SGS MODEL CONSTANTS TO RUN:
# # Smagorinsky with C=0.18 (from original Smagorinsky paper, also in the Nicoud Ducros paper -- theoretical value for isotropic turbulence)
# # Smagorinsky with C=0.10 (from Flad and Gassner)
# # WALE with C=0.5 (from Nicoud and Ducros isotropic turbulence -- page 10 of the pdf)
# # Vreman with C=0.081 (from Cs=0.18)
# #----------------------------------------------------------------
# # -------- GL FLUX NODES -------- 
# #----------------------------------------------------------------
# sub_directory="${base_directory}/sgs_model_GL_flux_nodes"
# test_directory="${sub_directory}_local_test"
# # NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1, LES with SMAG model with C=0.18
# source ./setup_run.sh ${sub_directory} "physics_model" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.18" "large_eddy_simulation"
# # NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1, LES with SMAG model with C=0.10
# source ./setup_run.sh ${sub_directory} "physics_model" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.10" "large_eddy_simulation"
# # NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1, LES with WALE model with C=0.5
# source ./setup_run.sh ${sub_directory} "physics_model" "WALE" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.50" "large_eddy_simulation"
# # NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1, LES with VRMN model with C=0.081
# source ./setup_run.sh ${sub_directory} "physics_model" "VRMN" "cDG" "2PF" ${TP_FLUX_type} "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.081" "large_eddy_simulation"
# #----------------------------------------------------------------
# # -------- GLL FLUX NODES -------- 
# #----------------------------------------------------------------
# sub_directory="${base_directory}/sgs_model_GLL_flux_nodes"
# test_directory="${sub_directory}_local_test"
# # NSFR cDG with IR two-point numerical flux, on GLL flux nodes, n_quad=P+1, LES with SMAG model with C=0.18
# source ./setup_run.sh ${sub_directory} "physics_model" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GLL" "0.18" "large_eddy_simulation"
# # NSFR cDG with IR two-point numerical flux, on GLL flux nodes, n_quad=P+1, LES with SMAG model with C=0.10
# source ./setup_run.sh ${sub_directory} "physics_model" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GLL" "0.10" "large_eddy_simulation"
# # NSFR cDG with IR two-point numerical flux, on GLL flux nodes, n_quad=P+1, LES with WALE model with C=0.5
# source ./setup_run.sh ${sub_directory} "physics_model" "WALE" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GLL" "0.50" "large_eddy_simulation"
# # NSFR cDG with IR two-point numerical flux, on GLL flux nodes, n_quad=P+1, LES with VRMN model with C=0.081
# source ./setup_run.sh ${sub_directory} "physics_model" "VRMN" "cDG" "2PF" ${TP_FLUX_type} "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GLL" "0.081" "large_eddy_simulation"
# #----------------------------------------------------------------
# #================================================================

# #================================================================
# # (4) UPWIND DISSIPATION | 96^3 DOFs
# #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# sub_directory="${base_directory}/upwind_dissipation"
# test_directory="${sub_directory}_local_test"
# walltime="60:00:00"
# poly_degree="5"
# number_of_grid_elements_per_dimension="16"
# nodes=32
# #----------------------------------------------------------------
# # -------- GL FLUX NODES -------- 
# #----------------------------------------------------------------
# sub_directory="${base_directory}/upwind_dissipation_GL_flux_nodes"
# test_directory="${sub_directory}_local_test"
# # NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF-LxF" ${TP_FLUX_type} "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.18" "large_eddy_simulation"
# # NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF-Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.18" "large_eddy_simulation"
# # NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF-L2R" ${TP_FLUX_type} "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.18" "large_eddy_simulation"
# #----------------------------------------------------------------
# # -------- GLL FLUX NODES -------- 
# #----------------------------------------------------------------
# sub_directory="${base_directory}/upwind_dissipation_GLL_flux_nodes"
# test_directory="${sub_directory}_local_test"
# # NSFR cDG with IR two-point numerical flux, on GLL flux nodes, n_quad=P+1
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF-LxF" ${TP_FLUX_type} "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GLL" "0.18" "large_eddy_simulation"
# # NSFR cDG with IR two-point numerical flux, on GLL flux nodes, n_quad=P+1
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF-Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GLL" "0.18" "large_eddy_simulation"
# # NSFR cDG with IR two-point numerical flux, on GLL flux nodes, n_quad=P+1
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF-L2R" ${TP_FLUX_type} "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GLL" "0.18" "large_eddy_simulation"
# #----------------------------------------------------------------
# #================================================================

# #================================================================
# # (3.1) FILTER WIDTH STABILIZATION | 96^3 DOFs
# #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# sub_directory="${base_directory}/filter_width_stabilization"
# test_directory="${sub_directory}_local_test"
# walltime="60:00:00"
# poly_degree="5"
# number_of_grid_elements_per_dimension="16"
# nodes=32
# #----------------------------------------------------------------
# # Standard Strong DG on GL flux nodes with n_quad=(P+1), LES with SMAG model with C=0.18 with $\Delta=(V_{cell}^(1/3))/(P+1)$ 
# walltime="96:00:00"
# source ./setup_run.sh ${sub_directory} "physics_model" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "first_and_last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" "0" "GL" "0.18" "large_eddy_simulation"
# #----------------------------------------------------------------
# #================================================================

# #================================================================
# # (5) TWO POINT FLUX cDG NSFR | 96^3 DOFs
# #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# sub_directory="${base_directory}/two_point_flux"
# test_directory="${sub_directory}_local_test"
# walltime="60:00:00"
# poly_degree="5"
# number_of_grid_elements_per_dimension="16"
# nodes=32
# #----------------------------------------------------------------
# # NSFR cDG with KG two-point numerical flux, on GL flux nodes, n_quad=P+1 (i.e. no over-integration)
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" "KG" "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation"
# # NSFR cDG with CH two-point numerical flux, on GLL flux nodes, n_quad=P+1 (i.e. no over-integration)
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" "CH" "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation"
# # NSFR cDG with Ra two-point numerical flux, on GLL flux nodes, n_quad=P+1 (i.e. no over-integration)
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" "Ra" "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation"
# #----------------------------------------------------------------
# #================================================================

# #================================================================
# # (6) CORRECTION PARAMETER | 96^3 DOFs
# #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# sub_directory="${base_directory}/correction_parameter"
# test_directory="${sub_directory}_local_test"
# walltime="60:00:00"
# poly_degree="5"
# number_of_grid_elements_per_dimension="16"
# nodes=32
# #----------------------------------------------------------------
# # NSFR c+ with IR two-point numerical flux, on GL flux nodes, n_quad=P+1 (i.e. no over-integration)
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cPlus" "2PF" ${TP_FLUX_type} "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation"
# # NSFR cHU with IR two-point numerical flux, on GL flux nodes, n_quad=P+1 (i.e. no over-integration)
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cHU" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation"
# # NSFR cSD with IR two-point numerical flux, on GL flux nodes, n_quad=P+1 (i.e. no over-integration)
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cSD" "2PF" ${TP_FLUX_type} "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation"
# #----------------------------------------------------------------
# #================================================================

# #================================================================
# # (1A) FLUX NODES TYPE / BASELINE NSFR SCHEME | 96^3 DOFs
# #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# sub_directory="${base_directory}/robustness"
# test_directory="${sub_directory}_local_test"
# walltime="60:00:00"
# poly_degree="5"
# #----------------------------------------------------------------
# # ---- 24^3 DOFs ---- 
# walltime="72:00:00"
# poly_degree="5"
# number_of_grid_elements_per_dimension="4"
# nodes=1
# # NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1 (i.e. no over-integration)
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation"
# # Standard Strong DG on GL flux nodes with n_quad=2*(P+1)
# # walltime="168:00:00"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" "6" "GL" "0.1" "large_eddy_simulation"
# # ---- 48^3 DOFs ---- 
# walltime="72:00:00"
# poly_degree="5"
# number_of_grid_elements_per_dimension="8"
# nodes=4
# # NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1 (i.e. no over-integration)
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation"
# # Standard Strong DG on GL flux nodes with n_quad=2*(P+1)
# # walltime="168:00:00"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" "6" "GL" "0.1" "large_eddy_simulation"
# # ---- 12^3 DOFs ---- 
# walltime="72:00:00"
# poly_degree="5"
# number_of_grid_elements_per_dimension="2"
# nodes=1
# # NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1 (i.e. no over-integration)
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation"
# # Standard Strong DG on GL flux nodes with n_quad=2*(P+1)
# # walltime="168:00:00"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" "6" "GL" "0.1" "large_eddy_simulation"
# #----------------------------------------------------------------
# #================================================================

#================================================================
# (?) cDG vs cPlus time step advantage / BASELINE NSFR SCHEME | 96^3 DOFs
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# sub_directory="${base_directory}/time_step_advantage"
# test_directory="${sub_directory}_local_test"
# walltime="48:00:00"
# poly_degree="5"
# number_of_grid_elements_per_dimension="16"
# final_time="12.501"
# nodes=32
# is_cpu_timing_run="false"
#----------------------------------------------------------------
# NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1 (i.e. no over-integration)
# vs
# NSFR cPlus with IR two-point numerical flux, on GL flux nodes, n_quad=P+1 (i.e. no over-integration)
# cDG CFL limit runs
# cfl_number="0.32"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# cfl_number="0.34"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# cfl_number="0.36"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# cfl_number="0.38"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# # cPlus CFL limit runs
# cfl_number="0.42"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cPlus" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# cfl_number="0.44"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cPlus" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# cfl_number="0.46"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cPlus" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# cfl_number="0.48"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cPlus" "2PF" ${TP_FLUX_type} "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# cfl_number="0.4"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time}
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cPlus" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time}
# cfl_number="0.5"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time}
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cPlus" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time}
# cfl_number="0.6"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time}
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cPlus" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time}
# cfl_number="0.7"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time}
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cPlus" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time}
# cfl_number="0.8"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time}
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cPlus" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time}
# cfl_number="0.9"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time}
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cPlus" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time}
# cfl_number="1.0"
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time}
# source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cPlus" "2PF" ${TP_FLUX_type} "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time}
#----------------------------------------------------------------
#================================================================

#================================================================
# (?) cDG vs strong DG cpu time comparison
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
sub_directory="${base_directory}/cpu_time_advantage/with_overint_comp_cost"
test_directory="${sub_directory}_local_test"
walltime="1:00:00"
number_of_grid_elements_per_dimension="4"
final_time="0.00001"
nodes=32
is_cpu_timing_run="true"
cfl_number="0.1"
#----------------------------------------------------------------
# NSFR cDG with IR two-point numerical flux, on GL flux nodes, n_quad=P+1 (i.e. no over-integration)
# vs 
# Standard Strong DG on GL flux nodes with n_quad=2*(P+1)
# p=1
poly_degree="1"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "first" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
overintegration="2"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" ${overintegration} "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# p=2
poly_degree="2"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
overintegration="3"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" ${overintegration} "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# p=3
poly_degree="3"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
overintegration="4"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" ${overintegration} "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# p=4
poly_degree="4"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
overintegration="5"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" ${overintegration} "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# p=5
poly_degree="5"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
overintegration="6"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" ${overintegration} "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# p=6
poly_degree="6"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
overintegration="7"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" ${overintegration} "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# p=7
poly_degree="7"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
overintegration="8"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" ${overintegration} "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# p=8
poly_degree="8"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
overintegration="9"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" ${overintegration} "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# p=9
poly_degree="9"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
overintegration="10"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" ${overintegration} "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# p=10
poly_degree="10"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
overintegration="11"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" ${overintegration} "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# p=11
poly_degree="11"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
overintegration="12"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" ${overintegration} "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# p=12
poly_degree="12"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
overintegration="13"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" ${overintegration} "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# p=13
poly_degree="13"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
overintegration="14"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" ${overintegration} "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# p=14
poly_degree="14"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
overintegration="15"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" ${overintegration} "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
# p=15
poly_degree="15"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "2PF" ${TP_FLUX_type} "TGV" "-" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "false" "0" "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
overintegration="16"
source ./setup_run.sh ${sub_directory} "navier_stokes" "SMAG" "cDG" "Roe" ${TP_FLUX_type} "TGV" "last" ${test_directory} ${poly_degree} ${number_of_grid_elements_per_dimension} ${walltime} ${ntasks_per_node} ${nodes} ${memory_per_node} "true" ${overintegration} "GL" "0.1" "large_eddy_simulation" ${cfl_number} ${final_time} ${is_cpu_timing_run}
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
