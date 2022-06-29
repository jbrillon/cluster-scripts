# Inputs -- these are keynames
conv_num_flux="ROE"
diss_num_flux="SIP"
manufactured_solution="MS3"
physics="NS"

# Prefix
baseline_name="${physics}_${conv_num_flux}_${diss_num_flux}_${manufactured_solution}"
sh_file_prefix="job_prm_PHiLiP"
let poly_start=3
let poly_end=4

for((i = $poly_start; i<=$poly_end; i++)); do
	sbatch "${sh_file_prefix}_${name}.sh"
done