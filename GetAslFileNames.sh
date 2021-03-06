#Get the masked asl data filenames for NMF (proband sample only).

cat /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1029_aslVox11andUp_scanids.csv | while IFS="," read -r a ;

do 

path=`ls -d /data/joy/BBL/studies/pnc/n1601_dataFreeze2016/neuroimaging/asl/voxelwiseMaps_cbf/${a}_asl_quant_ssT1Std.nii.gz`;

#get just the file name without the path: first echo the path (echo $i), then cut the path up by delimiter "/" (-d'/'), then take the 11th field (-f11), which is the file name.

        fileName=$(echo $path | cut -d'/' -f11 )
        echo "File name is $fileName"


echo $fileName >> /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1029_aslFileNames.csv

done

