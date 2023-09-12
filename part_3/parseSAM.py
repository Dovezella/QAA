#!/usr/bin/env python

import argparse
def get_args():
    parser = argparse.ArgumentParser(description="A program for PS6")
    parser.add_argument("-f", "--filename", help="filename", required=True, type=str)
    return parser.parse_args()

args=get_args()
filename=args.filename

with open(filename,"r") as fh:
    i=0
    mapped=0
    unmapped=0
    for line in fh:
        if line.startswith("@"):
            pass
        else:
            flag=int(line.split('\t')[1])
            if (flag & 256) == 256:
                pass
            elif((flag & 4) != 4): 
                mapped +=1
            else:
                unmapped+=1

print("mapped reads:", mapped, "unmapped reads:", unmapped)