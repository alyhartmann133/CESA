#!/bin/bash
#loop for filtering CESA genes based on chromosome location, position number and pairing score

module load SAMtools/1.9-foss-2018b
rm CESA.tsv

for f in $(find . -name *_CESA.bam); do
d=$(dirname $f) 
samtools view $f | cut -f 1,3,4,5 | awk -F '\t' -v d="$d" '{ $5 = d; print }' >>CESA.tsv
done


