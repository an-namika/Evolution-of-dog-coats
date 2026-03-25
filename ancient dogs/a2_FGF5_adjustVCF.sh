#!/bin/bash
#SBATCH --job-name=combine
#SBATCH --account=commons
#SBATCH --partition=commons
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=1000m
#SBATCH --time=00:30:00
#SBATCH --output=/home/ak308/Bio310/output/plink.out
#SBATCH --error=/home/ak308/Bio310/output/plink.err

# Input VCF = output from your previous vcftools script
VCF=/scratch/ak308/Bio310_Dog/Results/modernFGF5_vcf_ancientcanids.recode.vcf

OUTBED=/scratch/ak308/Bio310_Dog/Results/modernFGF5_vcf_ancientcanids_bed
OUTPLINK=/scratch/ak308/Bio310_Dog/Results/modernFGF5_vcf_ancientcanids_plink
OUTVCF_FINAL=/scratch/ak308/Bio310_Dog/Results/modernFGF5_vcf_ancientcanids_finalcoded

# Convert VCF -> PLINK bed format
/home/ak308/Software/plink --vcf ${VCF} --make-bed --const-fid --dog --out ${OUTBED}

# Convert PLINK bed -> ped/map text
/home/ak308/Software/plink --bfile ${OUTBED} --recode --out ${OUTPLINK} --const-fid --dog

# Convert ped/map -> VCF again
/home/ak308/Software/plink --file ${OUTPLINK} --recode vcf --out ${OUTVCF_FINAL} --const-fid --dog

cd /scratch/ak308/Bio310_Dog/Results/

# Recode genotypes
sed -i 's:0/0:0:g' modernFGF5_vcf_ancientcanids_finalcoded.vcf
sed -i 's:0/1:1:g' modernFGF5_vcf_ancientcanids_finalcoded.vcf
sed -i 's:1/0:1:g' modernFGF5_vcf_ancientcanids_finalcoded.vcf
sed -i 's:1/1:2:g' modernFGF5_vcf_ancientcanids_finalcoded.vcf
sed -i 's:\./\.:3:g' modernFGF5_vcf_ancientcanids_finalcoded.vcf
