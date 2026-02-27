#!/bin/bash 
#SBATCH --job-name=combine 
#SBATCH --account=commons 
#SBATCH --partition=commons 
#SBATCH --ntasks=1 
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=00:30:00 
#SBATCH --output=/home/ak308/Bio310/output/ak308_fstscan_window_FGF5.out 
#SBATCH --error=/home/ak308/Bio310/output/ak308_fstscan_window_FGF5.err

module load GCC/13.3.0
module load VCFtools/0.1.17

VCF=/scratch/ak308/Bio310_Dog/Results/FGF5_filtered.recode.vcf
dogpop_curly=/scratch/ak308/Bio310_Dog/Files/FGF5_longdogs.txt
dogpop_noncurly=/scratch/ak308/Bio310_Dog/Files/FGF5_nonlongdogs.txt
OUT=/scratch/ak308/Bio310_Dog/Results

vcftools --vcf ${VCF} \
--fst-window-size 2500 \
--fst-window-step 1000 \
--weir-fst-pop ${dogpop_curly} \
--weir-fst-pop ${dogpop_noncurly} \
--out ${OUT}/FGF5_filtered_fst_results_2.5kbwindow_1kbstep

## Make the dog population files 
# touch /scratch/ak308/Bio310_Dog/Files/FGF5_longdogs.txt
# copy and paste the names of the dogs in the VCF file that have long hair 
# touch /scratch/ak308/Bio310_Dog/Files/FGF5_nonlongdogs.txt
# copy and paste the names of the dogs in the VCf file that do not have long hair 
