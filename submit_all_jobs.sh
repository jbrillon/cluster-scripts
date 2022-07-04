TARGET_DIR=(\
drag_transonic \
lift_transonic \
lift_subsonic \
)

for j in ${!TARGET_DIR[@]}; do
    cd ${TARGET_DIR[$j]}
    sbatch job_prm_file.sh
    cd ../
done
