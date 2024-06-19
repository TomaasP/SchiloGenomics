# The vcf is tranformed into phylip format by using vcf2pylip.py written by Edgardo Ortiz & Juan Palacio-Mejia, 2020.
iqtree -s variants.Q.DP.BiAl.recode.min4.phy -st DNA -o outgroupID -m Model -bb 1000 -nt 8 -redo
