for id in $(cat ID.txt)
do
picard AddOrReplaceReadGroups I=${id}.bam O=${id}.sorted.RG.bam SORT_ORDER=coordinate RGID=DontKnow RGLB=01 RGPL=illumina RGSM=${id} RGPU=001 CREATE_INDEX=True 
done

#Picard can be installed via conda or called by gatk
