# The output is vcf file for every chromosome
for chr in $(cat Chr.txt)
do
java -jar ../gatk-4.3.0.0/gatk-package-4.3.0.0-local.jar GenotypeGVCFs -R ../00.RefGenome/RefGenomePath -V gendb://all_variants_${chr}/ -G StandardAnnotation -O ../04.VariantCalling/variants_${chr}.vcf
done
