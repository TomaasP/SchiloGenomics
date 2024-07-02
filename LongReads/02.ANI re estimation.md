ANI was re estiamted From de novo asseblies, same code as before.
```
for id in $(cat ID.txt)
do
java -jar PathTo/OAT_cmd.jar  -fasta1 ../PathToGEnome1 -fasta2 ../PathToGEnome2 -blastplus_dir ../PathTo/ncbi-blast-2.2.31+-x64-linux/ncbi-blast-2.2.31+/bin >> ../PathTo/${id}.ORTHOANIValue
done
```
