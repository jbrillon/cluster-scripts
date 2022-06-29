let prevRun=1 # first delimiter
OLDRUNS=('2.order2' '6.order3' '3.order8' '3.order5') # copy from these, respectively
NEWRUNS=('order2' 'order3' 'order4' 'order5') # new postfixes

# Inputs:
prefix="plasma"

# Initialize
let newRun=prevRun+1
let i=1
let j=0

for newrun in "${NEWRUNS[@]}"; do
	oldrun="${OLDRUNS[$j]}"
	olddir="$prefix.$prevRun.$oldrun"
	newdir="$prefix.$newRun.$i.$newrun"
	mkdir "$newdir"
	cp "$olddir/* $newdir"
	let i++
	let j++
done