# Ref: https://linuxize.com/post/how-to-use-rsync-for-local-and-remote-data-transfer-and-synchronization/
# Example
# rsync -a --progress outputs/jcp/ brillon@narval.computecanada.ca:scratch/2023_JCP/
rsync -a --progress outputs/jcp/strong_scaling_p5_96_runs_for_averaging/strong_scaling_TGV_p5_96_run_05/submit_jobs.sh brillon@narval.computecanada.ca:scratch/2023_JCP/strong_scaling_p5_96_runs_for_averaging/strong_scaling_TGV_p5_96_run_01/
rsync -a --progress outputs/jcp/strong_scaling_p5_96_runs_for_averaging/strong_scaling_TGV_p5_96_run_05/submit_jobs.sh brillon@narval.computecanada.ca:scratch/2023_JCP/strong_scaling_p5_96_runs_for_averaging/strong_scaling_TGV_p5_96_run_02/
rsync -a --progress outputs/jcp/strong_scaling_p5_96_runs_for_averaging/strong_scaling_TGV_p5_96_run_05/submit_jobs.sh brillon@narval.computecanada.ca:scratch/2023_JCP/strong_scaling_p5_96_runs_for_averaging/strong_scaling_TGV_p5_96_run_03/
rsync -a --progress outputs/jcp/strong_scaling_p5_96_runs_for_averaging/strong_scaling_TGV_p5_96_run_05/submit_jobs.sh brillon@narval.computecanada.ca:scratch/2023_JCP/strong_scaling_p5_96_runs_for_averaging/strong_scaling_TGV_p5_96_run_04/
rsync -a --progress outputs/jcp/strong_scaling_p5_96_runs_for_averaging/strong_scaling_TGV_p5_96_run_05/submit_jobs.sh brillon@narval.computecanada.ca:scratch/2023_JCP/strong_scaling_p5_96_runs_for_averaging/strong_scaling_TGV_p5_96_run_05/
#rsync -a --progress outputs/jcp/sgs_model_GL_flux_nodes/* brillon@narval.computecanada.ca:scratch/2023_JCP/sgs_model_GL_flux_nodes/