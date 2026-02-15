#!/bin/bash 
#SBATCH --job-name=combine 
#SBATCH --account=commons 
#SBATCH --partition=commons 
#SBATCH --ntasks=1 
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=12:30:00 
#SBATCH --output=/home/ak308/Bio310/output/vcfselect.out 
#SBATCH --error=/home/ak308/Bio310/output/vcfselect.err

# Grab the specific gene from the large VCF

module load GCC/13.3.0
module load VCFtools/0.1.17

VCF=/scratch/lh106/SharedData/1697canidVCF/g_WildSled.SNP.INDEL.chrAll.newID.vcf.gz
BEDIN=/home/ak308/Bio310/Files/bedfiles/KANK2.bed
OUT=/scratch/ak308/Bio310_Dog/Results/KANK2_vcf

vcftools --gzvcf ${VCF} --bed  ${BEDIN} --recode --recode-INFO-all --out ${OUT}

#########################
#How to make a bed file #
#########################

cd /home/ak308/Bio310/Files/bedfiles
touch KANK2.bed
vim KANK2.bed

#press i to edit
# paste below, make sure there are tabs between! 
chrom   chromStart      chromEnd
chr20   50067760       50091320

# to exit
:wq

#Copy and paste the gene location with tabs between
