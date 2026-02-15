## Before R: 

- Open the "KRT71_plink_finalcoded.vcf" as a text edit file
- copy the inside and paste into a Microsoft Excel file 
- delete the first four rows (the first row should be where all the dogs are listed)
- delete the 0 on the first sample to Affenpinscher01 and the last sample to YorkshireTerrier77
- save as a csv file and upload it to your R studio environment

## in R: 

library (ggplot2)
library(dplyr)
library (tidyverse)

### Open the vcf file on your computer and save it as a csv file: 

setwd("~/Downloads")
dat_hap_KRT71 <- read.csv("KRT71_plink_finalcoded.csv", header=TRUE)

# organize the dataset 
data_long_KRT71 <- gather(dat_hap_KRT71, Sample, Allele, Affenpinscher01:YorkshireTerrier77, factor_key=TRUE)

#Make my variables in factor format
data_long_KRT71$POS <- as.factor(data_long_KRT71$POS)
data_long_KRT71$Allele <- as.factor(data_long_KRT71$Allele)

#Plot with geom_tile entire KRT71 gene
p1 <- ggplot(data_long_KRT71,aes(x=POS,y=Sample,fill=Allele))+
      geom_tile() 
 p2 <- p1 + scale_fill_manual(values = c("lightblue", "orange", "red", "gray", "black")) 
p2

# light blue is homozygous reference allele
# orange is heterozygous
# red is homozygous alternative allele

ggsave("KRT71_gene.tiff", width=10,height=3)
