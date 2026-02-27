#!/bin/bash 
#SBATCH --job-name=combine 
#SBATCH --account=commons 
#SBATCH --partition=commons 
#SBATCH --ntasks=1 
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=00:30:00 
#SBATCH --output=/home/ak308/Bio310/output/ak308_fstscan_window_KRT71.out 
#SBATCH --error=/home/ak308/Bio310/output/ak308_fstscan_window_KRT71.err

module load GCC/13.3.0
module load VCFtools/0.1.17

VCF=/scratch/ak308/Bio310_Dog/Results/KRT71_filtered.recode.vcf
dogpop_curly=/scratch/ak308/Bio310_Dog/Files/KRT71_curlydogs.txt
dogpop_noncurly=/scratch/ak308/Bio310_Dog/Files/KRT71_noncurlydogs.txt
OUT=/scratch/ak308/Bio310_Dog/Results

vcftools --vcf ${VCF} \
--fst-window-size 2500 \
--fst-window-step 1000 \
--weir-fst-pop ${dogpop_curly} \
--weir-fst-pop ${dogpop_noncurly} \
--out ${OUT}/KRT71_filtered_fst_results_2.5kbwindow_1kbstep

## Make the dog population files 
# touch /scratch/ak308/Bio310_Dog/Files/KRT71_curlydogs.txt
# copy and paste the names of the dogs in the VCF file that have curly hair 
# touch /scratch/ak308/Bio310_Dog/Files/KRT71_noncurlydogs.txt
# copy and paste the names of the dogs in the VCf file that do not have curly hair 

# A window based Fst will calculate the average Fst within a 2,500bp segment of the genome. This can help reduce the noise of calculating Fst for every variant, it kind of smooths out the variation, which sometimes can be helpful to see different small genomic regions that are differienitated.
