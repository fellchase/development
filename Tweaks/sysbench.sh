#!/bin/bash
sensors | grep Core | cat
echo "-------------------------------------------------------"
for i in {1..5}
do
	sysbench --test=cpu --cpu-max-prime=20000 --num-threads=32 run >> sysbench.log
	sensors | grep Core | cat
	echo "-------------------------------------------------------"
done
echo "Done. Check the log file for more details."
