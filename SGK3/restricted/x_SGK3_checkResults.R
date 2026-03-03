scp ak308@nots.rice.edu:/scratch/ak308/Bio310_Dog/Results/SGK3_filtered_fst_results_mutset_noNAN.weir.fst ~/Desktop/

library(ggplot2)

dat <- read.csv("SGK3_filtered_fst_results_mutset_noNAN.weir.csv", header=TRUE)

ggplot(data = dat, aes(x = POS, y = WEIR_AND_COCKERHAM_FST)) +
  geom_point()
