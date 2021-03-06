#re-mask the rest coverage mask by a liberal gm mask (for use with connectivity analyses)

#masks                                                                                                                                                                           
maskName=/data/joy/BBL/studies/pnc/n1601_dataFreeze2016/neuroimaging/rest/n1601_RestCoverageMask.nii.gz
gmMask=/data/joy/BBL/studies/pnc/n1601_dataFreeze2016/neuroimaging/pncTemplate/priors/prior_grey_thr01_2mm.nii.gz

echo "Mask name is $maskName"

echo ""

#this is where the output mask goes                                                                                                                                              
outdir=/data/joy/BBL/projects/pncAslAcrossDisorder/images

echo "outdir is $outdir"

echo ""

fslmaths ${maskName} -mas ${gmMask} ${outdir}/n1601_RestCoverageMask_GM.nii.gz
