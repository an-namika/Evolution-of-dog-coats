#!/bin/bash 
#SBATCH --job-name=combine 
#SBATCH --account=commons 
#SBATCH --partition=commons 
#SBATCH --ntasks=1 
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=00:30:00 
#SBATCH --output=/home/ak308/Bio310/output/filter_FOXI3.out 
#SBATCH --error=/home/ak308/Bio310/output/filter_FOXI3.err

module load GCC/13.3.0
module load VCFtools/0.1.17

VCF=/scratch/ak308/Bio310_Dog/Results/FOXI3_vcf.recode.vcf

vcftools --vcf ${VCF} \
--minQ 30 \
--minDP 3 \
--max-missing 0.8 \
--recode \
--recode-INFO-all \
--out /scratch/ak308/Bio310_Dog/Results/FOXI3_filtered
