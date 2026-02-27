# Now your file containing the Fst results is here: /scratch/ak308/Bio310_Dog/Results/KRT25_filtered_fst_results_noNAN.weir.fst
# you can bring this to your local computer: 

### Move to local computer 
scp -r ak308@nots.rice.edu:/scratch/ak308/Bio310_Dog/Results/KRT25_filtered_fst_results_noNAN.weir.fst ~/Desktop

# Now you can open this file with text edit, then paste the results in Microsoft Excel 
# the headers will be: 
CHROM   POS   WEIR_AND_COCKERHAM_FST

#Now you can use the sort function to sort for the variants that segregate between the phenotype groups.  
Are there any variants that have a high Fst??? (>0.8?)

#Next you can save this dataset as a .csv and upload it to R studio 

library(ggplot2)
dat_KRT25fst <-read.csv ("KRT25_filtered_fst_results_noNAN.weir.csv", header=TRUE)

ggplot(data = dat_KRT25fst, aes(x = POS, y = WEIR_AND_COCKERHAM_FST)) +
  geom_point()

# Do we see a candidate variant?!
