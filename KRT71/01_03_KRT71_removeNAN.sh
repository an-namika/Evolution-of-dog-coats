#!/bin/bash 
#SBATCH --job-name=combine 
#SBATCH --account=commons 
#SBATCH --partition=commons 
#SBATCH --ntasks=1 
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=00:30:00 
#SBATCH --output=/home/ak308/Bio310/output/removeNAN.out 
#SBATCH --error=/home/ak308/Bio310/output/removeNAN.err

FILE=/scratch/ak308/Dog_Selection/Results/KRT71_filtered_fst_results.weir.fst
DIR=/scratch/ak308/Dog_Selection/Results/

sed '/n/d' ${FILE} >  ${DIR}/KRT71_filtered_fst_results_noNAN.weir.fst.txt


sed '/n/d' KRT71_filtered_fst_results.weir.fst > KRT71_filtered_fst_results_noNAN.weir.fst
