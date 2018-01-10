#NOTE: you need a qlogin session with sufficient memory to run this script (qlogin -l h_vmem=50.5G,s_vmem=50.0G), otherwise antsImageRead will give the not enough memory error "std::bad_alloc".

#####################
#### PARAMETERS #####
#####################

#Subject level data
subjDataName<-"/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1029_JLF_aslVox11andUp_subjData_TraitClusters.rds"

#4d merged set of ASL images
tsName<-"/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1029_AslPath_ACROSS.INCLUDE_smooth0/fourd.nii.gz"

#Mask
maskName<-"/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1029_AslPath_ACROSS.INCLUDE_smooth0/mask.nii.gz"

#Choose the clustermask from the main effect of OverallPsy for starters.
clsMask<-"/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1029_AslPath_ACROSS.INCLUDE_smooth0/n1029gam_Cov_sage_sex_sagebysex_pcaslRelMeanRMSMotion_State_General_Trait_General/easythresh_2.58_90/cluster_mask_gamZ_Trait_General_2.58_1.nii.gz"

#bblids (critical for ordering variables)
subjName<-"/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1029_AslPath_ACROSS.INCLUDE_smooth0/bblids.txt"

#What cluster do you want to look at? This are the "intensity" values in cluster mask image (open clustermask in fslview and click on cluster of interest to find its cluster number).
clsVal<- 110

clsName<-"GAM_asl_OverallPsy_AmygFusiform"


############################################
#### SAVE MEAN VALUES FOR EACH CLUSTER #####
############################################

####libraries
library(ANTsR)

####Load image data
ts<-antsImageRead(tsName,4) #read the 4d merged asl images
mask<-antsImageRead(maskName,3) #read the 3d merged mask images

###Reshape
tsMat<-timeseries2matrix(ts,mask) #reshape 4d image into 2d matrix-- subjects are rows, voxels are columns

#Read in cluster
cls<-antsImageRead(clsMask,3)
clsMat <- matrix(nrow =1, ncol = length(which(mask>0)))
clsMat[1,]<- as.numeric(cls[mask>0])

###Get mean activation within the cluster -- can run code just from here to speed iteration
y<-rowMeans(tsMat[,which(clsMat==clsVal)])  #mean asl within selected cluster becomes "y"

##Load and subset subject data
subjDataIn<-readRDS(subjDataName) #subject level rds file
subj<-read.table(subjName) #bblids from the voxelwise analysis
subjData<-subjDataIn[subjDataIn$bblid %in% subj$V1,] #subsetting the subject data by those in the voxelwise analysis
subjData<-subjData[match(subj$V1, subjData$bblid),] #put the bblids in the exact same order as in the voxelwise analysis

#check ordering of bblids versus subject list
if(!identical(subj$V1,subjData$bblid)){
        print("subjectIds not matched-- ERROR!!!")
        stop()
}

#combine y, GMD, and subject data
subjData<-cbind(subjData,y)

#rename y with region label
names(subjData)[names(subjData)=="y"]<-clsName

#save data
saveRDS(subjData, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1029_JLF_aslVox11andUp_subjData_TraitClusters.rds")

