# NUMERICAL_FLUXES=("central_flux" "roe" "l2roe" "entropy_conserving_flux")
# CORRECTION_PARAMETERS=("cDG" "cPlus")
# PDE_TYPES=("navier_stokes" "euler" "physics_model")
# SGS_MODEL_TYPES=("smagorinsky" "wall_adaptive_local_eddy_viscosity" "vreman")
# default parameters
sub_directory="wccm_runs"

# TO DO: Run regular strong DG with over-integration

# INVISCID RUNS:
#================================================================
source ./setup_run.sh ${sub_directory} \
"euler" "smagorinsky" "cDG" "entropy_conserving_flux"

source ./setup_run.sh ${sub_directory} \
"euler" "smagorinsky" "cPlus" "entropy_conserving_flux"
#================================================================

# VISCOUS RUNS:
#================================================================
# cDG + KEP
#----------------------------------------------------------------
source ./setup_run.sh ${sub_directory} \
"navier_stokes" "smagorinsky" "cDG" "entropy_conserving_flux"

# cPlus + KEP
#----------------------------------------------------------------
source ./setup_run.sh ${sub_directory} \
"navier_stokes" "smagorinsky" "cPlus" "entropy_conserving_flux"

# cDG + KEP + Riemann
#----------------------------------------------------------------
source ./setup_run.sh ${sub_directory} \
"navier_stokes" "smagorinsky" "cDG" "entropy_conserving_flux_with_l2roe_dissipation"

source ./setup_run.sh ${sub_directory} \
"navier_stokes" "smagorinsky" "cDG" "entropy_conserving_flux_with_roe_dissipation"

source ./setup_run.sh ${sub_directory} \
"navier_stokes" "smagorinsky" "cDG" "entropy_conserving_flux_with_lax_friedrichs_dissipation"

# cDG + KEP + SGS
#----------------------------------------------------------------
source ./setup_run.sh ${sub_directory} \
"physics_model" "smagorinsky" "cDG" "entropy_conserving_flux"

source ./setup_run.sh ${sub_directory} \
"physics_model" "wall_adaptive_local_eddy_viscosity" "cDG" "entropy_conserving_flux"

source ./setup_run.sh ${sub_directory} \
"physics_model" "vreman" "cDG" "entropy_conserving_flux"

# cDG + KEP + SGS + Riemann
#----------------------------------------------------------------
source ./setup_run.sh ${sub_directory} \
"physics_model" "smagorinsky" "cDG" "entropy_conserving_flux_with_l2roe_dissipation"

# KEP + SGS + Riemann + cPlus
#----------------------------------------------------------------
source ./setup_run.sh ${sub_directory} \
"physics_model" "smagorinsky" "cPlus" "entropy_conserving_flux_with_l2roe_dissipation"

# TIMS run
# source ./setup_run.sh ${sub_directory} \
# "navier_stokes" "smagorinsky" "cDG" "entropy_conserving_flux"

# source ./setup_run.sh ${sub_directory} \
# "navier_stokes" "smagorinsky" "cDG" "entropy_conserving_flux_with_lax_friedrichs_dissipation"

# source ./setup_run.sh ${sub_directory} \
# "navier_stokes" "smagorinsky" "cPlus" "entropy_conserving_flux_with_lax_friedrichs_dissipation"

# source ./setup_run.sh ${sub_directory} \
# "navier_stokes" "smagorinsky" "cPlus" "entropy_conserving_flux"