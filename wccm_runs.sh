# NUMERICAL_FLUXES=("central_flux" "roe" "l2roe" "entropy_conserving_flux")
# CORRECTION_PARAMETERS=("cDG" "cPlus")
# PDE_TYPES=("navier_stokes" "euler" "physics_model")
# SGS_MODEL_TYPES=("smagorinsky" "wall_adaptive_local_eddy_viscosity" "vreman")
# default parameters
sub_directory="wccm_runs"

source ./setup_run.sh ${sub_directory} \
"euler" "smagorinsky" "cDG" "entropy_conserving_flux"

source ./setup_run.sh ${sub_directory} \
"euler" "smagorinsky" "cPlus" "entropy_conserving_flux"

source ./setup_run.sh ${sub_directory} \
"navier_stokes" "smagorinsky" "cDG" "central_flux"

source ./setup_run.sh ${sub_directory} \
"navier_stokes" "smagorinsky" "cDG" "l2roe"

source ./setup_run.sh ${sub_directory} \
"physics_model" "smagorinsky" "cDG" "central_flux"

source ./setup_run.sh ${sub_directory} \
"physics_model" "smagorinsky" "cDG" "l2roe"

source ./setup_run.sh ${sub_directory} \
"navier_stokes" "smagorinsky" "cPlus" "central_flux"

source ./setup_run.sh ${sub_directory} \
"physics_model" "smagorinsky" "cPlus" "l2roe"

