##REPLICATION WITH NEW VOXELWISE WRAPPERS
#n1042 (11 and up sample)

cat /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_aslVox11andUp_scanids.csv | while IFS="," read -r b ;

do

path=`ls -d /data/joy/BBL/studies/pnc/n1601_dataFreeze/neuroimaging/asl/voxelwiseMaps_cbf/${b}_asl_quant_ssT1Std.nii.gz`;

echo $b,$path >> /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_aslVox11andUp_aslPaths_NEW.csv

done
