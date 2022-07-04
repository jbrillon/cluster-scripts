TARGET_DIR=(\
viscous_ILES_cDG_central_flux_dofs048_p5 \
viscous_ILES_cDG_l2roe_dofs048_p5 \
viscous_ILES_cPlus_central_flux_dofs048_p5 \
viscous_LES_smagorinsky_cDG_central_flux_dofs048_p5 \
viscous_LES_smagorinsky_cDG_l2roe_dofs048_p5 \
viscous_LES_smagorinsky_cPlus_l2roe_dofs048_p5 \
inviscid_ILES_cDG_entropy_conserving_flux_dofs048_p5 \
inviscid_ILES_cPlus_entropy_conserving_flux_dofs048_p5 \
)

for j in ${!TARGET_DIR[@]}; do
    cd ${TARGET_DIR[$j]}
    sbatch job_prm_file.sh
    cd ../
done
