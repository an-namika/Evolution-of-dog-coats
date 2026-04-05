#!/bin/bash 
#SBATCH --job-name=combine 
#SBATCH --account=commons 
#SBATCH --partition=commons 
#SBATCH --ntasks=1 
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=00:30:00 
#SBATCH --output=/home/ak308/Bio310/output/plink2.out 
#SBATCH --error=/home/ak308/Bio310/output/plink2.err

VCF=/scratch/ak308/Bio310_Dog/Results/ADRB1_24870184_vcf.recode.vcf
OUTBED=/scratch/ak308/Bio310_Dog/Results/ADRB1_24870184_vcf_bed
OUTPLINK=/scratch/ak308/Bio310_Dog/Results/ADRB1_24870184_vcf_plink
OUTVCF_final=/scratch/ak308/Bio310_Dog/Results/ADRB1_24870184_vcf_finalcoded

/home/ak308/Software/plink --vcf ${VCF} --make-bed --const-fid --dog --out ${OUTBED}
/home/ak308/Software/plink --bfile ${OUTBED} --recode --out ${OUTPLINK} --const-fid --dog
/home/ak308/Software/plink --file ${OUTPLINK} --recode vcf --out ${OUTVCF_final} --const-fid --dog

cd /scratch/ak308/Bio310_Dog/Results/
##### Convert vcf to coding ######
sed -i 's:0/0:0:g' ADRB1_24870184_vcf_finalcoded.vcf
sed -i 's:0/1:1:g' ADRB1_24870184_vcf_finalcoded.vcf
sed -i 's:1/0:1:g' ADRB1_24870184_vcf_finalcoded.vcf
sed -i 's:1/1:2:g' ADRB1_24870184_vcf_finalcoded.vcf
sed -i 's:./.:3:g' ADRB1_24870184_vcf_finalcoded.vcf


### Move to local computer 
scp -r ak308@nots.rice.edu:/scratch/ak308/Bio310_Dog/Results/ADRB1_24870184_vcf_finalcoded.vcf ~/Desktop
