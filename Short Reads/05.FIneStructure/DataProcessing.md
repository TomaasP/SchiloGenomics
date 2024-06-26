FINESTRUCTURE
First, install all packages needed

```
conda install snpsift plink
conda install -c compbiocore perl-switch
wget https://people.maths.bris.ac.uk/~madjl/finestructure/fs_4.1.1.zip
wget https://github.com/gusevlab/germline/raw/master/phasing_pipeline.tar.gz <- MAKE ALL inside folder
wget https://faculty.washington.edu/browning/beagle/recent.versions/beagle_3.0.4_05May09.zip <- JUST NEED TO COPY BEAGLE.JAR TO THE PHASING PIPELINE FOLDER
```
THen, Split VCF file by chromosome using Sift
```
SnpSift split onlycidri.recode.vcf
```
#Convert VCF files to PLINK .ped / .map format (for each chromosome)
```
plink --vcf ExampleVCF.vcf --recode12 --allow-extra-chr --double-id --geno 1 --out ExampleChrX
```
#Convert files to chromopainter format (for each chromosome)
```
perl ./fs_4.1.1/plink2chromopainter.pl -p=LACI0${i}.ped -m=LACI0${i}.map -o=LACI0${i}.chromopainter -f
```
#Create recombination file for each chromosome (edit line 47 in the perl script makeuniformrecfile.pl to give a constant value of 4/1,000,000 (0.000004)) which means that in all the following calculations we will use a constant recombination rate of 0.4 cM/Kb (which is the average in S. cerevisiae (Cubillos et al, 2011)). 
Iterate this perl script over the files created in step 5 
Obs: makeuniformrecfile is inside finestructure folder
```
fs_4.1.1/makeuniformrecfile.pl  Chrom${examplenumber}.chromopainter.haploid  Chrom${exampleNumber}_rec.chromopainter
```
Run chromopainter (v2) in mode ALLvsALL
For every chromosome
```
./fs_4.1.1/fs_linux_glibc2.3 chromopainter -g Chr${exampleNumber}.chromopainter -r Chr${exampleNUmber}_rec.chromopainter -t idfile.txt -o cp_Chr${ExampleNUmber} -a 0 0 -j 1 
```
#Run chromocombine to combine all chromopainter per chromosome outputs into a combined genome output (put all of them in a folder e.g. datos)
```
mkdir datos
mv cp_* datos
```
```
../fs_4.1.1/fs_linux_glibc2.3 chromocombine -d datos
```
#Run finestructure on the combined dataset
```
./fs_4.1.1/fs_linux_glibc2.3 finestructure  -x 100000 -y 100000 -z 1000 output.chunkcounts.out out.mcmc.xml
```
PLots were made by using the suggest R script 
https://people.maths.bris.ac.uk/~madjl/finestructure/finestructureR.html
