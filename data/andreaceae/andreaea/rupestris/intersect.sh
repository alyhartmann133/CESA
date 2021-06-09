#!/bin/bash
#SBATCH --job-name="intersect"
#SBATCH --time=48:00:00  # walltime limit (HH:MM:SS)
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=36   # processor core(s) per node
#SBATCH --mail-user="alyssa_hartmann@uri.edu"
#SBATCH --mail-type=END,FAIL
   
module load SAMtools/1.10-GCC-8.3.0
module load BEDTools/2.27.1-foss-2018b

 
cd $SLURM_SUBMIT_DIR

for f in *.bam; do
outfile1=$(basename $f .bam) #SRR6318134.bam
outfile2=$(basename $f _b.bam) #SRR6318134_b.bam
samtools view -h $f | sed 's/gi|//' - | samtools view -S -b - > ${outfile1}_b.bam
bedtools intersect -abam ${outfile1}_b.bam -b /data/schwartzlab/aly/moss/reference/Physcomitrium_patens_CESA.gff > ${outfile2}_CESA.bam
done 

   
#To run: 
# sbatch "file name" 
# squeue to check 
 


