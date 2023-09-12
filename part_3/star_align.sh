#!/bin/bash
#SBATCH --account=bgmp  ### change this to your actual account for charging
#SBATCH --partition=compute       ### queue to submit to
#SBATCH --job-name=star    ### job name
#SBATCH --output=star_%j.out   ### file in which to store job stdout
#SBATCH --error=star_%j.err    ### file in which to store job stderr
#SBATCH --time=4:00:00                ### wall-clock time limit, in minutes
#SBATCH --mem=32G          ### memory limit per node, in MB
#SBATCH --nodes=1               ### number of nodes to use
#SBATCH --cpus-per-task=8       ### number of cores for each task

mamba activate QAA

filenamed1=$1 #R1 trimmed file
filename2=$2  #R2 trimmed file
outdir=$3 #directory location for output, needs to be same for this and the alignment script

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn $filenamed1 $filename2 \
--genomeDir $outdir \
--outFileNamePrefix aligned