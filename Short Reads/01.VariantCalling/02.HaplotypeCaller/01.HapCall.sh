# This is double nested loop, which needs the strain´s ID and the chromosome name (intervals).
# HaplotypeCaller per strain per chromosome
mkdir vcf #vcf directory needs to be created
for id in $(cat ID.txt)
do
for chr in $(cat Chr.txt) # a file with all reference chromosome names is needed
do
java -jar ../gatk-4.3.0.0/gatk-package-4.3.0.0-local.jar HaplotypeCaller --intervals ${chr} -ERC GVCF -R ../00.RefGenome/RefGenomePath.fa -I ../01.MappedReads/${id}.sorted.RG.MD.bam -O vcf/${id}_${chr}.vcf
done
done
