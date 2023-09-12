#!/usr/bin/env python

import matplotlib.pyplot as plt
import argparse 
import gzip

def get_args():
    parser = argparse.ArgumentParser(description="A program to plot the distribution of read lengths of fastq data for a read pair")
    parser.add_argument("-r1", "--ReadOneFile", help="R1filename", required=True, type=str)
    parser.add_argument("-r2", "--ReadTwoFile", help="R2filename", required=True, type=str)
    parser.add_argument("-o", "--outplotfile", help="Plotname", required=True, type=str)
    return parser.parse_args()

args=get_args()
R1=args.ReadOneFile
R2=args.ReadTwoFile
out=args.outplotfile

R1lengths={}
R2lengths={}
i=0
with gzip.open(R1,"rt") as f1:
    for line in f1:
        line=line.strip()
        i+=1
        l=len(line)
        if i%4==2: 
            if l not in R1lengths:
                R1lengths[l]=1
            else:
                R1lengths[l]+=1

with gzip.open(R2,"rt") as f2:
    for line in f2:
        line=line.strip()
        i+=1
        l=len(line)
        if i%4==2: 
            if l not in R2lengths:
                R2lengths[l]=1
            else:
                R2lengths[l]+=1


plt.bar(R1lengths.keys(),R1lengths.values(),alpha=0.5, label="R1", color="red")
plt.bar(R2lengths.keys(), R2lengths.values(),alpha=0.5, label="R2", color="blue" )
plt.ylabel("Frequency")
plt.xlabel("Lengths of Reads")
plt.yscale("log")
plt.legend(loc="upper left")
plt.title(f'{out} Distribution of Read Lengths')
plt.savefig(f'{out}.png')



