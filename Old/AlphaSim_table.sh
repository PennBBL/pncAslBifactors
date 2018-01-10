#After running voxelwise analyses, run this script to get the table which you will use to find the minimum cluster size that corresponds to your desired alpha level

##CHOOSE ONE

#p=.01 (z=2.33)

#AlphaSim -mask /import/monstrum2/Users/antoniak/PNC_asl/voxelwise_analyses/n875_cbf.paths.ants/mask.nii.gz -pthr 0.01 -iter 10000 -fwhm 6 -out /import/monstrum2/Users/antoniak/PNC_asl/voxelwise_analyses/n875_cbf.paths.ants/n875_AlphaSim_p01_iter10000.txt


#p=.005 (z=2.58)
#NOTE: I used this for the final analyses because the left amygdala was looking like one big cluster reaching back into the occipital lobe, so I used a more stringent p-value to get proper cluster separation (and because I found that z=3.09/p=.001 was too stringent).

AlphaSim -mask /data/joy/BBL/projects/pncT1AcrossDisorder_Kaczkurkin/masks/n1895_inc1829_bin_gm_mask.nii.gz -pthr 0.005 -iter 10000 -fwhm 6 -out /data/joy/BBL/projects/pncT1AcrossDisorder_Kaczkurkin/aslResults/n1274_aslPath_ACROSS.INCLUDE_smooth0/n1274_AlphaSim_p005_iter10000.txt


#p=.001 (z=3.09)

#AlphaSim -mask /import/monstrum2/Users/antoniak/PNC_asl/voxelwise_analyses/n875_cbf.paths.ants/mask.nii.gz -pthr 0.001 -iter 10000 -fwhm 6 -out /import/monstrum2/Users/antoniak/PNC_asl/voxelwise_analyses/n875_cbf.paths.ants/n875_AlphaSim_p001_iter10000.txt


#Another option

#3dClustSim -mask /import/monstrum2/Users/antoniak/PNC_asl/voxelwise_analyses/n875_cbf.paths.ants/mask.nii.gz -pthr LOTS -athr .05 .01 .005 .001 .0005 .0001 .00005 .00001 -iter 10000 -fwhm 6


#Connectivity analyses:
#too stringent
#AlphaSim -mask /import/monstrum2/Users/antoniak/PNC_asl/voxelwise_analyses/n875_cbf.paths.ants/maskBin.nii.gz -pthr 0.005 -iter 10000 -fwhm 6 -out /import/monstrum2/Users/antoniak/PNC_asl/voxelwise_analyses/n875_cbf.paths.ants/n592_AlphaSim_p005_iter10000.txt

AlphaSim -mask /import/monstrum2/Users/antoniak/PNC_asl/voxelwise_analyses/n875_cbf.paths.ants/maskBin.nii.gz -pthr 0.01 -iter 10000 -fwhm 6 -out /import/monstrum2/Users/antoniak/PNC_asl/voxelwise_analyses/n875_cbf.paths.ants/n592_AlphaSim_p01_iter10000.txt





