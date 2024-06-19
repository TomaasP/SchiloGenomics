# A database directory is created per chromosome with all the strain´s ID
for chr in $(cat Chr.txt)
do
java -jar ../gatk-4.3.0.0/gatk-package-4.3.0.0-local.jar GenomicsDBImport --genomicsdb-workspace-path all_variants_${chr}/ --intervals ${chr} --sample-name-map ${chr}.txt
done
