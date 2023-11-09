# Ref: https://linuxize.com/post/how-to-use-rsync-for-local-and-remote-data-transfer-and-synchronization/
# Example
# rsync -a --progress outputs/jcp/ brillon@narval.computecanada.ca:scratch/2023_JCP/
rsync -a --progress outputs/jcp/turbulent_channel_flow brillon@narval.computecanada.ca:scratch/2024_AIAA/
#rsync -a --progress outputs/jcp/sgs_model_GL_flux_nodes/* brillon@narval.computecanada.ca:scratch/2023_JCP/sgs_model_GL_flux_nodes/