```{r one}
setwd("~/Downloads")
dat_ADRB1_24860187 <- read.csv("ADRB1_24860187_plink_finalcoded.csv", header=TRUE)
```

```{r one point one}

colnames(dat_ADRB1_24860187) <- c("Sample", "Allele")

# Make variables factors
dat_ADRB1_24860187$Sample <- as.factor(dat_ADRB1_24860187$Sample)
dat_ADRB1_24860187$Allele <- as.factor(dat_ADRB1_24860187$Allele)

# Add a single x-position so geom_tile has something to plot on the x axis
dat_ADRB1_24860187$POS <- as.factor("24860187")

# Plot
p1 <- ggplot(dat_ADRB1_24860187, aes(x = POS, y = Sample, fill = Allele)) +
  geom_tile()

p2 <- p1 + scale_fill_manual(values = c("lightblue", "orange", "red", "gray", "black"))
p2

ggsave("ADRB1_24860187_gene.tiff", width = 10, height = 3)


```

```{r one}
setwd("~/Downloads")
dat_ADRB1_24870184 <- read.csv("ADRB1_24870184_plink_finalcoded.csv", header=TRUE)
```

```{r one point one}

# If your file already has the correct column names, this line is optional
colnames(dat_ADRB1_24870184) <- c("Sample", "Allele")

# Make variables factors
dat_ADRB1_24870184$Sample <- as.factor(dat_ADRB1_24870184$Sample)
dat_ADRB1_24870184$Allele <- as.factor(dat_ADRB1_24870184$Allele)

# Add a single x-position so geom_tile has something to plot on the x axis
dat_ADRB1_24870184$POS <- as.factor("24870184")

# Plot
p1 <- ggplot(dat_ADRB1_24870184, aes(x = POS, y = Sample, fill = Allele)) +
  geom_tile()

p2 <- p1 + scale_fill_manual(values = c("lightblue", "orange", "red", "gray", "black"))
p2

ggsave("ADRB1_24870184_gene.tiff", width = 10, height = 3)

```
