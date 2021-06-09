#!/bin/bash
#SBATCH --job-name="alignment"
#SBATCH --time=48:00:00  # walltime limit (HH:MM:SS)
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=36   # processor core(s) per node
#SBATCH --mail-user="alyssa_hartmann@uri.edu"
#SBATCH --mail-type=END,FAIL


module load Bowtie2/2.3.5.1-GCC-8.3.0
module load SAMtools/1.10-GCC-8.3.0


cd $SLURM_SUBMIT_DIR

for f in *_Trim_1.fastq.gz; do
outfile=$(basename $f _Trim_1.fastq.gz) #SRR13008849_Trim_1.fastq.gz
bowtie2 -p 36 -N 1 --local -x /data/schwartzlab/aly/moss/reference/physcomitrium_patens -1 $f -2 ${outfile}_Trim_2.fastq.gz | samtools view -Su -@ 36 -F 4 - | samtools sort -@ 36 - -o ${outfile}.bam
done
