#!/bin/bash 
#SBATCH --job-name=combine 
#SBATCH --account=commons 
#SBATCH --partition=commons 
#SBATCH --ntasks=1 
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=00:30:00 
#SBATCH --output=/home/ak308/Bio310/output/filter_KRT71.out 
#SBATCH --error=/home/ak308/Bio310/output/filter_KRT71.err

module load GCC/13.3.0
module load VCFtools/0.1.17

VCF=/scratch/ak308/Bio310/Results/KRT71_vcf.recode.vcf

vcftools --vcf ${VCF} \
--minQ 30 \
--minDP 3 \
--max-missing 0.8 \
--recode \
--recode-INFO-all \
--out /scratch/ak308/Dog_Selection/Results/KRT71_filtered

# This scripts filters the VCF file to include the following criteria that are listed here: https://vcftools.sourceforge.net/man_latest.html
#- minQ 30 -> keep SNPs that have at least a minimum quality filter of 30
# minD 3 -> keep site that have at least three "reads" or depth of 3 (so we are more confident about the call)
# max-missing 0.8 -> keep sites where we have a variant called in at least 80% of individuals, or keep sites that have at least 20% or less missing data
# recode -> recode the VCF according to these criteria
