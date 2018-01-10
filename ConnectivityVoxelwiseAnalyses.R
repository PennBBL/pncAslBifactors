#############################
### CONNECTIVITY ANALYSES ###
#############################

##This script will run the linear model on the connectivity files created by Rastko.

##YOU WILL NEED:
#1) A 4d merged file of images
#2) A mask image
#3) A list of bblids (needs to be in exact same order as 4d file)
#4) An .rds with subject-level data

#################
### VARIABLES ###
#################
subjDataName<-"/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_JLF_aslVox11andUp_subjData_clusters.rds"  #this is the RDS for your subject data
outDirRoot<-"/data/joy/BBL/projects/pncAslAcrossDisorder/results/n976_AslBifactorsConnectivity"  #this is where it will look for the 4d file, mask, and bblids list
outName<-"CON_age_sex_AgeBySex_restMotion_Bifactors" #what you want your ouput directory to be named-- include covariates in name

###FIND PATHS TO FILES### 
#########################
conImageName<-paste(outDirRoot,"mergedCorrZ.nii.gz",sep="/")
imageIds<-paste(outDirRoot,"n592_connectivity_bblids.txt",sep="/")
maskName<-paste(outDirRoot,"maskBin.nii.gz",sep="/")


###LOAD SUBJECT DATA###
#######################
subjDataIn<-readRDS(subjDataName)
subjs<-read.table(imageIds)
subjDataSubset<-subjDataIn[subjDataIn$bblid %in% subjs$V1,]  #subsetting the subject data by those in the linear voxelwise analysis

#check ordering of subjects
subjData<-subjDataSubset[order(subjDataSubset$bblid),]  #assumes that images are ordered by ID

#check versus subject list
if(!identical(subjs$V1,subjData$bblid)){
	print("subjectIds not matched-- ERROR!!!")
	stop()
}

###RENAME CERTAIN VARIABLES###
##############################
subjData$restMotion<-subjData$restEpi10qaMeanrelrms

###MAKE OUTPUT DIRECTORIES####
##############################
outDir<-paste(outDirRoot,outName,sep="/")
logDir<-paste(outDirRoot,"logs",sep="/")
dir.create(outDir, showWarnings = FALSE)
dir.create(logDir, showWarnings = FALSE)

###ECHO ARGUMENTS###
####################
print("Arguments are:")
print(paste("subject data is:",subjDataName))
print(paste("input images are:",conImageName))
print(paste("mask is:",maskName))
print(paste("ouput directory is:",outDir))
print(paste("log directory is:",logDir))


###cleanup logdir
system(paste('rm -f', file.path(logDir, '*')))


### LIBRARIES ###
#################
library(ANTsR)  #for ANTS -- critical for loading images
library(mgcv) #for nonlinear analyses


###LOAD DATA###
##############
#antsR webpage is helpful for this
mask<-antsImageRead(maskName,3) #3=3d
conImageIn<-antsImageRead(conImageName,4) #4=4d (bc this is the 4d file of connectivity images)
conImageMat<-timeseries2matrix(conImageIn,mask) #reshape to a matrix
 

###PREALLOCATE OUTPUT###
########################
pOutState<-matrix(NA,nrow=dim(conImageMat)[2],ncol=1)
tOutState<-matrix(NA,nrow=dim(conImageMat)[2],ncol=1) 

pOutTrait<-matrix(NA,nrow=dim(conImageMat)[2],ncol=1)
tOutTrait<-matrix(NA,nrow=dim(conImageMat)[2],ncol=1)

pOutMotion<-matrix(NA,nrow=dim(conImageMat)[2],ncol=1)
tOutMotion<-matrix(NA,nrow=dim(conImageMat)[2],ncol=1)

pOutSex<-matrix(NA,nrow=dim(conImageMat)[2],ncol=1)
tOutSex<-matrix(NA,nrow=dim(conImageMat)[2],ncol=1)

pOutAge<-matrix(NA,nrow=dim(conImageMat)[2],ncol=1)
tOutAge<-matrix(NA,nrow=dim(conImageMat)[2],ncol=1)


###LOOP THROUGH MODELS###
########################
timeOn<-proc.time() # keeps track of time. 

for(i in 1:dim(conImageMat)[2]){
	print(i)
	#Run first without the pOut and tOut commands (don't need to let it finish all subjects- let it run for about a minute and the use CNTRL-C to stop)
	#Then look at lmSummary to get the correct p and t column/row numbers from the coefficent table for the pOut and tOut commands (check with lmSummary$coefficients[?,?])
	
	#Specify model below (don't need to specify main effects if have interaction already in the model)
	lmSummary<-summary(lm(conImageMat[,i]~age + sex + restMotion + State_General_12 + Trait_General_12, data=subjData))

	###NOTE!!!: anytime you adjust your model order, variables, or syntax-- will need to update where in coefficient table you are pulling
	pOutState[i,1]<-lmSummary$coefficients[5,4] #pval 
        tOutState[i,1]<-lmSummary$coefficients[5,3] #tval
	
	pOutTrait[i,1]<-lmSummary$coefficients[6,4] #pval
        tOutTrait[i,1]<-lmSummary$coefficients[6,3] #tval
 
	pOutMotion[i,1]<-lmSummary$coefficients[4,4] #pval
        tOutMotion[i,1]<-lmSummary$coefficients[4,3] #tval

        pOutSex[i,1]<-lmSummary$coefficients[3,4] #pval
        tOutSex[i,1]<-lmSummary$coefficients[3,3] #tval

        pOutAge[i,1]<-lmSummary$coefficients[2,4] #pval
	tOutAge[i,1]<-lmSummary$coefficients[2,3] #tval
}
	
loopTime<-proc.time()-timeOn


###WRITE OUT IMAGE###
####################

pOutStateImage<-antsImageClone(mask)
tOutStateImage<-antsImageClone(mask)
pOutStateImage[mask==1]<-pOutState
tOutStateImage[mask==1]<-tOutState

setwd(outDir)
antsImageWrite(pOutStateImage,"lmP_State.nii.gz")
antsImageWrite(tOutStateImage,"lmT_State.nii.gz")

pOutTraitImage<-antsImageClone(mask)
tOutTraitImage<-antsImageClone(mask)
pOutTraitImage[mask==1]<-pOutTrait
tOutTraitImage[mask==1]<-tOutTrait

setwd(outDir)
antsImageWrite(pOutTraitImage,"lmP_Trait.nii.gz")
antsImageWrite(tOutTraitImage,"lmT_Trait.nii.gz")

pOutMotionImage<-antsImageClone(mask)
tOutMotionImage<-antsImageClone(mask)
pOutMotionImage[mask==1]<-pOutMotion
tOutMotionImage[mask==1]<-tOutMotion

setwd(outDir)
antsImageWrite(pOutMotionImage,"lmP_Motion.nii.gz")
antsImageWrite(tOutMotionImage,"lmT_Motion.nii.gz")

pOutSexImage<-antsImageClone(mask)
tOutSexImage<-antsImageClone(mask)
pOutSexImage[mask==1]<-pOutSex
tOutSexImage[mask==1]<-tOutSex

setwd(outDir)
antsImageWrite(pOutSexImage,"lmP_Sex.nii.gz")
antsImageWrite(tOutSexImage,"lmT_Sex.nii.gz")

pOutAgeImage<-antsImageClone(mask)
tOutAgeImage<-antsImageClone(mask)
pOutAgeImage[mask==1]<-pOutAge
tOutAgeImage[mask==1]<-tOutAge

setwd(outDir)
antsImageWrite(pOutAgeImage,"lmP_Age.nii.gz")
antsImageWrite(tOutAgeImage,"lmT_Age.nii.gz")
