#Merge the connectivity seed files into a single 4d file and create a mean connectivity file.

mapdir=$(ls -d1 /data/joy/BBL/projects/pncReproc2015/restbold/kaczkurkinAslSeeds/seedmaps)
bblids=$(cat /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n833_connVox11andUp_bblids.csv)

seedName="rostralACC"
unset maps
for i in $bblids
   do
   maps="${maps} $(ls ${mapdir}/${i}_*zr*${seedName}*.nii.gz)"
done
fslmerge -t /data/joy/BBL/projects/pncAslAcrossDisorder/images/ConnectivityMaps/n833_${seedName}_mergedConnZR.nii.gz ${maps}

#fslmaths ${maps} -Tmean /data/joy/BBL/projects/pncAslAcrossDisorder/images/ConnectivityMaps/n833_${seedName}_meanConnZR.nii.gz
fslmaths /data/joy/BBL/projects/pncAslAcrossDisorder/images/ConnectivityMaps/n833_${seedName}_mergedConnZR.nii.gz -Tmean /data/joy/BBL/projects/pncAslAcrossDisorder/images/ConnectivityMaps/n833_${seedName}_meanConnZR.nii.gz

seedName="dorsalACC"
unset maps
for i in $bblids
   do
   maps="${maps} $(ls ${mapdir}/${i}_*zr*${seedName}*.nii.gz)"
done
fslmerge -t /data/joy/BBL/projects/pncAslAcrossDisorder/images/ConnectivityMaps/n833_${seedName}_mergedConnZR.nii.gz ${maps}

fslmaths /data/joy/BBL/projects/pncAslAcrossDisorder/images/ConnectivityMaps/n833_${seedName}_mergedConnZR.nii.gz -Tmean /data/joy/BBL/projects/pncAslAcrossDisorder/images/ConnectivityMaps/n833_${seedName}_meanConnZR.nii.gz
