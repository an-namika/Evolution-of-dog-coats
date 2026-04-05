---
title: "FGF5 and ADBR1 genotype-phenotype association"
output: html_document
date: "2026-04-05"
---

```{r setup, include=FALSE}
library(ggplot2)
library(dplyr)
library(tidyverse)
```

## R Markdown

```{r one}
setwd("~/Downloads")
dat_hap_FGF5 <- read.csv("FGF5_plink_finalcoded1.csv", header=TRUE)
```

## Including Plots

```{r two}
# organize the dataset 

dat2 <- dat_hap_FGF5[dat_hap_FGF5$POS == 4509367, ]

data_long_FGF5 <- gather(dat2, Sample, Allele, AfghanHound01:YorkshireTerrier77, factor_key=TRUE)

# preserve CSV/sample column order instead of alphabetical order
data_long_FGF5$Sample <- factor(data_long_FGF5$Sample, levels = unique(data_long_FGF5$Sample))

# make variables factors
data_long_FGF5$POS <- as.factor(data_long_FGF5$POS)
data_long_FGF5$Allele <- factor(data_long_FGF5$Allele, levels = c(0, 1, 2, 3))

# plot
p1 <- ggplot(data_long_FGF5, aes(x = POS, y = Sample, fill = Allele)) +
  geom_tile() +
  scale_y_discrete(limits = rev(levels(data_long_FGF5$Sample)))

p2 <- p1 + scale_fill_manual(values = c("lightblue", "orange", "red", "gray"))
p2

ggsave("FGF5_gene.tiff", width = 10, height = 3)
```

```{r one}
setwd("~/Downloads")
dat_ADRB1_24860187 <- read.csv("ADRB1_24860187_plink_finalcoded.csv", header=TRUE)
```

## Including Plots

```{r two}
# keep only the two columns you need, if necessary
dat_ADRB1_24860187 <- dat_ADRB1_24860187[, 1:2]
colnames(dat_ADRB1_24860187) <- c("Sample", "Allele")

# preserve CSV order
dat_ADRB1_24860187$Sample <- factor(dat_ADRB1_24860187$Sample, levels = unique(dat_ADRB1_24860187$Sample))
dat_ADRB1_24860187$Allele <- factor(dat_ADRB1_24860187$Allele, levels = c(0, 1, 2, 3))
dat_ADRB1_24860187$POS <- as.factor("24860187")

# plot
p1 <- ggplot(dat_ADRB1_24860187, aes(x = POS, y = Sample, fill = Allele)) +
  geom_tile() +
  scale_y_discrete(limits = rev(levels(dat_ADRB1_24860187$Sample)))

p2 <- p1 + scale_fill_manual(values = c("lightblue", "orange", "red", "gray"))
p2

ggsave("ADRB1_24860187_gene.tiff", width = 10, height = 3)
```
```{r one}
setwd("~/Downloads")
dat_ADRB1_24870184 <- read.csv("ADRB1_24870184_plink_finalcoded.csv", header=TRUE)
```

## Including Plots

```{r two}
# keep only the two columns you need, if necessary
dat_ADRB1_24870184 <- dat_ADRB1_24870184[, 1:2]
colnames(dat_ADRB1_24870184) <- c("Sample", "Allele")

# preserve CSV order
dat_ADRB1_24870184$Sample <- factor(dat_ADRB1_24870184$Sample, levels = unique(dat_ADRB1_24870184$Sample))
dat_ADRB1_24870184$Allele <- factor(dat_ADRB1_24870184$Allele, levels = c(0, 1, 2, 3))
dat_ADRB1_24870184$POS <- as.factor("24870184")

# plot
p1 <- ggplot(dat_ADRB1_24870184, aes(x = POS, y = Sample, fill = Allele)) +
  geom_tile() +
  scale_y_discrete(limits = rev(levels(dat_ADRB1_24870184$Sample)))

p2 <- p1 + scale_fill_manual(values = c("lightblue", "orange", "red", "gray"))
p2

ggsave("ADRB1_24870184_gene.tiff", width = 10, height = 3)
```


