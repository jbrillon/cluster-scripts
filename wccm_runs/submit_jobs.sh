# TARGET_DIR=(\
# inviscid_ILES_cDG_entropy_conserving_flux_dofs048_p5 \
# inviscid_ILES_cPlus_entropy_conserving_flux_dofs048_p5 \
# viscous_ILES_cDG_entropy_conserving_flux_dofs048_p5 \
# viscous_ILES_cDG_entropy_conserving_flux_with_l2roe_dissipation_dofs048_p5 \
# viscous_ILES_cDG_entropy_conserving_flux_with_lax_friedrichs_dissipation_dofs048_p5 \
# viscous_ILES_cDG_entropy_conserving_flux_with_roe_dissipation_dofs048_p5 \
# viscous_ILES_cPlus_entropy_conserving_flux_dofs048_p5 \
# viscous_LES_smagorinsky_cDG_entropy_conserving_flux_dofs048_p5 \
# viscous_LES_smagorinsky_cDG_entropy_conserving_flux_with_l2roe_dissipation_dofs048_p5 \
# viscous_LES_smagorinsky_cPlus_entropy_conserving_flux_with_l2roe_dissipation_dofs048_p5 \
# viscous_LES_vreman_cDG_entropy_conserving_flux_dofs048_p5 \
# viscous_LES_wall_adaptive_local_eddy_viscosity_cDG_entropy_conserving_flux_dofs048_p5 \
# )

TARGET_DIR=(\
viscous_ILES_cDG_entropy_conserving_flux_dofs096_p5 \
viscous_ILES_cPlus_entropy_conserving_flux_dofs096_p5 \
viscous_ILES_cDG_entropy_conserving_flux_with_l2roe_dissipation_dofs096_p5 \
viscous_ILES_cDG_entropy_conserving_flux_with_lax_friedrichs_dissipation_dofs096_p5 \
viscous_ILES_cDG_entropy_conserving_flux_with_roe_dissipation_dofs096_p5 \
)

for j in ${!TARGET_DIR[@]}; do
    cd ${TARGET_DIR[$j]}
    sbatch job_prm_file.sh
    cd ../
done

sacct --format="JobID,JobName%85,NNodes,NCPUS,Timelimit"
