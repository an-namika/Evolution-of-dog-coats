#!/bin/bash
#SBATCH --job-name=combine
#SBATCH --account=commons
#SBATCH --partition=commons
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=1000m
#SBATCH --time=00:30:00
#SBATCH --output=/home/ak308/Bio310/output/modernADRB1_24870184_plink.out
#SBATCH --error=/home/ak308/Bio310/output/modernADRB1_24870184_plink.err

VCF=/scratch/ak308/Bio310_Dog/Results/modernADRB1_24870184_vcf_ancientcanids.recode.vcf
OUTBED=/scratch/ak308/Bio310_Dog/Results/modernADRB1_24870184_vcf_ancientcanids_bed
OUTPLINK=/scratch/ak308/Bio310_Dog/Results/modernADRB1_24870184_vcf_ancientcanids_plink
OUTVCF_FINAL=/scratch/ak308/Bio310_Dog/Results/modernADRB1_24870184_vcf_ancientcanids_finalcoded

/home/ak308/Software/plink --vcf ${VCF} --make-bed --const-fid --dog --out ${OUTBED}
/home/ak308/Software/plink --bfile ${OUTBED} --recode --out ${OUTPLINK} --const-fid --dog
/home/ak308/Software/plink --file ${OUTPLINK} --recode vcf --out ${OUTVCF_FINAL} --const-fid --dog

cd /scratch/ak308/Bio310_Dog/Results/

sed -i 's:0/0:0:g' modernADRB1_24870184_vcf_ancientcanids_finalcoded.vcf
sed -i 's:0/1:1:g' modernADRB1_24870184_vcf_ancientcanids_finalcoded.vcf
sed -i 's:1/0:1:g' modernADRB1_24870184_vcf_ancientcanids_finalcoded.vcf
sed -i 's:1/1:2:g' modernADRB1_24870184_vcf_ancientcanids_finalcoded.vcf
sed -i 's:\./\.:3:g' modernADRB1_24870184_vcf_ancientcanids_finalcoded.vcf

/scratch/ak308/Bio310_Dog/Results/modernADRB1_24870184_vcf_ancientcanids_finalcoded.vcf
