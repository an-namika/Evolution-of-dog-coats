#!/bin/bash 
#SBATCH --job-name=combine 
#SBATCH --account=commons 
#SBATCH --partition=commons 
#SBATCH --ntasks=1 
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=12:30:00 
#SBATCH --output=/home/ak308/Bio310/output/vcf1select.out
#SBATCH --error=/home/ak308/Bio310/output/vcf1select.err

# Grab the specific gene from the large VCF

module load GCC/13.3.0
module load VCFtools/0.1.17

VCF=/scratch/lh106/SharedData/1697canidVCF/g_WildSled.SNP.INDEL.chrAll.newID.vcf.gz
OUT=/scratch/ak308/Bio310_Dog/Results/ADRB1_24860187_vcf

vcftools --gzvcf ${VCF} --chr chr28 --from-bp 24860187 --to-bp 24860187 --recode --recode-INFO-all --out ${OUT}
