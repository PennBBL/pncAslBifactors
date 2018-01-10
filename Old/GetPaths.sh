#Get the ASL paths.

cat /data/joy/BBL/projects/pncT1AcrossDisorder_Kaczkurkin/subjectData/ASL_subjectData/bblids_scanids_date.csv | while IFS="," read -r a b c ;

do

path=`ls -d /data/joy/BBL/studies/pnc/processedData/pcasl/pcasl_201607291423/${a}/*${b}/norm/${a}_*${b}_asl_quant_ssT1Std.nii.gz`;


fileName=`echo $path | cut -d " " -f1`;

echo $a,$b,$fileName >> /data/joy/BBL/projects/pncT1AcrossDisorder_Kaczkurkin/subjectData/ASL_subjectData/n1274_AslPaths.csv

done

