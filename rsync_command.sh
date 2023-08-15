# Ref: https://linuxize.com/post/how-to-use-rsync-for-local-and-remote-data-transfer-and-synchronization/
# Example
# rsync -a --progress outputs/jcp/ brillon@narval.computecanada.ca:scratch/2023_JCP/
# rsync -a --progress outputs/jcp/flux_nodes brillon@narval.computecanada.ca:scratch/2023_JCP/
# rsync -a --progress outputs/jcp/over_integration brillon@narval.computecanada.ca:scratch/2023_JCP/
# rsync -a --progress outputs/jcp/sgs_model_GL_flux_nodes brillon@narval.computecanada.ca:scratch/2023_JCP/
# rsync -a --progress outputs/jcp/sgs_model_GLL_flux_nodes brillon@narval.computecanada.ca:scratch/2023_JCP/
# rsync -a --progress outputs/jcp/upwind_dissipation_GL_flux_nodes brillon@narval.computecanada.ca:scratch/2023_JCP/
# rsync -a --progress outputs/jcp/upwind_dissipation_GLL_flux_nodes brillon@narval.computecanada.ca:scratch/2023_JCP/
# rsync -a --progress outputs/jcp/verification/viscous_TGV_ILES_std_strong_DG_Roe_GL_OI-4_dofs0256_p3_CFL-0.15_procs2048 brillon@narval.computecanada.ca:scratch/2023_JCP/verification/
# rsync -a --progress outputs/jcp/filter_width_stabilization brillon@narval.computecanada.ca:scratch/2023_JCP/
# rsync -a --progress outputs/jcp/cpu_time_advantage_2 brillon@narval.computecanada.ca:scratch/2023_JCP/
rsync -a --progress outputs/jcp/DHIT brillon@narval.computecanada.ca:scratch/2023_JCP/
# rsync -a --progress brillon@narval.computecanada.ca:scratch/2023_JCP/cpu_time_advantage_2/* outputs/jcp/cpu_time_advantage_2/
# rsync -a --progress brillon@narval.computecanada.ca:scratch/2023_JCP/cpu_time_advantage/with_overint_comp_cost/*  outputs/jcp/cpu_time_advantage/with_overint_comp_cost/
# rsync -a --progress outputs/jcp/high_poly_degree_GL_flux_nodes/* brillon@narval.computecanada.ca:scratch/2023_JCP/high_poly_degree_GL_flux_nodes/