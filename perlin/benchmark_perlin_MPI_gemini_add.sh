#!/bin/sh
# SGE Options
#$ -S /bin/bash
# Shell environment forwarding
#$ -V
# Job Name
#$ -N benchmark_perlin_MPI_add

# Notifications
#$ -M <fill-in-mail-address>

# When notified
#$ -m es
# Set memory limit
#$ -l h_vmem=120G
# Set runtime limit
#$ -l h_rt=96:00:00

# run the job on the queue for long-running processes (parameterization depends on your cluster!):
#$ -q <queue-name>

echo 'Initialize environment'

export SCRIPT_LOCATION = #<location-of-these-runscripts>#
cd ${SCRIPT_LOCATION}
export PARCELS_HEAD= #<location your your parcels checkout from github; main folder>#
export TARGET_HEAD= #<location where your benchmark results shall be stored>#

echo '======== JIT (Just-in-Time) experiments - MPI ========'
echo ' ---- dynamically adding particles (adaptive release rate) ---- '
mpiexec -np 2 python3.6 -m cProfile -o ${TARGET_HEAD}/benchmark_perlin_GEMINI_MPI_addP_2pow10_wGC_jit.prof ${PARCELS_HEAD}/performance/benchmark_perlin.py -t 365 -G -r -sN 128 -N 2**10 -i perlin_GEMINI_MPI_addP-2pow10_wGC_jit.png
mpiexec -np 2 python3.6 ${PARCELS_HEAD}/performance/benchmark_perlin.py -t 365 -G -r -sN 128 -N 2**10 -i perlin_GEMINI_MPI_addP-2pow10_wGC_jit.png
mpiexec -np 2 python3.6 ${PARCELS_HEAD}/performance/benchmark_perlin.py -t 365 -G -r -sN 128 -N 2**11 -i perlin_GEMINI_MPI_addP-2pow11_wGC_jit.png
mpiexec -np 2 python3.6 ${PARCELS_HEAD}/performance/benchmark_perlin.py -t 365 -G -r -sN 128 -N 2**12 -i perlin_GEMINI_MPI_addP-2pow12_wGC_jit.png
mpiexec -np 2 python3.6 ${PARCELS_HEAD}/performance/benchmark_perlin.py -t 365 -G -r -sN 128 -N 2**13 -i perlin_GEMINI_MPI_addP-2pow13_wGC_jit.png
mpiexec -np 2 python3.6 ${PARCELS_HEAD}/performance/benchmark_perlin.py -t 365 -G -r -sN 128 -N 2**14 -i perlin_GEMINI_MPI_addP-2pow14_wGC_jit.png
mpiexec -np 2 python3.6 ${PARCELS_HEAD}/performance/benchmark_perlin.py -t 365 -G -r -sN 128 -N 2**15 -i perlin_GEMINI_MPI_addP-2pow15_wGC_jit.png
mpiexec -np 2 python3.6 ${PARCELS_HEAD}/performance/benchmark_perlin.py -t 365 -G -r -sN 128 -N 2**16 -i perlin_GEMINI_MPI_addP-2pow16_wGC_jit.png
mpiexec -np 2 python3.6 ${PARCELS_HEAD}/performance/benchmark_perlin.py -t 365 -G -r -sN 128 -N 2**17 -i perlin_GEMINI_MPI_addP-2pow17_wGC_jit.png
mpiexec -np 2 python3.6 ${PARCELS_HEAD}/performance/benchmark_perlin.py -t 365 -G -r -sN 128 -N 2**18 -i perlin_GEMINI_MPI_addP-2pow18_wGC_jit.png
mpiexec -np 2 python3.6 ${PARCELS_HEAD}/performance/benchmark_perlin.py -t 365 -G -r -sN 128 -N 2**19 -i perlin_GEMINI_MPI_addP-2pow19_wGC_jit.png

echo 'Finished program execution.'
