#Binarize the cluster masks from easythresh (each signif cluster has its own mask) so it will be 0s and 1s instead of 0s and 55-59.

#mask
mask1Name=/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1042_AslPath/age_sex_pcaslRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/easythresh_3.09_54/cluster_mask_zstat10_3.09_p01_dACC.nii.gz

mask2Name=/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1042_AslPath/age_sex_pcaslRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/easythresh_3.09_54/cluster_mask_zstat10_3.09_p01_rACC.nii.gz

mask3Name=/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1042_AslPath/age_sex_pcaslRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/easythresh_3.09_54/cluster_mask_zstat10_3.09_p01_parahipp.nii.gz

mask4Name=/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1042_AslPath/age_sex_pcaslRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/easythresh_3.09_54/cluster_mask_zstat10_3.09_p01_midbrain.nii.gz

mask5Name=/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1042_AslPath/age_sex_pcaslRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/easythresh_3.09_54/cluster_mask_zstat10_3.09_p01_postcentGyr.nii.gz

#this is where the output masks will go                                                                                                                                              
outdir=/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1042_AslPath/age_sex_pcaslRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/easythresh_3.09_54/

echo "outdir is $outdir"

echo ""

fslmaths ${mask1Name} -thr 54 -bin ${outdir}/cluster_mask_zstat10_3.09_p01_dACC_bin.nii.gz
fslmaths ${mask2Name} -thr 55 -bin ${outdir}/cluster_mask_zstat10_3.09_p01_rACC_bin.nii.gz
fslmaths ${mask3Name} -thr 56 -bin ${outdir}/cluster_mask_zstat10_3.09_p01_parahipp_bin.nii.gz
fslmaths ${mask4Name} -thr 57 -bin ${outdir}/cluster_mask_zstat10_3.09_p01_midbrain_bin.nii.gz
fslmaths ${mask5Name} -thr 58 -bin ${outdir}/cluster_mask_zstat10_3.09_p01_postcentGyr_bin.nii.gz

