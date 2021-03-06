#!/bin/sh
# SGE Options
#$ -S /bin/bash
# Shell environment forwarding
#$ -V
# Job Name
#$ -N benchmark_CMEMS_norm_age

# Notifications
#$ -M <fill-in-mail-address>

# When notified
#$ -m es
# Set memory limit
#$ -l h_vmem=60G
# Set runtime limit
#$ -l h_rt=96:00:00

# run the job on the queue for long-running processes (parameterization depends on your cluster!):
#$ -q <queue-name>

echo 'Initialize environment'

export SCRIPT_LOCATION = #<location-of-these-runscripts>#
cd ${SCRIPT_LOCATION}
export PARCELS_HEAD= #<location your your parcels checkout from github; main folder>#
export TARGET_HEAD= #<location where your benchmark results shall be stored>#

echo '======== JIT (Just-in-Time) experiments ========'
echo ' ---- dynamically removing particles (aging with t_max=14 days) ---- '
python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_CMEMS_GEMINI_noMPI_ageP_2pow10_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_CMEMS.py -a -t 365 -G -N 2**10 -i CMEMS_GEMINI_noMPI_ageP-2pow10_wGC_jit.png
python3.6 ${PARCELS_HEAD}/performance/benchmark_CMEMS.py -a -t 365 -G -N 2**10 -i CMEMS_GEMINI_noMPI_ageP-2pow10_wGC_jit.png
python3.6 ${PARCELS_HEAD}/performance/benchmark_CMEMS.py -a -t 365 -G -N 2**11 -i CMEMS_GEMINI_noMPI_ageP-2pow11_wGC_jit.png
python3.6 ${PARCELS_HEAD}/performance/benchmark_CMEMS.py -a -t 365 -G -N 2**12 -i CMEMS_GEMINI_noMPI_ageP-2pow12_wGC_jit.png
python3.6 ${PARCELS_HEAD}/performance/benchmark_CMEMS.py -a -t 365 -G -N 2**13 -i CMEMS_GEMINI_noMPI_ageP-2pow13_wGC_jit.png
python3.6 ${PARCELS_HEAD}/performance/benchmark_CMEMS.py -a -t 365 -G -N 2**14 -i CMEMS_GEMINI_noMPI_ageP-2pow14_wGC_jit.png
python3.6 ${PARCELS_HEAD}/performance/benchmark_CMEMS.py -a -t 365 -G -N 2**15 -i CMEMS_GEMINI_noMPI_ageP-2pow15_wGC_jit.png
python3.6 ${PARCELS_HEAD}/performance/benchmark_CMEMS.py -a -t 365 -G -N 2**16 -i CMEMS_GEMINI_noMPI_ageP-2pow16_wGC_jit.png
python3.6 ${PARCELS_HEAD}/performance/benchmark_CMEMS.py -a -t 365 -G -N 2**17 -i CMEMS_GEMINI_noMPI_ageP-2pow17_wGC_jit.png
python3.6 ${PARCELS_HEAD}/performance/benchmark_CMEMS.py -a -t 365 -G -N 2**18 -i CMEMS_GEMINI_noMPI_ageP-2pow18_wGC_jit.png
python3.6 ${PARCELS_HEAD}/performance/benchmark_CMEMS.py -a -t 365 -G -N 2**19 -i CMEMS_GEMINI_noMPI_ageP-2pow19_wGC_jit.png

echo 'Finished program execution.'
