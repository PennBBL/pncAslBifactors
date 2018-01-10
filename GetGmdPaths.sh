#Get the GMD paths for the ASL sample (n=1042).

#n1042 (11 and up sample)
cat /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_aslVox11andUp_scanids.csv | while IFS="," read -r b ;

do

path=`ls -d /data/joy/BBL/studies/pnc/n1601_dataFreeze2016/neuroimaging/t1struct/voxelwiseMaps_gmd/${b}_atropos3class_prob02SubjToTemp2mm.nii.gz`;

echo $b,$path >> /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_aslVox11andUp_gmdPaths.csv

done

