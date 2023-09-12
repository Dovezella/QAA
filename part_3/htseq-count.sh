#!/bin/bash
#SBATCH --account=bgmp  ### change this to your actual account for charging
#SBATCH --partition=compute       ### queue to submit to
#SBATCH --job-name=htseq-count    ### job name
#SBATCH --output=htseq_%j.out   ### file in which to store job stdout
#SBATCH --error=htseq_%j.err    ### file in which to store job stderr
#SBATCH --time=4:00:00                ### wall-clock time limit, in minutes
#SBATCH --mem=32G          ### memory limit per node, in MB
#SBATCH --nodes=1               ### number of nodes to use
#SBATCH --cpus-per-task=1       ### number of cores for each task
conda deactivate
conda deactivate
conda activate QAA 

file1=$1 #the first Aligned.out.sam file you want to use htseq-count on
file2=$2 #the second file you want to use
gtf=$3 #this is the associated gtf you want to use
O1=$4   #output name for file one
O2=$5   #output name for file two

/usr/bin/time -v htseq-count -c ${O1}.tsv --stranded=yes $file1 $gtf

/usr/bin/time -v htseq-count -c ${O1}_rev.tsv --stranded=reverse $file1 $gtf

/usr/bin/time -v htseq-count -c ${O2}.tsv --stranded=yes $file2 $gtf

/usr/bin/time -v htseq-count -c ${O2}_rev.tsv --stranded=reverse $file2 $gtf