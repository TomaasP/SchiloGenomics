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
# Añadir info de poblaciones.
#Crear una lista con titulo de columna y codigo de cepas exactamente igual al que estè en el vcf en formato .txt
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

SoAm <- c(SA_A,SA_B1,SA_B2,SA_B3,SA_C)

#setear linajes 
Whole_genome<-set.populations(Whole_genome,list(Hol, SA_A, SA_B1, SA_B2, SA_B3,SA_C,Auss))
Whole_genome@populations

Whole_genome<-set.populations(Whole_genome,list(Hol,Auss,SoAm))
Whole_genome@populations


#Comenzar an?lisis
Whole_genome<-concatenate.regions(Whole_genome)
Whole_genome
Whole_genome@region.names 
Whole_genome@n.sites2 #numero de snp 
  #FST
Whole_genome<-F_ST.stats(Whole_genome,mode="nucleotide")
pairwise.FST <- t(Whole_genome@nuc.F_ST.pairwise)
head(pairwise.FST)

write.table(pairwise.FST, file = "Fst_3Pop", sep = "\t",
            row.names = F, col.names = T)
  #Pi
Whole_genome <- diversity.stats(Whole_genome)
nucdiv <- Whole_genome@nuc.diversity.within/12000000
head(nucdiv)

write.table(nucdiv, file = "Pi_3Pop", sep = "\t",
            row.names = F, col.names = T)
