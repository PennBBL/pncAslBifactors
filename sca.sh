#!/usr/bin/env bash

###################################################################
#  ☭  ☭  ☭  ☭  ☭  ☭  ☭  ☭  ☭  ☭  ☭  ☭  ☭  ☭  ☭  ☭  ☭  ☭  ☭  ☭  ☭  #
###################################################################

###################################################################
# First input is subject identification, provided by uniquify
ident=$1
SCRIPTDIR=/import/monstrum2/Users/rastko/amygdala
SIGMA=2.35482004503
###################################################################


###################################################################
# Parse subject identification
bblid=$(echo ${ident}|cut -d"," -f1)
scanid=$(echo ${ident}|cut -d"," -f2)
date=$(echo ${ident}|cut -d"," -f3)
prestats=$(echo ${ident}|cut -d"," -f4)
coreg=$(echo ${ident}|cut -d"," -f5)
seg=$(echo ${ident}|cut -d"," -f6)
confreg=$(echo ${ident}|cut -d"," -f7)
rehodir=$(echo ${ident}|cut -d"," -f8)
printf ${bblid}::
###################################################################

AMYGVAL=32
out=${SCRIPTDIR}/scaOut/${bblid}_${scanid}
rm -rf ${out}
[[ ! -d ${out} ]] && mkdir -p ${out}

###################################################################
# Obtain multiatlas labels in MNI space, and extract the left
# amygdala seed
###################################################################
printf map::
malabels=${rehodir}/labels_ep
#malabels=${rehodir}/labels_rpi
normdir=$(echo ${seg}|rev|cut -d"/" -f1 --complement|rev)
rigid=$(\ls ${normdir}/*brain*0DerivedInitialMovingTranslation.mat)
affine=$(\ls ${normdir}/*brain*1Affine.mat)
warp=$(\ls ${normdir}/*brain*2Warp.nii.gz)
#/import/monstrum/Applications/statapps/ANTs/bin/antsApplyTransforms \
#   -n NearestNeighbor \
#   -e 3 -d 3 \
#   -i ${malabels}.nii.gz \
#   -o ${out}/mars_mni.nii.gz \
#   -r /import/monstrum/Applications/fsl5/data/standard/MNI152_T1_2mm_brain.nii.gz \
#   -t ${warp} \
#   -t ${affine} \
#   -t ${rigid}
#malabels=${out}/mars_mni
fslmaths ${malabels} \
   -thr ${AMYGVAL} \
   -uthr ${AMYGVAL} \
   -bin \
   ${out}/amygdala

###################################################################
# Move into MNI space
###################################################################
#printf xfm::
ep2struct=""
ep2struct=$(\ls ${coreg}/bbr_dico/ep2struct.mat)
[[ -z ${ep2struct} ]] && ep2struct=$(\ls ${coreg}/bbr_nodico/ep2struct.mat)
[[ -z ${ep2struct} ]] && ep2struct=$(\ls ${coreg}/*example_func2highres.mat)
c3d_affine_tool \
   -src ${prestats}/example_func.nii.gz \
   -ref ${normdir}/*mprage_rs.nii.gz \
   ${ep2struct} \
   -fsl2ras \
   -oitk ${out}/ep2struct.txt
ep2struct=${out}/ep2struct.txt
#/import/monstrum/Applications/statapps/ANTs/bin/antsApplyTransforms \
#   -e 3 -d 3 \
#   -i ${confreg}/${bblid}_${scanid}.nii.gz \
#   -o ${out}/${bblid}_${date}x${scanid}_mni.nii.gz \
#   -r /import/monstrum/Applications/fsl5/data/standard/MNI152_T1_2mm_brain.nii.gz \
#   -t ${warp} \
#   -t ${affine} \
#   -t ${rigid} \
#   -t ${ep2struct}
#/import/monstrum/Applications/statapps/ANTs/bin/antsApplyTransforms \
#   -e 3 -d 3 \
#   -i ${prestats}/example_func.nii.gz \
#   -o ${out}/${bblid}_${date}x${scanid}_xfunc.nii.gz \
#   -r /import/monstrum/Applications/fsl5/data/standard/MNI152_T1_2mm_brain.nii.gz \
#   -t ${warp} \
#   -t ${affine} \
#   -t ${rigid} \
#   -t ${ep2struct}
#/import/monstrum/Applications/statapps/ANTs/bin/antsApplyTransforms \
#   -n NearestNeighbor \
#   -e 3 -d 3 \
#   -i ${prestats}/mask.nii.gz \
#   -o ${out}/${bblid}_${date}x${scanid}_mask.nii.gz \
#   -r /import/monstrum/Applications/fsl5/data/standard/MNI152_T1_2mm_brain.nii.gz \
#   -t ${warp} \
#   -t ${affine} \
#   -t ${rigid} \
#   -t ${ep2struct}

###################################################################
# Mean timeseries
###################################################################
printf ts::
fslmeants -i ${confreg}/${bblid}_${scanid} \
   -m ${out}/amygdala \
   -o ${out}/amygdala_ts.1D

###################################################################
# Spatial smoothing: kernel 6mm
###################################################################
printf smo::
kernel=$(echo 6 $SIGMA|awk '{print $1/$2}')
usan=$(\ls -d1 ${prestats}/example_func.nii.gz)
mask=$(\ls -d1 ${prestats}/mask.nii.gz)
smo=${out}/${bblid}_${date}x${scanid}_sm6
perc50=$(fslstats ${usan} \
   -k ${mask} \
   -p 50)
bt=$(echo ${perc50}|awk '{print $1*3/4}')
susan \
      ${confreg}/${bblid}_${scanid} \
      ${bt} \
      ${kernel} \
      3 1 1 \
      ${usan} \
      ${bt} \
      ${smo}

###################################################################
# Seed-based correlation analysis
###################################################################
printf sca::
rm -f ${out}/${bblid}_${date}x${scanid}_lAmygdala_r_sca.nii.gz
3dfim+ \
   -input ${smo}.nii.gz \
   -ideal_file ${out}/amygdala_ts.1D \
   -out Correlation \
   -bucket ${out}/${bblid}_${date}x${scanid}_lAmygdala_r_sca.nii.gz \
   2> /dev/null

###################################################################
# z-score
###################################################################
rm -f ${out}/${bblid}_${date}x${scanid}_lAmygdala_z_sca.nii.gz
3dcalc \
   -a ${out}/${bblid}_${date}x${scanid}_lAmygdala_r_sca.nii.gz \
   -expr 'log((a+1)/(a-1))/2' \
   -prefix ${out}/${bblid}_${date}x${scanid}_lAmygdala_z_sca.nii.gz \
   2> /dev/null

###################################################################
# Move into MNI space
###################################################################
/import/monstrum/Applications/statapps/ANTs/bin/antsApplyTransforms \
   -n NearestNeighbor \
   -e 3 -d 3 \
   -i ${out}/${bblid}_${date}x${scanid}_lAmygdala_r_sca.nii.gz \
   -o ${out}/${bblid}_${date}x${scanid}_lAmygdala_r_sca_mni.nii.gz \
   -r /import/monstrum/Applications/fsl5/data/standard/MNI152_T1_2mm_brain.nii.gz \
   -t ${warp} \
   -t ${affine} \
   -t ${rigid} \
   -t ${ep2struct}
/import/monstrum/Applications/statapps/ANTs/bin/antsApplyTransforms \
   -n NearestNeighbor \
   -e 3 -d 3 \
   -i ${out}/${bblid}_${date}x${scanid}_lAmygdala_z_sca.nii.gz \
   -o ${out}/${bblid}_${date}x${scanid}_lAmygdala_z_sca_mni.nii.gz \
   -r /import/monstrum/Applications/fsl5/data/standard/MNI152_T1_2mm_brain.nii.gz \
   -t ${warp} \
   -t ${affine} \
   -t ${rigid} \
   -t ${ep2struct}
echo END
