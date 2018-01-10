#Mask the ASL data for MIDAS

cat /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1259_aslVox_scanids.csv  | while IFS="," read -r a ;

do

path=`ls -d /data/joy/BBL/studies/pnc/n1601_dataFreeze2016/neuroimaging/asl/voxelwiseMaps_cbf/${a}_asl_quant_ssT1Std.nii.gz`;

mask=/data/joy/BBL/projects/pncAslAcrossDisorder/images/n1601_PcaslCoverageMask_GM.nii.gz

outdir=/data/joy/BBL/projects/pncAslAcrossDisorder/images/maskedAslForMIDAS

pathName=$(echo $path|cut -d, -f1)

fileName=$(basename $path | cut -d. -f1)

echo $pathName                                                                                                                                                          
echo ${fileName}                                                                                                                                                          
fslmaths $pathName -mas $mask $outdir/${fileName}_masked.nii.gz

done

