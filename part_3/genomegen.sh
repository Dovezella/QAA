#!/bin/bash
#SBATCH --account=bgmp  ### change this to your actual account for charging
#SBATCH --partition=compute       ### queue to submit to
#SBATCH --job-name=genomeGenerate    ### job name
#SBATCH --output=gGen_%j.out   ### file in which to store job stdout
#SBATCH --error=gGen_%j.err    ### file in which to store job stderr
#SBATCH --time=4:00:00                ### wall-clock time limit, in minutes
#SBATCH --mem=32G          ### memory limit per node, in MB
#SBATCH --nodes=1               ### number of nodes to use
#SBATCH --cpus-per-task=8       ### number of cores for each task

mamba activate QAA

outdir=$1 #directory location for output, needs to be same for this and the alignment script
fasta=$2 #fasta file to align to; make sure to unzip
gtf=$3 #gtf file for aligning; make sure to unzip

/usr/bin/time -v STAR --runMode genomeGenerate \
--runThreadN 8 \
--genomeDir $outdir \
--genomeFastaFiles $fasta \
--sjdbGTFfile $gtf

