TARGET_DIR=(\
viscous_ILES_weak_DG_l2roe_dofs096_p5 \
viscous_ILES_strong_DG_l2roe_dofs096_p5 \
)

for j in ${!TARGET_DIR[@]}; do
    cd ${TARGET_DIR[$j]}
    sbatch job_prm_file.sh
    cd ../
done
