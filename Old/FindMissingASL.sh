#Create lists of bblids/scanids of those missing either:
#1) an ASL subject folder on chead, 2) the appropriate ASL scanid folder on chead, or 3) the ASL *.nii.gz file on chead.
#Make directories for missing subject folders and scanid folders
#Copy the bblid lists to monstrum (needed for the CopyRavens.sh script)

#!/bin/bash

cat /data/joy/BBL/projects/pncT1AcrossDisorder_Kaczkurkin/subjectData/ASL_subjectData/bblids_scanids_date.csv | while IFS="," read -r a b c ;
do

if [ ! -d /data/joy/BBL/studies/pnc/processedData/pcasl/pcasl_201607291423/${a} ]; then

    echo $a,$b,$c >> /data/joy/BBL/projects/pncT1AcrossDisorder_Kaczkurkin/subjectData/ASL_subjectData/MissingAslDirs.csv
    
    #subjFolder="/data/joy/BBL/studies/pnc/processedData/structural/ravens/${a}";
    #echo "subject folder is $subjFolder";
    #mkdir "$subjFolder"

fi


if [ ! -d /data/joy/BBL/studies/pnc/processedData/pcasl/pcasl_201607291423/${a}/*${b} ]; then

    echo $a,$b,$c >> /data/joy/BBL/projects/pncT1AcrossDisorder_Kaczkurkin/subjectData/ASL_subjectData/MissingAslScanidDirs.csv

    #scanFolder="/data/joy/BBL/studies/pnc/processedData/structural/ravens/${a}/${c}x${b}/";
    #echo "scan folder is $scanFolder";
    #mkdir "$scanFolder"

fi


if [ ! -f /data/joy/BBL/studies/pnc/processedData/pcasl/pcasl_201607291423/${a}/*${b}/norm/${a}_*${b}_asl_quant_ssT1Std.nii.gz ]; then

    echo $a,$b,$c >> /data/joy/BBL/projects/pncT1AcrossDisorder_Kaczkurkin/subjectData/ASL_subjectData/MissingAslImage.csv

fi


done


#Copy the missing bblid list to monstrum.

#cd /data/joy/BBL/projects/pncT1AcrossDisorder_Kaczkurkin/subjectData
#scp "Missing150.csv" antoniak@youknowwho.uphs.upenn.edu:/import/monstrum/Users/antoniak/PNC_MDD/subjectData

