#mask the zstat file by the cluster mask to get rid of insignificant clusters 

#input
zstat=/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1042_AslPath/age_sex_pcaslRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/zstat10.nii.gz 
maskName=/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1042_AslPath/age_sex_pcaslRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/easythresh_3.09_54/cluster_mask_zstat10_3.09_cls54_signifOnly.nii.gz

echo "zstat name is $zstat"

echo "Mask name is $maskName"

#this is where the output goes                                                                                                                                              
outdir=/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1042_AslPath/age_sex_pcaslRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/

echo "outdir is $outdir"

echo ""

#mask the data
fslmaths ${zstat} -mas ${maskName} ${outdir}/zstat10_maskedByClusterMask.nii.gz
