#Get the masked asl data filenames for MIDAS.

cat /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1029_aslVox11andUp_scanids.csv | while IFS="," read -r a ;

do 

path=`ls -d /data/joy/BBL/projects/pncAslAcrossDisorder/images/maskedAslForMIDAS/${a}_asl_quant_ssT1Std_masked.nii.gz`;

#get just the file name without the path: first echo the path (echo $i), then cut the path up by delimiter "/" (-d'/'), then take the 9th field (-f9), which is the file name.

        fileName=$(echo $path | cut -d'/' -f9 )
        echo "File name is $fileName"


echo $fileName >> /data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1029_aslFileNamesForMIDAS.csv

done

