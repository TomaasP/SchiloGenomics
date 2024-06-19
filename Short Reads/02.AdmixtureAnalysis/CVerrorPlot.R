# libraries
library(ggplot2)
library(tidyverse)

setwd("PathToDirectory")

data <- read.delim("CVerror.txt",dec = ",")

data %>% ggplot(aes(K,CV))+
  geom_line()+
  scale_x_continuous(breaks = c(2,4,6,8,10))+
  theme_bw()+
  ylab("Cross validation error")
