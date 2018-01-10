################################################
#### Prepare Subject-Level Data For Chimera ####
################################################

#Read in files
subjData<-readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_JLF_aslVox11andUp_subjData_clusters.rds")

#Load libraries
library(data.table)

#Make a binary group variable (1: patient; 0: normal control)
subjData$AllAnxTd <- NA
subjData$AllAnxTd[subjData$Agr==1] <- "1"
subjData$AllAnxTd[subjData$Gad==1] <- "1"
subjData$AllAnxTd[subjData$Ocd==1] <- "1"
subjData$AllAnxTd[subjData$Pan==1] <- "1"
subjData$AllAnxTd[subjData$Ptd==1] <- "1"
subjData$AllAnxTd[subjData$Sep==1] <- "1"
subjData$AllAnxTd[subjData$Soc==1] <- "1"
subjData$AllAnxTd[subjData$Sph==1] <- "1"
subjData$AllAnxTd[subjData$Td==1] <- "0"
subjData$AllAnxTd <- as.factor(subjData$AllAnxTd)

#Recode sex factor where 1=male, 0=female
subjData$sex <- ifelse(subjData$sex == "male", 1, ifelse(subjData$sex == "female", 0, NA))
subjData$sex <- as.factor(subjData$sex)

###############
#### LOBES ####
###############

#Subset only by variables needed for analyses AND subset the data by just those in the All Anxiety (Agr, Gad, Ocd, Pan, Ptd, Sep, Soc, Sph) and TD groups (n=822)
subjData_Lobes <- subjData[which(subjData$AllAnxTd != "NA"),c("bblid","age","sex","AllAnxTd","Asl_gmSubcortTotal","Asl_gmFrontalTotal","Asl_gmOccipitalTotal","Asl_gmParietalTotal","Asl_gmTemporalTotal")]

#Change header names to mandatory Chimera names
setnames(subjData_Lobes, old = c('bblid','age','sex','AllAnxTd','Asl_gmSubcortTotal','Asl_gmFrontalTotal','Asl_gmOccipitalTotal','Asl_gmParietalTotal','Asl_gmTemporalTotal'), new = c('ID','COVAR','COVAR','Group','IMG','IMG','IMG','IMG','IMG'))

#Save .csv to use with Chimera
write.csv(subjData_Lobes, file="/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n822_AllAnxTd_AslLobes_ForChimera.csv", row.names=F, quote=F)


##############
#### ROIs ####
##############

#Subset only by variables needed for analyses AND subset the data by just those in the All Anxiety (Agr, Gad, Ocd, Pan, Ptd, Sep, Soc, Sph) and TD groups (n=822)
subjData_short <- subjData[which(subjData$AllAnxTd != "NA"),c("bblid","age","sex","AllAnxTd")]

ROIs <- subjData[which(subjData$AllAnxTd != "NA"),grep("pcasl_jlf_cbf",names(subjData))]

subjData_ROIs <- cbind(subjData_short,ROIs)

#Change header names to mandatory Chimera names
setnames(subjData_ROIs, old = c('bblid','age','sex','AllAnxTd'), new = c('ID','COVAR','COVAR','Group'))
names(subjData_ROIs)[grep("pcasl_jlf_cbf", names(subjData_ROIs))] = "IMG"

#Save .csv to use with Chimera
write.csv(subjData_ROIs, file="/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n822_AllAnxTd_AslROIs_ForChimera.csv", row.names=F, quote=F)
