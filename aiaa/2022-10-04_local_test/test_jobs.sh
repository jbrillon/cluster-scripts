TARGET_DIR=(\
viscous_ILES_weak_DG_l2roe_dofs096_p5 \
viscous_ILES_strong_DG_l2roe_dofs096_p5 \
)

for j in ${!TARGET_DIR[@]}; do
    echo "================================================="
    echo "STARTING: ${TARGET_DIR[$j]}"
    echo "================================================="
    /usr/bin/mpirun "-np" "4" "/home/julien/Codes/2022-06-15/PHiLiP/build_release/bin/PHiLiP_3D" "-i" "${TARGET_DIR[$j]}/input.prm"
    echo "================================================="
    echo "COMPLETED: ${TARGET_DIR[$j]}"
    echo "================================================="
done
