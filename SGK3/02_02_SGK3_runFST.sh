#!/bin/bash 
#SBATCH --job-name=combine 
#SBATCH --account=commons 
#SBATCH --partition=commons 
#SBATCH --ntasks=1 
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=12:30:00 
#SBATCH --output=/home/ak308/Bio310/output/ak308_fstscan_SGK3.out 
#SBATCH --error=/home/ak308/Bio310/output/ak308_fstscan_SGK3.err

module load GCC/13.3.0
module load VCFtools/0.1.17

VCF=/scratch/ak308/Bio310_Dog/Results/SGK3_filtered.recode.vcf
dogpop_curly=/scratch/ak308/Bio310_Dog/Files/FOXI3_hairlessdogs.txt
dogpop_noncurly=/scratch/ak308/Bio310_Dog/Files/FOXI3_nonhairlessdogs.txt

vcftools --vcf ${VCF} \
--weir-fst-pop ${dogpop_curly} \
--weir-fst-pop ${dogpop_noncurly} \
--out /scratch/ak308/Bio310_Dog/Results/SGK3_filtered_fst_results
