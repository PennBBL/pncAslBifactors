#mask the zstat file by the cluster mask to get rid of insignificant clusters (for making figures) 

#input
zstat=/data/joy/BBL/projects/pncAslAcrossDisorder/results/n833_Conn_dACCPath/age_sex_restRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/zstat10.nii.gz
maskName_Lcaudate=/data/joy/BBL/projects/pncAslAcrossDisorder/results/n833_Conn_dACCPath/age_sex_restRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/easythresh_3.09_54/cluster_mask_zstat10Neg_3.09_p01_Lcaudate.nii.gz
maskName_Rcaudate=/data/joy/BBL/projects/pncAslAcrossDisorder/results/n833_Conn_dACCPath/age_sex_restRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/easythresh_3.09_54/cluster_mask_zstat10Neg_3.09_p01_Rcaudate.nii.gz

echo "zstat name is $zstat"

echo "Left Caudate Mask name is $maskName_Lcaudate"

echo "Right Caudate Mask name is $maskName_Rcaudate"

#this is where the output goes                                                                                                                                              
outdir=/data/joy/BBL/projects/pncAslAcrossDisorder/results/n833_Conn_dACCPath/age_sex_restRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/easythresh_3.09_54

echo "outdir is $outdir"

echo ""

#mask the data
fslmaths ${zstat} -mas ${maskName_Lcaudate} ${outdir}/zstat10_3.09_p01_Lcaudate.nii.gz
fslmaths ${zstat} -mas ${maskName_Rcaudate} ${outdir}/zstat10_3.09_p01_Rcaudate.nii.gz
