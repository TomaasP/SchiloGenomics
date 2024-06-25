#Script for the genetic analysis from vcf file

#First, installation of packages

install.packages("PopGenome") # PopGenome is no longer in the CRAN, installation from source is needed
install.packages("tidyverse")
install.packages("dplyr")
#Activate all the packages
library(PopGenome)
library(tidyverse)
library(dplyr)
#Setting working directory
setwd("PathToWorkingDIrectory")
# Load vcf file
# In case of crashing, you need to load each chromosome appart and merged them later.
Whole_genome <- readData("PathToVCF", format = "VCF")
get.sum.data(Whole_genome) # Data object summary
# Add population info, accordinlgy to the ADMIXTURE analysis.
# We need a tabulated file {pop.txt, for example} with the ID and their respective population.
Hol <- read.table("Hol.strains.txt", sep = "\t", header = T)
Hol %>% pull(strain) %>% as.character() -> Hol

SA_A <- read.table("SA-A.strains.txt", sep = "\t", header = T)
SA_A %>% pull(strain) %>% as.character() -> SA_A

SA_B1 <- read.table("SA-B1.strains.txt", sep = "\t", header = T)
SA_B1 %>% pull(strain) %>% as.character() -> SA_B1

SA_B2 <- read.table("SA-B2.strains.txt", sep = "\t", header = T)
SA_B2 %>% pull(strain) %>% as.character() -> SA_B2

SA_B3 <- read.table("SA-B3.strains.txt", sep = "\t", header = T)
SA_B3 %>% pull(strain) %>% as.character() -> SA_B3

SA_C <- read.table("SA-C.strains.txt", sep = "\t", header = T)
SA_C %>% pull(strain) %>% as.character() -> SA_C

Auss <- read.table("Auss.strains.txt", sep = "\t", header = T)
Auss %>% pull(strain) %>% as.character() -> Auss

SoAm <- c(SA_A,SA_B1,SA_B2,SA_B3,SA_C) # Here we can stablished different levels of comparisson. Whole southamerico or sub set of populations

# Lineages setting 
Whole_genome<-set.populations(Whole_genome,list(Hol, SA_A, SA_B1, SA_B2, SA_B3,SA_C,Auss))
Whole_genome@populations

Whole_genome<-set.populations(Whole_genome,list(Hol,Auss,SoAm))
Whole_genome@populations


# Start anlaysis 
Whole_genome<-concatenate.regions(Whole_genome)
Whole_genome
Whole_genome@region.names 
Whole_genome@n.sites2 # SNPs numbers
#FST
Whole_genome<-F_ST.stats(Whole_genome,mode="nucleotide")
pairwise.FST <- t(Whole_genome@nuc.F_ST.pairwise)
head(pairwise.FST)

write.table(pairwise.FST, file = "Example name", sep = "\t",
            row.names = F, col.names = T)
#Pi
Whole_genome <- diversity.stats(Whole_genome)
nucdiv <- Whole_genome@nuc.diversity.within/12000000 # divided by the total genome size to obtain the per site value
head(nucdiv)

write.table(nucdiv, file = "Example name", sep = "\t",
            row.names = F, col.names = T)
