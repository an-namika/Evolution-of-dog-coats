---
title: 'Ancient Dogs: Timeline & Geography'
output: html_document
date: "2026-03-25"
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)

install.packages("maps")
library(maps)
install.packages("mapdata")
library(mapdata)
install.packages("rworldmap")
library(rworldmap)
install.packages("scatterpie")
install.packages("mapplots")
library(mapplots)
library(ggplot2)
library(scatterpie)

```

## R Markdown

```{r cars}

setwd("~/Downloads")
dat <- read.csv("Mar24_2026_ancientdogshaplotypes.csv", header=TRUE)

datlupus <- dat[dat$Species == "lupus", ]
datfamiliaris <- dat[dat$Species == "familiaris", ]

```

## Including Plots


```{r timeline_FGF5, echo=FALSE}
ggplot(datfamiliaris, aes(x=Long, y=Age_Name_BP, fill=Genotype.of.FGF5)) + geom_point(shape = 21, size = 4, color = "black", stroke = 0.5) +  scale_fill_manual(values = c("mediumseagreen","turquoise2", "orange2")) +
  labs(x = "Longitude", y = "Age of Dog")  
```

```{r timeline_ADRB1_24870184, echo=FALSE}
ggplot(datfamiliaris, aes(x=Long, y=Age_Name_BP, fill=Genotype.of.ADRB1_24870184)) + geom_point(shape = 21, size = 4, color = "black", stroke = 0.5) +  scale_fill_manual(values = c("mediumseagreen","turquoise2", "orange2"))   + labs(x = "Longitude", y = "Age of Dog") 

```

```{r timeline_ADRB1_24860187, echo=FALSE}
ggplot(datfamiliaris, aes(x=Long, y=Age_Name_BP, fill=Genotype.of.ADRB1_24860187)) + geom_point(shape = 21, size = 4, color = "black", stroke = 0.5) +  scale_fill_manual(values = c("mediumseagreen","turquoise2", "orange2"))   + labs(x = "Longitude", y = "Age of Dog")

```

FGF5 MAPS:

```{r 10to7, echo=FALSE}
datlupus <- dat[dat$Species == "lupus", ]
datfamiliaris <- dat[dat$Species == "familiaris", ]
datSecondset_10kya_7kya <- datfamiliaris[datfamiliaris$Secondset_10kya_7kya == "yes", ]


world <- map_data('world')
p <- ggplot(world, aes(lat, long)) +
  geom_map(map=world, aes(map_id=region), fill="lightgray", color=NA) +
  coord_quickmap() + theme_classic() 

q <- p +
  geom_point(dat = datSecondset_10kya_7kya, aes(x = Long, y = Lat , fill=Genotype.of.FGF5), size = 4, stroke = 1, shape=21, color="black", stroke=1)  + scale_fill_manual(values = c("mediumseagreen","turquoise2", "orange2", "orange2", "white", "orange2"))

q+  theme(line = element_blank(),
          text = element_blank(),
          title = element_blank()) +
  scale_x_continuous(limits = c(-15, 180))+
  scale_y_continuous(limits = c(-50,80)) 


ggsave("Mar24_2026_map_ancientdogs_10to7kya.tiff", width=7,height=4) 

```

```{r 7to4, echo=FALSE}

datlupus <- dat[dat$Species == "lupus", ]
datfamiliaris <- dat[dat$Species == "familiaris", ]
Secondset_7kya_4kya <- datfamiliaris[datfamiliaris$Secondset_7kya_4kya == "yes", ]

world <- map_data('world')
p <- ggplot(world, aes(lat, long)) +
  geom_map(map=world, aes(map_id=region), fill="lightgray", color=NA) +
  coord_quickmap() + theme_classic() 

q <- p +
  geom_point(dat = Secondset_7kya_4kya, aes(x = Long, y = Lat , fill=Genotype.of.FGF5), size = 4, stroke = 1, shape=21, color="black")  + scale_fill_manual(values = c("mediumseagreen","turquoise2", "orange2", "orange2", "white", "orange2"))

q+  theme(line = element_blank(),
          text = element_blank(),
          title = element_blank()) +
  scale_x_continuous(limits = c(-15, 180))+
  scale_y_continuous(limits = c(-50,80)) 


ggsave("Mar24_2026_map_ancientdogs_7kyato4kya.tiff", width=7,height=4) 


```

```{r 4topresent, echo=FALSE}

datlupus <- dat[dat$Species == "lupus", ]
datfamiliaris <- dat[dat$Species == "familiaris", ]
Secondset_4kya_present <- datfamiliaris[datfamiliaris$Secondset_4kya_present == "yes", ]

world <- map_data('world')
p <- ggplot(world, aes(lat, long)) +
  geom_map(map=world, aes(map_id=region), fill="lightgray", color=NA) +
  coord_quickmap() + theme_classic() 

q <- p +
  geom_point(dat = Secondset_4kya_present, aes(x = Long, y = Lat , fill=Genotype.of.FGF5), size = 4, stroke = 1, shape=21, color="black")  + scale_fill_manual(values = c("mediumseagreen","turquoise2", "orange2", "orange2", "white", "orange2"))  

q+  theme(line = element_blank(),
          text = element_blank(),
          title = element_blank()) +
  scale_x_continuous(limits = c(-15, 180))+
  scale_y_continuous(limits = c(-50,80)) 

ggsave("Mar24_2026_map_ancientdogs_4kya_to_present.tiff", width=7,height=4)


```

ADRB1_24870184 MAPS:

```{r 10to7, echo=FALSE}
datlupus <- dat[dat$Species == "lupus", ]
datfamiliaris <- dat[dat$Species == "familiaris", ]
datSecondset_10kya_7kya <- datfamiliaris[datfamiliaris$Secondset_10kya_7kya == "yes", ]


world <- map_data('world')
p <- ggplot(world, aes(lat, long)) +
  geom_map(map=world, aes(map_id=region), fill="lightgray", color=NA) +
  coord_quickmap() + theme_classic() 

q <- p +
  geom_point(dat = datSecondset_10kya_7kya, aes(x = Long, y = Lat , fill=Genotype.of.ADRB1_24870184), size = 4, stroke = 1, shape=21, color="black", stroke=1)  + scale_fill_manual(values = c("mediumseagreen","turquoise2", "orange2", "orange2", "white", "orange2"))

q+  theme(line = element_blank(),
          text = element_blank(),
          title = element_blank()) +
  scale_x_continuous(limits = c(-15, 180))+
  scale_y_continuous(limits = c(-50,80)) 


ggsave("Mar24_2026_map_ancientdogs_10to7kya.tiff", width=7,height=4) 

```

```{r 7to4, echo=FALSE}

datlupus <- dat[dat$Species == "lupus", ]
datfamiliaris <- dat[dat$Species == "familiaris", ]
Secondset_7kya_4kya <- datfamiliaris[datfamiliaris$Secondset_7kya_4kya == "yes", ]

world <- map_data('world')
p <- ggplot(world, aes(lat, long)) +
  geom_map(map=world, aes(map_id=region), fill="lightgray", color=NA) +
  coord_quickmap() + theme_classic() 

q <- p +
  geom_point(dat = Secondset_7kya_4kya, aes(x = Long, y = Lat , fill=Genotype.of.ADRB1_24870184), size = 4, stroke = 1, shape=21, color="black")  + scale_fill_manual(values = c("mediumseagreen","turquoise2", "orange2", "orange2", "white", "orange2"))

q+  theme(line = element_blank(),
          text = element_blank(),
          title = element_blank()) +
  scale_x_continuous(limits = c(-15, 180))+
  scale_y_continuous(limits = c(-50,80)) 


ggsave("Mar24_2026_map_ancientdogs_7kyato4kya.tiff", width=7,height=4) 


```

```{r 4topresent, echo=FALSE}

datlupus <- dat[dat$Species == "lupus", ]
datfamiliaris <- dat[dat$Species == "familiaris", ]
Secondset_4kya_present <- datfamiliaris[datfamiliaris$Secondset_4kya_present == "yes", ]

world <- map_data('world')
p <- ggplot(world, aes(lat, long)) +
  geom_map(map=world, aes(map_id=region), fill="lightgray", color=NA) +
  coord_quickmap() + theme_classic() 

q <- p +
  geom_point(dat = Secondset_4kya_present, aes(x = Long, y = Lat , fill=Genotype.of.ADRB1_24870184), size = 4, stroke = 1, shape=21, color="black")  + scale_fill_manual(values = c("mediumseagreen","turquoise2", "orange2", "orange2", "white", "orange2"))  

q+  theme(line = element_blank(),
          text = element_blank(),
          title = element_blank()) +
  scale_x_continuous(limits = c(-15, 180))+
  scale_y_continuous(limits = c(-50,80)) 

ggsave("Mar24_2026_map_ancientdogs_4kya_to_present.tiff", width=7,height=4)


```

ADRB1_24870187 MAPS:

```{r 10to7, echo=FALSE}
datlupus <- dat[dat$Species == "lupus", ]
datfamiliaris <- dat[dat$Species == "familiaris", ]
datSecondset_10kya_7kya <- datfamiliaris[datfamiliaris$Secondset_10kya_7kya == "yes", ]


world <- map_data('world')
p <- ggplot(world, aes(lat, long)) +
  geom_map(map=world, aes(map_id=region), fill="lightgray", color=NA) +
  coord_quickmap() + theme_classic() 

q <- p +
  geom_point(dat = datSecondset_10kya_7kya, aes(x = Long, y = Lat , fill=Genotype.of.ADRB1_24860187), size = 4, stroke = 1, shape=21, color="black", stroke=1)  + scale_fill_manual(values = c("mediumseagreen","turquoise2", "orange2", "orange2", "white", "orange2"))

q+  theme(line = element_blank(),
          text = element_blank(),
          title = element_blank()) +
  scale_x_continuous(limits = c(-15, 180))+
  scale_y_continuous(limits = c(-50,80)) 


ggsave("Mar24_2026_map_ancientdogs_10to7kya.tiff", width=7,height=4) 

```

```{r 7to4, echo=FALSE}

datlupus <- dat[dat$Species == "lupus", ]
datfamiliaris <- dat[dat$Species == "familiaris", ]
Secondset_7kya_4kya <- datfamiliaris[datfamiliaris$Secondset_7kya_4kya == "yes", ]

world <- map_data('world')
p <- ggplot(world, aes(lat, long)) +
  geom_map(map=world, aes(map_id=region), fill="lightgray", color=NA) +
  coord_quickmap() + theme_classic() 

q <- p +
  geom_point(dat = Secondset_7kya_4kya, aes(x = Long, y = Lat , fill=Genotype.of.ADRB1_24860187), size = 4, stroke = 1, shape=21, color="black")  + scale_fill_manual(values = c("mediumseagreen","turquoise2", "orange2", "orange2", "white", "orange2"))

q+  theme(line = element_blank(),
          text = element_blank(),
          title = element_blank()) +
  scale_x_continuous(limits = c(-15, 180))+
  scale_y_continuous(limits = c(-50,80)) 


ggsave("Mar24_2026_map_ancientdogs_7kyato4kya.tiff", width=7,height=4) 


```

```{r 4topresent, echo=FALSE}

datlupus <- dat[dat$Species == "lupus", ]
datfamiliaris <- dat[dat$Species == "familiaris", ]
Secondset_4kya_present <- datfamiliaris[datfamiliaris$Secondset_4kya_present == "yes", ]

world <- map_data('world')
p <- ggplot(world, aes(lat, long)) +
  geom_map(map=world, aes(map_id=region), fill="lightgray", color=NA) +
  coord_quickmap() + theme_classic() 

q <- p +
  geom_point(dat = Secondset_4kya_present, aes(x = Long, y = Lat , fill=Genotype.of.ADRB1_24860187), size = 4, stroke = 1, shape=21, color="black")  + scale_fill_manual(values = c("mediumseagreen","turquoise2", "orange2", "orange2", "white", "orange2"))  

q+  theme(line = element_blank(),
          text = element_blank(),
          title = element_blank()) +
  scale_x_continuous(limits = c(-15, 180))+
  scale_y_continuous(limits = c(-50,80)) 

ggsave("Mar24_2026_map_ancientdogs_4kya_to_present.tiff", width=7,height=4)


```

```{r pressure, echo=FALSE}
plot(pressure)
```

```{r pressure, echo=FALSE}
plot(pressure)
```

```{r pressure, echo=FALSE}
plot(pressure)
```

```{r pressure, echo=FALSE}
plot(pressure)
```

```{r pressure, echo=FALSE}
plot(pressure)
```

```{r pressure, echo=FALSE}
plot(pressure)
```

```{r pressure, echo=FALSE}
plot(pressure)
```
