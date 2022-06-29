
<<COMMENT
TARGET_DIR=(\
cDG_central_flux_dofs048_viscous_ILES \
cDG_central_flux_dofs048_inviscid_ILES \
cDG_central_flux_dofs048_viscous_LES_WALE \
cPlus_central_flux_dofs048_inviscid_ILES \
cDG_l2roe_flux_dofs048_viscous_ILES \
cPlus_central_flux_dofs048_viscous_ILES \
cDG_central_flux_dofs048_viscous_LES_Smagorinsky \
cDG_l2roe_flux_dofs048_viscous_LES_best_SGS \
cPlus_l2roe_flux_dofs048_viscous_LES_best_SGS \
cDG_central_flux_dofs048_viscous_LES_Vreman \
cDG_roe_flux_dofs048_viscous_ILES \
)
COMMENT

# Selected runs
TARGET_DIR=(\
cDG_central_flux_dofs048_viscous_ILES \
cDG_central_flux_dofs048_inviscid_ILES \
)

for j in ${!TARGET_DIR[@]}; do
    cd ${TARGET_DIR[$j]}
    sbatch job_parameters_file_PHiLiP.sh
    cd ../
done