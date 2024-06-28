We selected representative strains for each population, mapped and call variants against the S. uvarum and S. eubayanus reference genomes.
Then, we make winodws for each reference genome 

```
bedtools makewindows -g PathToIndexedReferenceGenome.fa.fai -w 1000 > PathToOutput.windows.bed
```
We obtain the intersection per windoow between the reference and the filtered vcf file

```
bedtools intersect -a PathToOutput.windows.bed -b filtered.recode.vcf -c > Strain.divergences.txt
```

SNPs count was done with bcftools

```
bcftools stats -s -filtered.recode.vcf > Strain.filtered.stats
```
