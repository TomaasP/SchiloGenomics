# THere is a Gatk tool for merging all vcf files, MergeVcfs, in order to obtain a all_raw_variants.vcf file.
# Then, a few filtering rounds needs to be done

vcftools --vcf ./all_raw_variants.vcf --recode --recode-INFO-all --minQ 40 --min-meanDP 10 --max-missing 1 --max-alleles 2 --out ./variants.Q.DP.BiAl
