for id in $(cat ID.txt)
do
picard MarkDuplicates I=${id}.sorted.RG.bam O=${id}.sorted.RG.MD.bam M=${id}.sorted.RG.MD.rmdup.txt
done
