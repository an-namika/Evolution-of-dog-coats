# Now your file containing the Fst results is here: /scratch/ak308/Bio310_Dog/Results//KRT71_filtered_fst_results_5kbwindow_2.5kbstep_noNAN.weir.fst.txt
# you can bring this to your local computer: 

### Move to local computer 
scp -r ak308@nots.rice.edu:/scratch/ak308/Bio310_Dog/Results/KRT71_filtered_fst_results_2.5kbwindow_1kbstep_noNAN.weir.fst.txt ~/Desktop

# Now you can open this file with text edit, then paste the results in Microsoft Excel 
# the headers will be: 
CHROM
BIN_START
BIN_END
N_VARIANTS
WEIGHTED_FST
MEAN_FST
Column meaning:
CHROM → chromosome

BIN_START → window start position
BIN_END → window end position
N_VARIANTS → number of SNPs in the window
WEIGHTED_FST → weighted FST (recommended for interpretation)
MEAN_FST → simple mean of per-site FST values

# we will use the WEIGHTED_FST
#Now you can use the sort function to sort for the variants that segregate between the curly hair dogs and non-curly hair. This would indicate that all the curly hair dogs have one variant, and all the non-curly hair dogs have the other.  
Are there any variants that have a high WEIGHTED_FST??? (>0.8?)

#Next you can save this dataset as a .csv and upload it to R studio 

library(ggplot2)
dat <-read.csv ("KRT71_filtered_fst_results_2.5kbwindow_1kbstep_noNAN.weir.fst.csv", header=TRUE)

ggplot(data = dat, aes(x = POS, y = WEIGHTED_FST)) +
  geom_point()

# Do we see a candidate region pop out?! Does that overlap with any of the single candidate variants we found in the previous analysis? 
