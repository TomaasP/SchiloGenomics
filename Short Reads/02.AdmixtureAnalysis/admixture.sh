# First, the outgroup needs to be removed from the filtered vcf
# you can do this with vcftools: (remove.txt is a tabulated file with the outgroup ID)
# vcftools --vcf PathToFilteredVCF --remove remove.txt --recode-INFO-all --non-ref-ac-any 1 --out outPathNAme --recode
# Then, the prunning was done with plink_pruning_prep.sh written by janxkoci.
for k in {1..10}
do
for it in {1..5}
do
admixture -j5 --cv Suva_ldfilter.bed $k -s time > Suva.$k.rep${it}_log
done
done
# multiple runs can be done by changing the rep{number} log file. 
# CV error value were extracted from each log files and plotted on R.
# Acnestry values were visualize following pong instrucctions.
