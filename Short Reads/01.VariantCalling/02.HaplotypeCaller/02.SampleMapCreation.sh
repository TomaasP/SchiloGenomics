# we need to create a Sample map file for each
# THe output is a tabulated file per chromosome with the ID and the corresponding vcf route. vcf ceated by HaplotypeCaller
for chr in $(cat Chr.txt)
do
for id in $(cat ID.txt)
do
echo -e "${id}\tvcf/${is}_${Chr}.vcf" >> ${chr}.txt
done
done
