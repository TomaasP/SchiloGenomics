for id in $(cat ID.txt)
do
samtools index ${id}.sorted.RG.MD.bam
done
