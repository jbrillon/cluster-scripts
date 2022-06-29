# for((i = 1; i<=3; i++)); do
# 	mkdir test_${i}
# done
# if ! [ -d "test_4" ]; then
# 	# echo "Hello";
# 	mkdir test_4;
# fi
# RUN_ON_TMPDIR=false
# if [ ${RUN_ON_TMPDIR} = true ]; then
# 	echo "\n its true\n";
# fi
CLUSTER_NAME="beluga"
if [ ${CLUSTER_NAME} == "beluga" ]; then
	echo "\n its true\n";
fi