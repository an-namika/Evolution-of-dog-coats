#!/bin/bash 
#SBATCH --job-name=combine 
#SBATCH --account=commons 
#SBATCH --partition=commons 
#SBATCH --ntasks=1 
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=12:30:00 
#SBATCH --output=/home/ak308/Bio310/output/ak308_fstscan_SGK3_mutset.out 
#SBATCH --error=/home/ak308/Bio310/output/ak308_fstscan_SGK3_mutset.err

module load GCC/13.3.0
module load VCFtools/0.1.17

VCF=/scratch/ak308/Bio310_Dog/Results/SGK3_filtered.recode.vcf

# NEW mutation-restricted population files (example names — adjust to what you actually create)
dogpop_curly=/scratch/ak308/Bio310_Dog/Files/SGK3_hairlessdogs_mutset.txt
dogpop_noncurly=/scratch/ak308/Bio310_Dog/Files/SGK3_nonhairlessdogs_mutset.txt

# Rename output prefix so it doesn't overwrite previous analysis
OUT=/scratch/ak308/Bio310_Dog/Results/SGK3_filtered_fst_results_mutset

vcftools --vcf ${VCF} \
--weir-fst-pop ${dogpop_curly} \
--weir-fst-pop ${dogpop_noncurly} \
--out ${OUT}

## Make the dog population files (only if you still need to create them)
# touch /scratch/ak308/Bio310_Dog/Files/SGK3_hairlessdogs_mutset.txt
# touch /scratch/ak308/Bio310_Dog/Files/SGK3_nonhairlessdogs_mutset.txt
