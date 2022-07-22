TARGET_DIR=(\
inviscid_ILES_cDG_entropy_conserving_flux_dofs012_p2 \
viscous_ILES_cPlus_entropy_conserving_flux_dofs012_p2 \
inviscid_ILES_cPlus_entropy_conserving_flux_dofs012_p2 \
viscous_LES_smagorinsky_cDG_entropy_conserving_flux_dofs012_p2 \
viscous_LES_smagorinsky_cDG_entropy_conserving_flux_with_l2roe_dissipation_dofs012_p2 \
viscous_ILES_cDG_entropy_conserving_flux_dofs012_p2 \
viscous_LES_smagorinsky_cPlus_entropy_conserving_flux_with_l2roe_dissipation_dofs012_p2 \
viscous_ILES_cDG_entropy_conserving_flux_with_l2roe_dissipation_dofs012_p2 \
viscous_LES_vreman_cDG_entropy_conserving_flux_dofs012_p2 \
viscous_ILES_cDG_entropy_conserving_flux_with_lax_friedrichs_dissipation_dofs012_p2 \
viscous_LES_wall_adaptive_local_eddy_viscosity_cDG_entropy_conserving_flux_dofs012_p2 \
viscous_ILES_cDG_entropy_conserving_flux_with_roe_dissipation_dofs012_p2 \
)

for j in ${!TARGET_DIR[@]}; do
    echo "================================================="
    echo "STARTING: ${TARGET_DIR[$j]}"
    echo "================================================="
    /usr/bin/mpirun "-np" "4" "/home/julien/Codes/2022-06-15/PHiLiP/build_release/bin/PHiLiP_3D" "-i" "/home/julien/Codes/cluster-scripts/test_wccm_runs/${TARGET_DIR[$j]}/input.prm"
    echo "================================================="
    echo "COMPLETED: ${TARGET_DIR[$j]}"
    echo "================================================="
done
