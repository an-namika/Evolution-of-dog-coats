#!/bin/bash 
#SBATCH --job-name=combine 
#SBATCH --account=commons 
#SBATCH --partition=commons 
#SBATCH --ntasks=1 
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=00:30:00 
#SBATCH --output=/home/ak308/Bio310/output/removeNAN_window_KANK2.out 
#SBATCH --error=/home/ak308/Bio310/output/removeNAN_window_KANK2.err

FILE=/scratch/ak308/Bio310_Dog/Results/KANK2_filtered_fst_results_2.5kbwindow_1kbstep.windowed.weir.fst
DIR=/scratch/ak308/Bio310_Dog/Results/

sed '/NaN/d' ${FILE} > ${DIR}/KANK2_filtered_fst_results_2.5kbwindow_1kbstep_noNAN.windowed.weir.fst
