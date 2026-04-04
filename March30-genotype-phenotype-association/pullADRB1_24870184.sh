#!/bin/bash 
#SBATCH --job-name=combine 
#SBATCH --account=commons 
#SBATCH --partition=commons 
#SBATCH --ntasks=1 
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=12:30:00 
#SBATCH --output=/home/ak308/Bio310/output/vcf2select.out
#SBATCH --error=/home/ak308/Bio310/output/vcf2select.err

# Grab the specific gene from the large VCF

module load GCC/13.3.0
module load VCFtools/0.1.17

VCF=/scratch/lh106/SharedData/1697canidVCF/g_WildSled.SNP.INDEL.chrAll.newID.vcf.gz
OUT=/scratch/ak308/Bio310_Dog/Results/ADRB1_24870184_vcf

vcftools --gzvcf ${VCF} --chr chr28 --from-bp 24870184 --to-bp 24870184 --recode --recode-INFO-all --out ${OUT}

----------

scp -r lh106@nots.rice.edu:/scratch/lh106/Dog_Selection/Fstscan_March52026/longhair_vcf_ancientcanids.recode.vcf ~/Desktop

/scratch/lh106/Dog_Selection/Fstscan_March52026/longhair_vcf_ancientcanids.recode.vcf
