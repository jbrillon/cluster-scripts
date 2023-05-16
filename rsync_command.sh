# Ref: https://linuxize.com/post/how-to-use-rsync-for-local-and-remote-data-transfer-and-synchronization/
# Example
# rsync -a --progress outputs/jcp/ brillon@narval.computecanada.ca:scratch/2023_JCP/
# rsync -a --progress outputs/jcp/flux_nodes brillon@narval.computecanada.ca:scratch/2023_JCP/
# rsync -a --progress outputs/jcp/over_integration brillon@narval.computecanada.ca:scratch/2023_JCP/
# rsync -a --progress outputs/jcp/sgs_model_GL_flux_nodes brillon@narval.computecanada.ca:scratch/2023_JCP/
# rsync -a --progress outputs/jcp/sgs_model_GLL_flux_nodes brillon@narval.computecanada.ca:scratch/2023_JCP/
# rsync -a --progress outputs/jcp/upwind_dissipation_GL_flux_nodes brillon@narval.computecanada.ca:scratch/2023_JCP/
# rsync -a --progress outputs/jcp/upwind_dissipation_GLL_flux_nodes brillon@narval.computecanada.ca:scratch/2023_JCP/
# rsync -a --progress outputs/jcp/verification brillon@narval.computecanada.ca:scratch/2023_JCP/
# rsync -a --progress outputs/jcp/filter_width_stabilization brillon@narval.computecanada.ca:scratch/2023_JCP/
# rsync -a --progress outputs/jcp/cpu_time_advantage brillon@narval.computecanada.ca:scratch/2023_JCP/
rsync -a --progress outputs/jcp/time_step_advantage/* brillon@narval.computecanada.ca:scratch/2023_JCP/time_step_advantage/
# rsync -a --progress brillon@narval.computecanada.ca:scratch/2023_JCP/cpu_time_advantage/* outputs/jcp/cpu_time_advantage/
# rsync -a --progress brillon@narval.computecanada.ca:scratch/2023_JCP/cpu_time_advantage/with_overint_comp_cost/*  outputs/jcp/cpu_time_advantage/with_overint_comp_cost/