####################
#### PARAMETERS ####
####################

#Subject-level data
rds.name<-"/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1029_JLF_aslVox11andUp_subjData_aslPaths.rds"

#Imaging modality
modality<-"ASL"

#Specify all variables that will be in the model for both naming and model inclusion (but no interaction terms).
variables<-c( "age","sex","pcaslRelMeanRMSMotion")

#Define your model
lin.mod<-"~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion"

#Define the inclusion code
subject.include="ACROSS.INCLUDE"

#Smoothing (KEEP THIS SET TO 0 FOR ASL DATA)
odvba<- 0 


##################

if (modality=="GMD"){
  image.exclude<-"T1_EXCLUDE"  #imaging exclusion criteria
  img<-"mico.gmd"  #this is the column in the RDS where have list of paths to images-- need to change this to do WM also
  smoothing<- 3.4 #smooths the merged TS before running model- in sigma
  mask<-"/import/speedy/eons/group_results_n1445/structural/ravens/dramms_ravens_mask_2mm.nii.gz"
  outroot<-"/import/speedy/eons/group_results_n1445/structural/ravens/voxelwise_analyses/" }

if (modality=="JAC"){
  image.exclude<-"T1_EXCLUDE"  #imaging exclusion criteria
  img<-"dramms.jac"  #this is the column in the RDS where have list of paths to images-- need to change this to do WM also
  smoothing<- 3.4 #smooths the merged TS before running model- in sigma
  mask<-"/import/speedy/eons/group_results_n1445/structural/ravens/dramms_ravens_mask_2mm.nii.gz"
  outroot<-"/import/speedy/eons/group_results_n1445/structural/ravens/voxelwise_analyses/" }

if (modality=="GMD.MOD"){
  image.exclude<-"T1_EXCLUDE"  #imaging exclusion criteria
  img<-"gmd.mod"  #this is the column in the RDS where have list of paths to images-- need to change this to do WM also
  smoothing<- 3.4 #smooths the merged TS before running model- in sigma
  mask<-"/import/speedy/eons/group_results_n1445/structural/ravens/dramms_ravens_mask_2mm.nii.gz"
  outroot<-"/import/speedy/eons/group_results_n1445/structural/ravens/voxelwise_analyses/" }

if (modality=="RAVENS.GM"){  
  image.exclude<-"T1_EXCLUDE"  #imaging exclusion criteria
  img<-"ravensGM.paths"  #this is the column in the RDS where have list of paths to images-- need to change this to do WM also
  smoothing<- 2.54 #smooths the merged TS before running model- in sigma
  mask<-"/import/speedy/eons/group_results_n1445/structural/ravens/dramms_ravens_mask_2mm.nii.gz"
  outroot<-"/import/speedy/eons/group_results_n1445/structural/ravens/voxelwise_analyses/" }

if (modality=="RAVENS.WM"){
  image.exclude<-"T1_EXCLUDE"  #imaging exclusion criteria
  img<-"ravensWM.paths"  #this is the column in the RDS where have list of paths to images-- need to change this to do WM also
  smoothing<-2.54 #smooths the merged TS before running model- in sigma
  mask<-"/import/monstrum/eons_xnat/sbia/MPRAGE/dramms_ravens_template_mask_2mm.nii.gz"
  outroot<-"/import/speedy/eons/group_results_n1445/structural/ravens/voxelwise_analyses/" }

if (modality=="DTITK"){
  image.exclude<-"DTITK_T1_EXCLUDE"  #imaging exclusion criteria
  img<-"dtitk.paths"  #this is the column in the RDS where have list of paths to images-- need to change this to do WM also
  smoothing<-2.54 #smooths the merged TS before running model- in sigma
  mask<-"/import/speedy/eons/progs/DTI/bbl_dti/mean_FA/mean_final_gold_high_res_ALL_fa_740_2mm_thr10.nii.gz"
  outroot<-"/import/speedy/eons/group_results_n1445/DTI/voxelwise_analyses/" }


if (modality=="DTI.FA"){
  image.exclude<-"DTI_T1_EXCLUDE"  #imaging exclusion criteria
  img<-"fa.paths"  #this is the column in the RDS where have list of paths to images-- need to change this to do WM also
  smoothing<-2.54 #smooths the merged TS before running model- in sigma
  mask<-"/import/speedy/eons/group_results_n1445/DTI/masks/FMRIB58_FA_2mm_eons_thr2000_cov_final.nii.gz"
  outroot<-"/import/speedy/eons/group_results_n1445/DTI/voxelwise_analyses/" }

if (modality=="DTI.MD"){
  image.exclude<-"DTI_T1_EXCLUDE"  #imaging exclusion criteria
  img<-"md.paths"  #this is the column in the RDS where have list of paths to images-- need to change this to do WM also
  smoothing<-2.54 #smooths the merged TS before running model- in sigma
  mask<-"/import/speedy/eons/group_results_n1445/DTI/masks/n1105_md_mask_final.nii.gz"                            #MD
  outroot<-"/import/speedy/eons/group_results_n1445/DTI/voxelwise_analyses/" }

if (modality=="ASL"){
  image.exclude<-"pcaslExclude"  #imaging exclusion criteria
  img<-"AslPath"   #paths to images
  smoothing<-0 #NOTE THAT ASL IS ALREADY SMOOTHED!!!
  mask<-"/data/joy/BBL/projects/pncAslAcrossDisorder/images/n1601_PcaslCoverageMask_GM.nii.gz"        #ASL
  outroot<-"/data/joy/BBL/projects/pncAslAcrossDisorder/results/" }

if (modality=="REHO"){
  image.exclude<-"RESTBOLD_T1_EXCLUDE"  #imaging exclusion criteria
  img<-"reho.paths"  #this is the column in the RDS where have list of paths to images-- need to change this to do WM also
  smoothing<-2.54 #smooths the merged TS before running model- in sigma
  mask<-"/import/speedy/eons/group_results_n1445/restbold/masks/restbold_n1168_mask_final_eons2mm.nii.gz"                 #reho
  outroot<-"/import/speedy/eons/group_results_n1445/restbold/reho/voxelwise_analyses/" }


if (modality=="F2B"){
  image.exclude<-"F2B_T1_EXCLUDE"  #imaging exclusion criteria
  img<-"f2b.cope.paths"  #this is the column in the RDS where have list of paths to images-- need to change this to do WM also
  imgvc<-"f2b.varcope.paths"
  smoothing<-0 #smooths the merged TS before running model- in sigma
  mask<-"/import/monstrum/Users/sheilash/frac2back_2014summer/frac2back_n951_final_maskoverlap.nii.gz"
  outroot<-"/import/speedy/eons/group_results_n1445/frac2back/voxelwise_analyses/" }

##############



###load data & subset
if (modality != "F2B"){
  cols<-c("bblid",variables,img)
  data.in<-readRDS(rds.name)
  cat("subsetting data by inclusion criteria of",subject.include,"& QA exclusion criteria of",image.exclude,'\n')
  data.subset<-data.in[data.in[[image.exclude]]==0 & data.in[[subject.include]]==1,cols] 
}

if (modality=="F2B"){
  cols<-c("bblid",variables,img,imgvc)
  data.in<-readRDS(rds.name)
  data.subset<-data.in[data.in[[image.exclude]]==0 & data.in[[subject.include]]==1,cols]
}

#check that all cases complete
numsubj<-dim(data.subset)[1]
numcomplete<-sum(complete.cases(data.subset))

if (numcomplete != numsubj){
  cat("some data is missing!","\n")
  numsubj<-numcomplete
  data.subset<-data.subset[complete.cases(data.subset),]
} else {
  cat("all subjects have complete data","\n")
}

#get naming for and create output directory
subjcount<-paste("n",numsubj,sep="")
outname<-paste(subjcount,img,sep="_")

outdir<-paste(outroot,outname,sep="/")  #outdir is the base directory where the mask and 4d image are saved; these are model-invariant
if (smoothing>0){
  outdir<-paste(outdir,"smooth",smoothing,sep="_")
}
resultsdir<-paste(outdir,paste(variables,collapse="_"),sep="/")    #results dir is the subdirectory where the model and stats are saved; this can vary by model chosen
dir.create(outdir)
dir.create(resultsdir)
here<-getwd()
setwd(resultsdir)


#write out image and subject list to output directory for logging
bblid.list<-data.subset$bblid
image.list<-data.subset[[img]]
write.table(bblid.list,"bblids.txt",col.names=FALSE,row.names=FALSE,quote=FALSE)
write.table(image.list,"images.txt",col.names=FALSE,row.names=FALSE,quote=FALSE)

if (modality=="F2B"){
  image.list.varcope<-data.subset[[imgvc]]
  write.table(image.list.varcope,"images.varcope.txt",col.names=FALSE,row.names=FALSE,quote=FALSE)
}

## CREATE FSL DESIGN FILES ##
#############################
file<-resultsdir  #to be consistent w/ prior naming  #note this will put all files into resultsdir; copy certain ones like bblids, images, 4d file, mask back up
# design matrix is X
cat("\n","output directory is ",file,"\n")

X<-model.matrix(as.formula(lin.mod) , data=data.subset)
#suppressWarnings(X<-cbind(X, c(0,1))) # c(0,1) gets recycled truncated for odd number of rows.

# peak to peak heights. Don't think this is used for group analyses.
# ppheights<-apply(X,2,function(x) range(x)[2]-range(x)[1])


### CREATE DESIGN.MAT FILE ###
##############################
filet=file.path(file, 'design.mat')
cat('/NumWaves\t', (ncol(X)), '\n', sep='', append=F, file=filet)
cat('/NumPoints\t', (nrow(X)), '\n', sep='', append=T, file=filet)
#cat('/PPheights\t', ppheights, '\n\n', sep='\t', append=T, file=filet)
cat('/Matrix\n', sep='', append=T, file=filet)
write.table(X, row.names=F, col.names=F, append=T, file=filet)

###  CREATE THE CONTRASTS FILE ###
##################################
# diagonal contrast matrix. you would
# need to edit this if you had factors
# with more than 2 levels.
filet=file.path(file, 'design.con')
cat('/ContrastName1','\t',colnames(X)[1],'\n',append=F,file=filet,sep="")
for (i in seq(2,ncol(X))){
  cat('/ContrastName',i,'\t',colnames(X)[i],'\n',append=T,file=filet,sep="")
}
cat('/NumWaves\t', ncol(X), '\n', sep='', append=T, file=filet) # ifelse(is.na(gmc) | gmc==0, ncol(X), (ncol(X)+1))
cat('/NumContrasts\t', ncol(X), '\n', sep='', append=T, file=filet)
cat('/PPheights\t', paste(rep(1, ncol(X)),collapse='\t'), '\n\n', sep='', append=T, file=filet)
cat('/Matrix\n', sep='', append=T, file=filet)
write.table(diag(rep(1, ncol(X))) , row.names=F, col.names=F, append=T, file=filet)

### CREATE THE FTEST FILE ###
#############################
# diagonal contrast matrix, except the intercept.
filet=file.path(file, 'design.fts')
cat('/NumWaves\t', ncol(X), '\n', sep='', append=F, file=filet)
cat('/NumContrasts\t', (ncol(X)-1), '\n\n', sep='', append=T, file=filet)
cat('/Matrix\n', sep='', append=T, file=filet)
write.table(cbind(0,diag(rep(1, (ncol(X)-1) ))), row.names=F, col.names=F, append=T, file=filet)

### CREATE GRP FILE ###
#######################
# all the same group. Would have to modify this
# for more unequal group variances.
filet=file.path(file, 'design.grp')
cat('/NumWaves\t1\n', sep='', append=F, file=filet)
cat('/NumPoints\t', nrow(X), '\n', sep='', append=T, file=filet)
cat('/Matrix\n', sep='', append=T, file=filet)
cat(rep(1,nrow(X)),sep='\n', append=T, file=filet)

### COPY MASK AND THIS PROGRAM TO OUTPUT DIRECTORY ###
#######################
this.file<- parent.frame(2)$ofile
file.copy(this.file,resultsdir)
maskout<-paste(resultsdir,"mask.nii.gz",sep="/")
maskout
file.copy(mask,maskout)


### MERGE TO 4D FILE ###
#######################
merge.check<-Sys.glob("../fourd.nii.gz")
if (length(merge.check)>0){
  cat("\n","merged images present","\n")
  file.copy("../fourd.nii.gz",resultsdir)
} else {
  cat("\n", "now merging cope images","\n")
  system("fslmerge -t fourd $(cat images.txt)")
  
  if (modality=="F2B"){
    cat("\n","now merging varcope images", "\n")
    system("fslmerge -t fourd.varcope $(cat images.varcope.txt)")
  }
  
  if (smoothing>0){
    cat("\n", "using smoothed images","\n")
    cat("\n", "now smoothing images","\n")
    system(paste("fslmaths fourd.nii.gz -s ",smoothing," fourd",sep=""))
  }
}

cat("\n", "now running flameo","\n")


if (modality=="F2B"){
    cat("\n","now running flameo on f2b copes and varcopes", "\n")
    system("flameo --cope=fourd.nii.gz --mask=mask.nii.gz --dm=design.mat --tc=design.con --cs=design.grp  --runmode=flame1 --varcope=fourd.varcope.nii.gz --ld=logdir")  
} else{
    cat("\n","now running flameo", "\n")
    system("flameo --cope=fourd.nii.gz --mask=mask.nii.gz --dm=design.mat --tc=design.con --cs=design.grp  --runmode=ols --ld=logdir")
}



#move general files back to higher level
system("mv mask.nii.gz ..")
system("mv fourd.nii.gz ..")
system("mv bblids.txt ..")
system("mv images.txt ..")

if(modality=="F2B"){
  system("mv fourd.varcope.nii.gz ..")
  system("mv images.varcope.txt ..")
}

#move images from logdir to resutlsdir
system("cp logdir/* .")
system("rm -rf logdir*")


#ODVBA SPECIFIC PROCESSING

if (odvba==1){
         cat("\n", "***PREPARING FILES FOR ODVBA","\n")

	 pstd.odvba<-data.in[data.in[[image.exclude]]==0 & data.in[[subject.include]]==1,c("PSTD.FINAL.gt11", "bblid")]

	 data.odvba.tmp<-merge(data.subset,pstd.odvba,by="bblid")

	 vol.list<-read.table("/import/speedy/eons/progs/group_analysis_scripts/misc/vol_list.txt",header=FALSE)
	 vol.list<-vol.list[1:numsubj,]
	 names(vol.list)[1]<-"vols"
	 vol.ids<-read.table("../bblids.txt")
	 names(vol.ids)[1]<-"bblid"
	 vol.df<-cbind(vol.ids,vol.list)

	 data.odvba<-merge(data.odvba.tmp,vol.df, by="bblid")

	 data.odvba$pstd.numeric<-as.numeric(data.odvba$PSTD.FINAL.gt11)

	 data.odvba.tdps<-data.odvba[order(data.odvba$pstd.numeric),]
	 tdps.vols<-data.odvba.tdps$vol.list

         data.odvba.pstd<-data.odvba[order(-data.odvba$pstd.numeric),]
         pstd.vols<-data.odvba.pstd$vol.list

	 numtd<-sum(data.odvba$pstd.numeric==1)
	 numps<-sum(data.odvba$pstd.numeric==2)
	 numtdps<-paste(numtd,numps)
	 numpstd<-paste(numps,numtd)

	 sbiaout<-paste("/sbia/home/sattertt",outname,"images",sep="/")

	 write.table(numtdps,"tdps_subj.txt",col.names=FALSE,row.names=FALSE,quote=FALSE)
         write.table(sbiaout,"tdps_subj.txt",col.names=FALSE,row.names=FALSE,append=TRUE,quote=FALSE)
	 cat("\n",file="tdps_subj.txt",append=TRUE)
         write.table(tdps.vols,"tdps_subj.txt",col.names=FALSE,row.names=FALSE,append=TRUE,quote=FALSE)

         write.table(numpstd,"pstd_subj.txt",col.names=FALSE,row.names=FALSE,quote=FALSE)
         write.table(sbiaout,"pstd_subj.txt",col.names=FALSE,row.names=FALSE,append=TRUE,quote=FALSE)
         cat("\n",file="pstd_subj.txt",append=TRUE)
         write.table(pstd.vols,"pstd_subj.txt",col.names=FALSE,row.names=FALSE,append=TRUE,quote=FALSE)

	if (modality!="ASL"){
		smooth.check<-Sys.glob("res4d_s084.nii.gz")  #note smoothing here is hard coded
		if (length(smooth.check)==0){
          		cat("\n", "now smoothing residual images","\n")
		        system("fslmaths res4d.nii.gz -s 0.84 res4d_s084")
		}
        split.dir<-paste(resultsdir,"split_images",sep="/")
        dir.create(split.dir)
        setwd(split.dir)

        cat("\n", "now splitting smoothed residual images","\n")
        system("fslsplit ../res4d_s084.nii.gz")
	}

	if (modality=="ASL"){
        	split.dir<-paste(resultsdir,"split_images",sep="/")
	        dir.create(split.dir)
        	setwd(split.dir)

	        cat("\n", "now splitting residual ASL images","\n")
	        system("fslsplit ../res4d.nii.gz")
        }

}



setwd(here)
