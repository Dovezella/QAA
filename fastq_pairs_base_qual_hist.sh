#!/bin/bash
#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=compute               #REQUIRED: which partition to use
#SBATCH --job-name=fq_pair_base_qual_hist   ### job name
#SBATCH --output=qhist_%j.out   ### file in which to store job stdout
#SBATCH --error=qhist_%j.err    ### file in which to store job stderr
#SBATCH --mem=16G          ### memory limit per node, in MB
#SBATCH --nodes=1               ### number of nodes to use
#SBATCH --cpus-per-task=4       ### number of cores for each task

conda activate bgmp_py311

f1=$1
f2=$2 
g1=$3         
g2=$4

/usr/bin/time -v ../baseq_hist.py -f $f1 -o R1 -bp 101 -g $g1


/usr/bin/time -v ../baseq_hist.py -f $f2 -o R2 -bp 101  -g $g2
