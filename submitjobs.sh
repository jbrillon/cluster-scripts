# Inputs:
prefix="plasma"
runNum=2
let Njobs=5
subfile="scalo.sub"

for((i = 1; i<=$Njobs; i++)); do
	dir="./$prefix.$runNum.$i.*/"
	cd $dir
	qsub $subfile
	cd "../"
done