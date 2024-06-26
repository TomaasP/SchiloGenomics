We need a tabulated file with the sraints ID.
Then, we generate a vcf pero strain

```
for id in $(cat ID.txt)
do
vcf-subset --exclude-ref -c ${id} ../PathToAllStrainsVariantFiles > ../PathToFOlder/${id}.variants.Q.DP.recode.vcf
done
```
Indexing each vcf file.

```
for id in $(cat ID.txt)
do
java -jar PathTo/gatk-package-4.3.0.0-local.jar IndexFeatureFile -I PathTo/${id}.variants.Q.DP.recode.vcf
done 
```
Finally, we obtain a consensus fasta file for each strain
```
for id in $(cat ID.txt)
do
java -jar PathTo/gatk-package-4.3.0.0-local.jar FastaAlternateReferenceMaker -R ../PathTwoReferenceGEnomeFile -V PathTo/${id}.variants.Q.DP.recode.vcf -O PathTo/${id}.consensus.fa
done
```
