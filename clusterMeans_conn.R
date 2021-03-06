#NOTE: you need a qlogin session with sufficient memory to run this script (qlogin -l h_vmem=50.5G,s_vmem=50.0G), otherwise antsImageRead will give the not enough memory error "std::bad_alloc".

#####################
#### PARAMETERS #####
#####################

#Subject level data
subjDataName<-"/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n833_JLF_connVox11andUp_subjData_clusters.rds"

#4d merged set of ASL images (choose dACC or rACC)
tsName<-"/data/joy/BBL/projects/pncAslAcrossDisorder/results/n833_rACCPath/fourd.nii.gz"

#Mask (choose dACC or rACC)
maskName<-"/data/joy/BBL/projects/pncAslAcrossDisorder/results/n833_rACCPath/mask.nii.gz"

#Choose the clustermask of interest
#dACC OverallPsy positive
#clsMask<-"/data/joy/BBL/projects/pncAslAcrossDisorder/results/n833_dACCPath/age_sex_restRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/easythresh_3.09_54/cluster_mask_zstat10_3.09_1.nii.gz"

#dACC OverallPsy negative
#clsMask<-"/data/joy/BBL/projects/pncAslAcrossDisorder/results/n833_dACCPath/age_sex_restRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/easythresh_3.09_54/cluster_mask_zstat10Neg_3.09_1.nii.gz"

#rACC OverallPsy negative
clsMask<-"/data/joy/BBL/projects/pncAslAcrossDisorder/results/n833_rACCPath/age_sex_restRelMeanRMSMotion_Bifactor_Mood_Bifactor_Psychosis_Bifactor_Externalizing_Bifactor_Fear_Bifactor_Overall_Psychopathology/easythresh_3.09_54/cluster_mask_zstat10Neg_3.09_1.nii.gz"

#bblids (critical for ordering variables) (choose dACC or rACC)
subjName<-"/data/joy/BBL/projects/pncAslAcrossDisorder/results/n833_rACCPath/bblids.txt"

#What cluster do you want to look at? This are the "intensity" values in cluster mask image (open clustermask in fslview and click on cluster of interest to find its cluster number).

#Significant clusters of interest for OverallPsy:
##dACC
#Positive
#15 Right default mode network (LM_OverallPsy_dACC_conn_RightDMN)
#14 Left default mode network (LM_OverallPsy_dACC_conn_LeftDMN)

#Negative
#35 Right Caudate (LM_OverallPsy_dACC_conn_RightCaudate)
#34 Right Supramarginal gyrus (LM_OverallPsy_dACC_conn_RightSupramarginalGyrus)
#33 Right Thalamus (LM_OverallPsy_dACC_conn_RightThalamus)
#32 Left Caudate (LM_OverallPsy_dACC_conn_LeftCaudate)
#31 Right Putamen (LM_OverallPsy_dACC_conn_RightPutamen)

##rACC
#Negative
#9 Right inferior temporal gyrus (LM_OverallPsy_rACC_conn_RightInfTempGyrus)

clsVal<- 9

clsName<-"LM_OverallPsy_rACC_conn_RightInfTempGyrus"


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
saveRDS(subjData, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n833_JLF_connVox11andUp_subjData_clusters.rds")

