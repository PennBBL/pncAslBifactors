#mask the zstat file by the cluster mask to get rid of insignificant clusters 

#input
zstat=/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1042_AslPath/age_sex_pcaslRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/zstat10.nii.gz 
maskName_dACC=/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1042_AslPath/age_sex_pcaslRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/easythresh_3.09_54/cluster_mask_zstat10_3.09_p01_dACC.nii.gz
maskName_rACC=/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1042_AslPath/age_sex_pcaslRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/easythresh_3.09_54/cluster_mask_zstat10_3.09_p01_rACC.nii.gz

echo "zstat name is $zstat"

echo "dACC Mask name is $maskName_dACC"

echo "rACC Mask name is $maskName_rACC"

#this is where the output goes                                                                                                                                              
outdir=/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1042_AslPath/age_sex_pcaslRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/easythresh_3.09_54

echo "outdir is $outdir"

echo ""

#mask the data
fslmaths ${zstat} -mas ${maskName_dACC} ${outdir}/zstat10_3.09_p01_dACC.nii.gz
fslmaths ${zstat} -mas ${maskName_rACC} ${outdir}/zstat10_3.09_p01_rACC.nii.gz
