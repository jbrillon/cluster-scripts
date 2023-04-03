# Ref: https://linuxize.com/post/how-to-use-rsync-for-local-and-remote-data-transfer-and-synchronization/
# Example
rsync -a --progress aiaa/2022-11-29_TGV_SPECTRA_24dofs brillon@narval.computecanada.ca:scratch/2023_AIAA/
rsync -a --progress aiaa/2022-11-29_TGV_SPECTRA_48dofs brillon@narval.computecanada.ca:scratch/2023_AIAA/
rsync -a --progress aiaa/2022-11-29_TGV_SPECTRA_96dofs_cDG_cPlus brillon@narval.computecanada.ca:scratch/2023_AIAA/
rsync -a --progress aiaa/2022-11-29_TGV_SPECTRA_96dofs_cSD_cHU brillon@narval.computecanada.ca:scratch/2023_AIAA/