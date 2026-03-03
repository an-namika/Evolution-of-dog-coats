#!/bin/bash 
#SBATCH --job-name=combine 
#SBATCH --account=commons 
#SBATCH --partition=commons 
#SBATCH --ntasks=1 
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=12:30:00 
#SBATCH --output=/home/ak308/Bio310/output/ak308_fstscan_FOXI3_mutset.out 
#SBATCH --error=/home/ak308/Bio310/output/ak308_fstscan_FOXI3_mutset.err

module load GCC/13.3.0
module load VCFtools/0.1.17

VCF=/scratch/ak308/Bio310_Dog/Results/FOXI3_filtered.recode.vcf

# NEW mutation-restricted population files (adjust names if you choose different ones)
dogpop_hairless=/scratch/ak308/Bio310_Dog/Files/FOXI3_hairlessdogs_mutset.txt
dogpop_nonhairless=/scratch/ak308/Bio310_Dog/Files/FOXI3_nonhairlessdogs_mutset.txt

# Rename output prefix so it doesn't overwrite previous analysis
OUT=/scratch/ak308/Bio310_Dog/Results/FOXI3_filtered_fst_results_mutset

vcftools --vcf ${VCF} \
--weir-fst-pop ${dogpop_hairless} \
--weir-fst-pop ${dogpop_nonhairless} \
--out ${OUT}

## Make the dog population files (only if you still need to create them)
# touch /scratch/ak308/Bio310_Dog/Files/FOXI3_hairlessdogs_mutset.txt
# touch /scratch/ak308/Bio310_Dog/Files/FOXI3_nonhairlessdogs_mutset.txt
