Before R:
- Open the "SGK3_plink_finalcoded.vcf" as a text edit file
- copy the inside and paste into a Microsoft Excel file
- delete the first few rows (the first row should be where all the dogs are listed)
- delete the 0 on the first sample to Affenpinscher01 and the last sample to YorkshireTerrier77
- save as a csv file and upload it to your R studio environment

In R:

library (ggplot2)
library(dplyr)
library (tidyverse)

### Open the vcf file on your computer and save it as a csv file: 

setwd("~/Downloads")
dat_hap_SGK3 <- read.csv("SGK3_plink_finalcoded.csv", header=TRUE)

# organize the dataset 
data_long_SGK3 <- gather(dat_hap_SGK3, Sample, Allele, Affenpinscher01:YorkshireTerrier77, factor_key=TRUE)

#Make my variables in factor format
data_long_SGK3$POS <- as.factor(data_long_SGK3$POS)
data_long_SGK3$Allele <- as.factor(data_long_SGK3$Allele)

#Plot with geom_tile entire SGK3 gene
p1 <- ggplot(data_long_SGK3,aes(x=POS,y=Sample,fill=Allele))+
      geom_tile() 
 p2 <- p1 + scale_fill_manual(values = c("lightblue", "orange", "red", "gray", "black")) 
p2

# light blue is homozygous reference allele
# orange is heterozygous
# red is homozygous alternative allele

ggsave("SGK3_gene.tiff", width=10,height=3)
