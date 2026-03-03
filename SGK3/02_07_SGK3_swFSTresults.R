scp ak308@nots.rice.edu:/scratch/ak308/Bio310_Dog/Results/SGK3_filtered_fst_results_2.5kbwindow_1kbstep_noNAN.windowed.weir.fst ~/Desktop/

library(ggplot2)

dat <- read.csv("SGK3_filtered_fst_results_2.5kbwindow_1kbstep_noNAN.weir.fst.csv", header=TRUE)

dat$MID <- (dat$BIN_START + dat$BIN_END)/2

ggplot(data = dat, aes(x = MID, y = WEIGHTED_FST)) +
  geom_point()
