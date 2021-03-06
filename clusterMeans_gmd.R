#NOTE: you need a qlogin session with sufficient memory to run this script (qlogin -l h_vmem=50.5G,s_vmem=50.0G), otherwise antsImageRead will give the not enough memory error "std::bad_alloc".

#####################
#### PARAMETERS #####
#####################

#Subject level data
subjDataName<-"/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_JLF_aslVox11andUp_subjData_GMDclusters.rds"

#4d merged set of GMD images
tsName<-"/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1042_GmdPath/fourd.nii.gz"

#Mask
maskName<-"/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1042_GmdPath/mask.nii.gz"

#Choose the clustermask of interest (we are applying ASL cluster masks to GMD data to see if there is any GMD effects in the clusters found signif during ASL analyses)

#OverallPsy cluster mask
#clsMask<-"/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1042_AslPath/age_sex_pcaslRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/easythresh_3.09_54/cluster_mask_zstat10_3.09_1.nii.gz"

#Psychosis cluster mask
#clsMask<-"/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1042_AslPath/age_sex_pcaslRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/easythresh_3.09_54/cluster_mask_zstat7Neg_3.09_1.nii.gz"

#Fear cluster mask
clsMask<-"/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1042_AslPath/age_sex_pcaslRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/easythresh_3.09_54/cluster_mask_zstat9Neg_3.09_1.nii.gz"

#bblids (critical for ordering variables)
subjName<-"/data/joy/BBL/projects/pncAslAcrossDisorder/results/n1042_GmdPath/bblids.txt"

#What cluster do you want to look at? This are the "intensity" values in cluster mask image (open clustermask in fslview and click on cluster of interest to find its cluster number).

#Significant clusters of interest for OverallPsy:
#59 - Right postcentral gyrus (LM_asl_OverallPsy_RightPostcentralGyrus)
#58 - midbrain (near subgen ACC) (LM_asl_OverallPsy_MidbrainSubgenACC)
#57 - Left parahippocampal/midbrain (LM_asl_OverallPsy_LeftParahippocampalMidbrain)
#56 - Left rostral ACC (LM_asl_OverallPsy_LeftRostralACC)
#55 - Right dorsal ACC (LM_asl_OverallPsy_RightDorsalACC)

#Significant clusters of interest for Psychosis:
#26 - Left frontal operculum/left insula (LM_asl_Psychosis_LeftFrontalOperculumInsula)

#Significant clusters of interest for Fear:
#38 - Right occipital/fusiform gyrus (LM_asl_Fear_RightOccipFusiform)
#37 - Left subgenual ACC (LM_asl_Fear_LeftSubgenACC)

clsVal<- 37

#Rename cluster with gmd
clsName<-"LM_gmd_Fear_LeftSubgenACC"


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
saveRDS(subjData, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_JLF_aslVox11andUp_subjData_GMDclusters.rds")

