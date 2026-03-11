#!/bin/bash 
#SBATCH --job-name=combine 
#SBATCH --account=commons 
#SBATCH --partition=commons 
#SBATCH --ntasks=1 
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=00:30:00 
#SBATCH --output=/home/ak308/Bio310/output/vcfselect.out 
#SBATCH --error=/home/ak308/Bio310/output/vcfselect.err

# Grab the specific gene from the large VCF

module load GCC/13.3.0
module load VCFtools/0.1.17

VCF=/scratch/lh106/SharedData//merged_phased_annotated.Autosomes_ancientdogdingo_FINAL_MAF_0.01_recalibrated_INFO_0.8.vcf.gz
OUT=/scratch/ak308/Bio310_Dog/Results/KRT71_vcf_ancientcanids

vcftools --gzvcf ${VCF} --chr chr27 --from-bp 2539211 --to-bp 2539211 --recode --recode-INFO-all --out ${OUT}
