#!/bin/bash
#SBATCH --job-name="trim"
#SBATCH --time=48:00:00  # walltime limit (HH:MM:SS)
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=20   # processor core(s) per node
#SBATCH --mail-user="alyssa_hartmann@uri.edu"
#SBATCH --mail-type=END,FAIL
#
cd $SLURM_SUBMIT_DIR

module load Python/3.7.4-GCCcore-8.3.0
module load SciPy-bundle/2019.10-foss-2019b-Python-3.7.4
module load Bowtie2/2.3.5.1-GCC-8.3.0
module load FastQC/0.11.9-Java-11
module load BBMap/38.81-foss-2018b-Java-1.8
module load Biopython/1.75-foss-2019b-Python-3.7.4
module load Ray/2.3.1-iimpi-2019a
module load SAMtools/1.3.1-foss-2016b
module load BEDTools/2.27.1-foss-2018b

# Raw FastQC
fastqc -t 20 -o . *.fastq.gz

# Trim Scripts

for f in *_1.fastq.gz; do 

outfile=$(basename $f _1.fastq.gz)    #SRR5052463.fastq.gz
bbduk.sh maxns=0 ref=/opt/software/BBMap/38.81-foss-2018b-Java-1.8/resources/adapters.fa qtrim=w trimq=15 minlength=35 maq=25 in1=$f in2=${outfile}_2.fastq.gz  out1=${outfile}_Trim_1.fastq.gz out2=${outfile}_Trim_2.fastq.gz  k=23 mink=11 hdist=1 ktrim=r ow=t
done

# Trim FastQC
fastqc -t 20 -o . *Trim*fastq.gz


