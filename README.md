# SchiloGenomics

Here there are all scripts used on the paper "An integrative taxonomy approach reveals Saccharomyces chiloensis sp. nov. as a newly discovered species from Coastal Patagonia"

The project is divided in two: analysis for short reads and long reads. Each of them has mulitple directories, for each subanalysis.

Main directory
     
     |---- Short reads
     |     |- 01.VariantCalling
     |     |     |- 00. Raw reads
     |     |     |- 00. Trimmed Reads
     |     |     |- 01. Mapped Reads
     |     |     |- 02. HaplotypeCaller
     |     |     |- 03. PhylogenyTree
     |     |
     |     |- 02. AdmixtureAnalysis
     |     |     |- admixture.sh
     |     |     |-CVerrorPlot.R
     |     |- 03. SmartPCA 
     |     |     |- 01.DataPreparation.md
     |     |     |- PCA.R
     |     |- 04.PopulationGenomicsStats 
     |     |     |-01.DataPreparationAndProcessing.md
     |     |     |-PopGenomeAnalysis.R
     |     |-05.FIneStructure
     |     |     |-DataProcessing.md
     |     |-06.ConsensusVCF
     |     |     |-ANI.md
     |     |     |-VcfConensus.md
     |     |-07.IntrogressionAnalysis
     |     |     |-DataProcessing.md
     |- Long Reads
