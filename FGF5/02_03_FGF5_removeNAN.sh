#!/bin/bash 
#SBATCH --job-name=combine 
#SBATCH --account=commons 
#SBATCH --partition=commons 
#SBATCH --ntasks=1 
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=00:30:00 
#SBATCH --output=/home/ak308/Bio310/output/removeNAN_FGF5.out 
#SBATCH --error=/home/ak308/Bio310/output/removeNAN_FGF5.err

FILE=/scratch/ak308/Bio310_Dog/Results/FGF5_filtered_fst_results.weir.fst
DIR=/scratch/ak308/Bio310_Dog/Results/

sed '/NaN/d' ${FILE} > ${DIR}/FGF5_filtered_fst_results_noNAN.weir.fst
