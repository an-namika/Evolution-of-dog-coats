```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)

library (ggplot2)
library(dplyr)
library (tidyverse)
```

## R Markdown

```{r one}
setwd("~/Downloads")
dat_hap_FGF5 <- read.csv("FGF5_plink_finalcoded.csv", header=TRUE)
```

```{r one point one}
# organize the dataset 

dat2 <- dat_hap_FGF5[dat_hap_FGF5$POS == 4509367, ]


data_long_FGF5 <- gather(dat2, Sample, Allele, Affenpinscher01:YorkshireTerrier77, factor_key=TRUE)

#Make my variables in factor format
data_long_FGF5$POS <- as.factor(data_long_FGF5$POS)
data_long_FGF5$Allele <- as.factor(data_long_FGF5$Allele)

#Plot with geom_tile entire KRT71 gene
p1 <- ggplot(data_long_FGF5,aes(x=POS,y=Sample,fill=Allele))+
      geom_tile() 
 p2 <- p1 + scale_fill_manual(values = c("lightblue", "orange", "red", "gray", "black")) 
p2

# light blue is homozygous reference allele
# orange is heterozygous
# red is homozygous alternative allele

ggsave("FGF5_gene.tiff", width=10,height=3)

```
