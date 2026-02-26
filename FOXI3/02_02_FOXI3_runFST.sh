#!/bin/bash 
#SBATCH --job-name=combine 
#SBATCH --account=commons 
#SBATCH --partition=commons 
#SBATCH --ntasks=1 
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=12:30:00 
#SBATCH --output=/home/ak308/Bio310/output/ak308_fstscan_FOXI3.out 
#SBATCH --error=/home/ak308/Bio310/output/ak308_fstscan_FOXI3.err

module load GCC/13.3.0
module load VCFtools/0.1.17

VCF=/scratch/ak308/Bio310_Dog/Results/FOXI3_filtered.recode.vcf
dogpop_curly=/scratch/ak308/Bio310_Dog/Files/FOXI3_hairlessdogs.txt
dogpop_noncurly=/scratch/ak308/Bio310_Dog/Files/FOXI3_nonhairlessdogs.txt

vcftools --vcf ${VCF} \
--weir-fst-pop ${dogpop_curly} \
--weir-fst-pop ${dogpop_noncurly} \
--out /scratch/ak308/Bio310_Dog/Results/FOXI3_filtered_fst_results


## Make the dog population files 
touch /scratch/ak308/Bio310_Dog/Files/FOXI3_hairlessdogs.txt
# copy and paste the names of the dogs in the VCF file that have curly hair 
touch /scratch/ak308/Bio310_Dog/Files/FOXI3_nonhairlessdogs.txt
# copy and paste the names of the dogs in the VCF file that do not have curly hair 

# for these population files, you would copy and paste the dog individuals that have a specific phenotype, such as 
# IMPORTANT: by using the "Sample_Name" column
