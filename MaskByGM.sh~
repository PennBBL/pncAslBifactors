#re-mask the asl coverage mask by a liberal gm mask 

#masks                                                                                                                                                                           
maskName=/data/joy/BBL/studies/pnc/n1601_dataFreeze2016/neuroimaging/asl/n1601_PcaslCoverageMask.nii.gz
gmMask=/data/joy/BBL/studies/pnc/n1601_dataFreeze2016/pncTemplate/priors/prior_grey_thr01_2mm.nii.gz #STILL THIS LOCATION?

echo "Mask name is $maskName"

echo ""

#this is where the output mask goes                                                                                                                                              
outdir=/data/joy/BBL/projects/pncT1AcrossDisorder_ASL/images

echo "outdir is $outdir"

echo ""

fslmaths ${maskName} -mas ${gmMask} ${outdir}/n1601_PcaslCoverageMask_GM.nii.gz
