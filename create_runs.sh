# NUMERICAL_FLUXES=("central_flux" "roe" "l2roe" "two_point_flux")
# CORRECTION_PARAMETERS=("cDG" "cPlus")
# PDE_TYPES=("navier_stokes" "euler" "physics_model")
# SGS_MODEL_TYPES=("smagorinsky" "wall_adaptive_local_eddy_viscosity" "vreman")
# default parameters
base_directory="aiaa"
sub_directory="${base_directory}/2022-09-06"
test_directory="${sub_directory}_local_test"
# TO DO: Run regular strong DG with over-integration

if [ ! -d ${sub_directory} ]; then
    echo "Creating directory for runs: ${sub_directory}"
    mkdir "${sub_directory}"
fi

if [ ! -d ${test_directory} ]; then
    echo "Creating directory for local testing of runs: ${test_directory}"
    mkdir "${test_directory}"
fi

# VISCOUS TGV RUNS:
#================================================================
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux" "KG" "TGV" "first" ${test_directory}
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cPlus" "two_point_flux" "KG" "TGV" "-" ${test_directory}
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cSD" "two_point_flux" "KG" "TGV" "-" ${test_directory}
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cHU" "two_point_flux" "KG" "TGV" "-" ${test_directory}
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cDG" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "-" ${test_directory}
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cPlus" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "-" ${test_directory}
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cSD" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "-" ${test_directory}
source ./setup_run.sh ${sub_directory} "navier_stokes" "smagorinsky" "cHU" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "-" ${test_directory}
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cDG" "two_point_flux" "KG" "TGV" "-" ${test_directory}
source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cPlus" "two_point_flux" "KG" "TGV" "-" ${test_directory}
source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cSD" "two_point_flux" "KG" "TGV" "-" ${test_directory}
source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cHU" "two_point_flux" "KG" "TGV" "-" ${test_directory}
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cDG" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "-" ${test_directory}
source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cPlus" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "-" ${test_directory}
source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cSD" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "-" ${test_directory}
source ./setup_run.sh ${sub_directory} "physics_model" "smagorinsky" "cHU" "two_point_flux_with_l2roe_dissipation" "KG" "TGV" "last" ${test_directory}
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-