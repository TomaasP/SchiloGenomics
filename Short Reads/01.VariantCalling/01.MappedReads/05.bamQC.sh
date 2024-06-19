# you can cheack quality mapping via bamQC, which can be isntalled via conda.
for id in $(cat ID.txt)
do
qualimap bamqc -bam ${id}.sorted.RG.MD.bam -outdir ${id}_qualimap_results
done
