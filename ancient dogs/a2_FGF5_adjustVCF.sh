#!/bin/bash
#SBATCH --job-name=combine
#SBATCH --account=commons
#SBATCH --partition=commons
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=1000m
#SBATCH --time=00:30:00
#SBATCH --output=/home/ak308/Bio310/output/FGF5_plink.out
#SBATCH --error=/home/ak308/Bio310/output/FGF5_plink.err

VCF=/scratch/ak308/Bio310_Dog/Results/FGF5_vcf_ancientcanids.recode.vcf
OUTBED=/scratch/ak308/Bio310_Dog/Results/FGF5_vcf_ancientcanids_bed
OUTPLINK=/scratch/ak308/Bio310_Dog/Results/FGF5_vcf_ancientcanids_plink
OUTVCF_FINAL=/scratch/ak308/Bio310_Dog/Results/FGF5_vcf_ancientcanids_finalcoded

/home/ak308/Software/plink --vcf ${VCF} --make-bed --const-fid --dog --out ${OUTBED}
/home/ak308/Software/plink --bfile ${OUTBED} --recode --out ${OUTPLINK} --const-fid --dog
/home/ak308/Software/plink --file ${OUTPLINK} --recode vcf --out ${OUTVCF_FINAL} --const-fid --dog

cd /scratch/ak308/Bio310_Dog/Results/

sed -i 's:0/0:0:g' FGF5_vcf_ancientcanids_finalcoded.vcf
sed -i 's:0/1:1:g' FGF5_vcf_ancientcanids_finalcoded.vcf
sed -i 's:1/0:1:g' FGF5_vcf_ancientcanids_finalcoded.vcf
sed -i 's:1/1:2:g' FGF5_vcf_ancientcanids_finalcoded.vcf
sed -i 's:\./\.:3:g' FGF5_vcf_ancientcanids_finalcoded.vcf

scp ak308@nots.rice.edu:/scratch/ak308/Bio310_Dog/Results/FGF5_vcf_ancientcanids_finalcoded.vcf ~/Desktop
