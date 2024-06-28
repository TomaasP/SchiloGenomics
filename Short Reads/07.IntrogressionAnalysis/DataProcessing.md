We selected representative strains for each population, mapped and call variants against the S. uvarum and S. eubayanus reference genomes.

SNPs count was done with bcftools
```
bcftools stats -s -filtered.recode.vcf > Strain.filtered.stats
```
Then, we make winodws for each reference genome 

```
bedtools makewindows -g PathToIndexedReferenceGenome.fa.fai -w 1000 > PathToOutput.windows.bed
```
We obtain the intersection per windoow between the reference and the filtered vcf file

```
bedtools intersect -a PathToOutput.windows.bed -b filtered.recode.vcf -c > Strain.divergences.txt
```
Plots, and post data processing was done in R:

```

library(ggplot2)
library(tidyverse)
library(zoo)

setwd("PathToWorkingDirectory")

snp_data <- read.table("PathToIntersectData", 
                       header=FALSE, 
                       col.names=c("chr", "start", "end", "snp_count"))
# Create a midpoint for each window
snp_data <- snp_data %>%
  mutate(midpoint = (start + end) / 2)
#Each point is the mean of the three next points as Almeida et al., 2014.
snp_data <- snp_data %>%
  group_by(chr) %>%
  arrange(chr, start) %>%
  mutate(mean_divergence = (rollmean(snp_count, k = 3, fill = NA, align = "left"))/1000*100)

# Optional: Color by chromosome and add a smoothing line
snp_data %>%
filter(chr!="chrMT") %>% #in case you dont want to work with the mitochondrial data
  ggplot(aes(x=midpoint, y=mean_divergence, color=chr)) +
  geom_line()+
  labs(title="Divergence per 1 kb window",
       x="Genomic Position (bp)",
       y="Divergence") +
  ylim(0,10)+
  theme_minimal() +
  theme(legend.position="none")+
  facet_wrap(~ chr, scales = "free_x", ncol = 4, nrow = 4)
```
