#Get the ASL paths.

#n1274 (full asl voxelwise sample)
cat /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1274_aslVox_scanids.csv | while IFS="," read -r a ;

do 

path=`ls -d /data/joy/BBL/studies/pnc/n1601_dataFreeze2016/neuroimaging/asl/voxelwiseMaps_cbf/${a}_asl_quant_ssT1Std.nii.gz`;

echo $a,$path >> /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1274_aslVox_aslPaths.csv

done


#n1042 (11 and up sample)
cat /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_aslVox11andUp_scanids.csv | while IFS="," read -r b ;

do

path=`ls -d /data/joy/BBL/studies/pnc/n1601_dataFreeze2016/neuroimaging/asl/voxelwiseMaps_cbf/${b}_asl_quant_ssT1Std.nii.gz`;

echo $b,$path >> /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_aslVox11andUp_aslPaths.csv

done


#n1274 Sensitivity (full asl voxelwise sample)                                                                                                                                                  
cat /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1135_aslVoxSensitivity_scanids.csv | while IFS="," read -r c ;

do

path=`ls -d /data/joy/BBL/studies/pnc/n1601_dataFreeze2016/neuroimaging/asl/voxelwiseMaps_cbf/${c}_asl_quant_ssT1Std.nii.gz`;

echo $c,$path >> /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1135_aslVoxSensitivity_aslPaths.csv

done


#n1042 Sensitivity (11 and up sample)                                                                                                                                                           
cat /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n922_aslVox11andUpSensitivity_scanids.csv | while IFS="," read -r d ;

do

path=`ls -d /data/joy/BBL/studies/pnc/n1601_dataFreeze2016/neuroimaging/asl/voxelwiseMaps_cbf/${d}_asl_quant_ssT1Std.nii.gz`;

echo $d,$path >> /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n922_aslVox11andUpSensitivity_aslPaths.csv

done


#n587 (male only sample from n1274)
cat /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n587_aslVoxMale_scanids.csv | while IFS="," read -r e ;

do

path=`ls -d /data/joy/BBL/studies/pnc/n1601_dataFreeze2016/neuroimaging/asl/voxelwiseMaps_cbf/${e}_asl_quant_ssT1Std.nii.gz`;

echo $e,$path >> /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n587_aslVoxMale_aslPaths.csv

done


#n687 (female only sample from n1274)                                                                                                                                                          
cat /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n687_aslVoxFemale_scanids.csv | while IFS="," read -r f ;

do

path=`ls -d /data/joy/BBL/studies/pnc/n1601_dataFreeze2016/neuroimaging/asl/voxelwiseMaps_cbf/${f}_asl_quant_ssT1Std.nii.gz`;

echo $f,$path >> /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n687_aslVoxFemale_aslPaths.csv

done


#n468 (male only sample from n1042)                                                                                                                                                                          
cat /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n468_aslVox11andUpMale_scanids.csv | while IFS="," read -r g ;

do

path=`ls -d /data/joy/BBL/studies/pnc/n1601_dataFreeze2016/neuroimaging/asl/voxelwiseMaps_cbf/${g}_asl_quant_ssT1Std.nii.gz`;

echo $g,$path >> /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n468_aslVox11andUpMale_aslPaths.csv

done


#n574 (female only sample from n1042)                                                                                                                                                                        
cat /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n574_aslVox11andUpFemale_scanids.csv | while IFS="," read -r h ;

do

path=`ls -d /data/joy/BBL/studies/pnc/n1601_dataFreeze2016/neuroimaging/asl/voxelwiseMaps_cbf/${h}_asl_quant_ssT1Std.nii.gz`;

echo $h,$path >> /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n574_aslVox11andUpFemale_aslPaths.csv

done

