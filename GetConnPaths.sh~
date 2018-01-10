#Get the connectivity data file paths to merge with the subject-level data file.

cat /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n833_connVox11andUp_bblids_scanids.csv | while IFS="," read -r a b ;

do

path=`ls -d /data/joy/BBL/projects/pncReproc2015/restbold/kaczkurkinAslSeeds/seedmaps/${a}_*x${b}_sca_zr_dorsalACCStd.nii.gz`;

echo $a,$path >> /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n833_dorsalACC_conPaths.csv

path2=`ls -d /data/joy/BBL/projects/pncReproc2015/restbold/kaczkurkinAslSeeds/seedmaps/${a}_*x${b}_sca_zr_rostralACCStd.nii.gz`;

echo $a,$path2 >> /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n833_rostralACC_conPaths.csv

done
