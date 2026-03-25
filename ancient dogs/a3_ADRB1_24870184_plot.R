## =========================
## 5) ADRB1 24870184 ANCIENT
## =========================

## Before R: 

- Open the "ADRB124870184_vcf_ancientcanids_finalcoded.vcf" as a text edit file
- copy the inside and paste into a Microsoft Excel file 
- delete the first four rows (the first row should be where all the dogs are listed)
- delete the 0 on the first sample to Affenpinscher01_33500_A and the last sample to Wolf95_B
- save as a csv file and upload it to your R studio environment

## in R: 

library(ggplot2)
library(dplyr)
library(tidyverse)

#Choose the ancient variant 

### Open the vcf file on your computer and save it as a csv file: 

dat_hap <- read.csv("ADRB124870184_vcf_ancientcanids_finalcoded.csv", header=TRUE)

# organize the dataset 
data_long <- gather(dat_hap, Sample, Allele, AH575:a41599, factor_key=TRUE)

#Make my variables in factor format
data_long$POS <- as.factor(data_long$POS)
data_long$Allele <- as.factor(data_long$Allele)

#Plot with geom_tile entire TSHR gene
p1 <- ggplot(data_long, aes(x=POS, y=Sample, fill=Allele)) +
      geom_tile()
p2 <- p1 + scale_fill_manual(values = c("lightblue", "orange", "red", "gray", "black"))
p2

# light blue is homozygous reference allele
# orange is heterozygous
# red is homozygous alternative allele

ggsave("ADRB1_24870184_gene_ancient.tiff", width=10, height=3)
