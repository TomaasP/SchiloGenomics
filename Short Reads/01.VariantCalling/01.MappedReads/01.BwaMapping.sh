for strain in $(cat ID.txt) # ID.txt is the file with all the strains ID
do
bwa mem ../RefGenome/RefGenomePath.fa ../00.TrimmedReads/${strain}.R1.fastq.gz ../00.TrimmedReads/${strain}.R1.fastq.gz | samtools sort -o ${strain}.bam
done
