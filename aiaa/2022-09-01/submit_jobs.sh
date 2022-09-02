TARGET_DIR=(\
viscous_ILES_cDG_KG_two_point_flux_dofs096_p5 \
viscous_ILES_cPlus_KG_two_point_flux_dofs096_p5 \
viscous_ILES_cSD_KG_two_point_flux_dofs096_p5 \
viscous_ILES_cHU_KG_two_point_flux_dofs096_p5 \
viscous_ILES_cDG_KG_two_point_flux_with_l2roe_dissipation_dofs096_p5 \
viscous_ILES_cPlus_KG_two_point_flux_with_l2roe_dissipation_dofs096_p5 \
viscous_ILES_cSD_KG_two_point_flux_with_l2roe_dissipation_dofs096_p5 \
viscous_ILES_cHU_KG_two_point_flux_with_l2roe_dissipation_dofs096_p5 \
viscous_LES_smagorinsky_cDG_KG_two_point_flux_dofs096_p5 \
viscous_LES_smagorinsky_cPlus_KG_two_point_flux_dofs096_p5 \
viscous_LES_smagorinsky_cSD_KG_two_point_flux_dofs096_p5 \
viscous_LES_smagorinsky_cHU_KG_two_point_flux_dofs096_p5 \
viscous_LES_smagorinsky_cDG_KG_two_point_flux_with_l2roe_dissipation_dofs096_p5 \
viscous_LES_smagorinsky_cPlus_KG_two_point_flux_with_l2roe_dissipation_dofs096_p5 \
viscous_LES_smagorinsky_cSD_KG_two_point_flux_with_l2roe_dissipation_dofs096_p5 \
viscous_LES_smagorinsky_cHU_KG_two_point_flux_with_l2roe_dissipation_dofs096_p5 \
)

for j in ${!TARGET_DIR[@]}; do
    cd ${TARGET_DIR[$j]}
    sbatch job_prm_file.sh
    cd ../
done