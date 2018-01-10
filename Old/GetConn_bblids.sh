#Extract just the n=976 bblids from the connectivity .csv file.

#!/bin/bash

#NOTE: cohortAslSeeds.csv is output here following the connectivity analyses: /data/joy/BBL/projects/pncReproc2015/restbold/kaczkurkinAslSeeds/seedmaps

cat /data/joy/BBL/projects/pncAslAcrossDisorder/results/n976_AslBifactorsConnectivity/cohortAslSeeds.csv | while IFS="," read -r a b c d e f ;
do

    echo $a >> /data/joy/BBL/projects/pncAslAcrossDisorder/results/n976_AslBifactorsConnectivity/n976_AslConn_bblids.csv
   
done

