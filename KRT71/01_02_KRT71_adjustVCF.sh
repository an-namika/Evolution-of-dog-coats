#!/bin/bash 
#SBATCH --job-name=combine 
#SBATCH --account=commons 
#SBATCH --partition=commons 
#SBATCH --ntasks=1 
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=12:30:00 
#SBATCH --output=/home/ak308/Bio310/output/plink.out 
#SBATCH --error=/home/ak308/Bio310/output/plink.err

VCF=/scratch/ak308/Bio310_Dog/Results/KRT71_vcf.recode.vcf
OUTBED=/scratch/ak308/Bio310_Dog/Results/KRT71_bed
OUTPLINK=/scratch/ak308/Bio310_Dog/Results/KRT71_plink
OUTVCF_final=/scratch/ak308/Bio310_Dog/Results/KRT71_plink_finalcoded

/home/ak308/Software/plink --vcf ${VCF} --make-bed --const-fid --dog --out ${OUTBED}
/home/ak308/Software/plink --bfile ${OUTBED} --recode --out ${OUTPLINK} --const-fid --dog
/home/ak308/Software/plink --file  ${OUTPLINK} --recode vcf --out ${OUTVCF_final} --const-fid --dog
