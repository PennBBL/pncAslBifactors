#Split the res4D.nii.gz file into separate files for each subject. 

#This is the res4D.nii.gz file that outputs from the flameo wrapper.
res4Dfile=/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1029_AslPath/age_sex_pcaslRelMeanRMSMotion/res4d.nii.gz

echo "res4D name is $res4Dfile"

echo ""

#Outdir for the individual res4D files for each subject.                                                                                                                                                          
outdir=/data/joy/BBL/projects/pncAslAcrossDisorder/images/res4dFiles

echo "outdir is $outdir"

echo ""

#Split the file (this creates generic numbered filenames)
fslsplit ${res4Dfile} ${outdir}/res4d -t

#Create a text file with the res4d filenames
cd $outdir
ls *.nii.gz > n1029_res4d_filenames.txt

#Define file locations
bblids=/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1029_AslPath/bblids.txt

echo "bblid filename is $bblids"

res4ds=/data/joy/BBL/projects/pncAslAcrossDisorder/images/res4dFiles/n1029_res4d_filenames.txt

echo "res4D filename is $res4ds"

#Combine the bblids and res4d filenames into a single file
paste -d, $bblids $res4ds > $outdir/n1029_bblids_res4d.csv
