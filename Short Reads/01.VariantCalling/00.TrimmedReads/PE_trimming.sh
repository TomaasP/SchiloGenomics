for ID in $(cat ID.txt) # ID.txt is the file with al the strains ID
do
fastp -i ../00.RawReads/${ID}.R1.fastq.gz -o ./${ID}.R1.fastq.gz -I ../00.RawReads/${ID}.R2.fastq.gz -O ./${ID}.R2.fastq.gz -q 30 #-q value is the filtering parameter
done

# For Single End reads the code change to
# fastp -i ../00.RawReads/${ID}.R1.fastq.gz -o ./${ID}.R1.fastq.gz -q 30
