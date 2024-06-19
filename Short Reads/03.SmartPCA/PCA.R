library(ggplot2)
library(tidyverse)

setwd("PathToPCAfiles")

evecDat <- read.table("Input.evec", skip = 1, 
                      col.names = c("Sample", "PC1", "PC2", "PC3", "PC4", "PC5",
                                                  "PC6", "PC7", "PC8", "PC9", "PC10", "Pop")) # Last column is for Pop names, which were determined by admixture.
evecDat$Pop <- factor(evecDat$Pop,levels = c("PopNames", "One name per Pop))

p1 <- evecDat %>%
  ggplot(aes(x=PC1,y=PC2
             ,col=Pop))+
  geom_point(size=3)+
  labs(x="PC1 X %",
       y= "PC2 X %",
       col="Population"
  )+
  scale_color_manual(values = c("Mannualy choose colors"))+
  theme_bw()
p1
