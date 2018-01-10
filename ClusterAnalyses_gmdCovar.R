##########################
#### CLUSTER ANALYSES ####
##########################

#Read in data
aslData<-readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_JLF_aslVox11andUp_subjData_clusters.rds")
gmdData<-readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_JLF_aslVox11andUp_subjData_GMDclusters.rds")

#Select variables
Vars <- c("bblid", "LM_gmd_OverallPsy_RightDorsalACC", "LM_gmd_OverallPsy_LeftRostralACC", "LM_gmd_OverallPsy_LeftParahippocampalMidbrain", "LM_gmd_OverallPsy_MidbrainSubgenACC", "LM_gmd_OverallPsy_RightPostcentralGyrus","LM_gmd_Psychosis_LeftFrontalOperculumInsula", "LM_gmd_Fear_RightOccipFusiform", "LM_gmd_Fear_LeftSubgenACC")
gmdVars <- gmdData[Vars]

#Merge subjData and Vars
subjData <- merge(aslData, gmdVars, by="bblid")

#Load library for nonlinear analyses and plotting
library(mgcv)
library(visreg)

#### OVERALL PSYC ####

#Specify models for clusters found to be significantly related to OverallPsy during voxelwise analyses:
#Models tested: a) age*sex, b) Overall*age, c) Overall*sex
#59 - Right postcentral gyrus (LM_asl_OverallPsy_RightPostcentralGyrus)
#58 - Midbrain (near subgen ACC) (LM_asl_OverallPsy_MidbrainSubgenACC)
#57 - Left parahippocampal/midbrain (LM_asl_OverallPsy_LeftParahippocampalMidbrain)
#56 - Left rostral ACC (LM_asl_OverallPsy_LeftRostralACC)
#55 - Right dorsal ACC (LM_asl_OverallPsy_RightDorsalACC)

#Right postcentral gyrus
Model1a<-lm(LM_asl_OverallPsy_RightPostcentralGyrus ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + LM_gmd_OverallPsy_RightPostcentralGyrus + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

#Midbrain (near subgen ACC)
Model2a<-lm(LM_asl_OverallPsy_MidbrainSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + LM_gmd_OverallPsy_MidbrainSubgenACC + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

#Left parahippocampal/midbrain
Model3a<-lm(LM_asl_OverallPsy_LeftParahippocampalMidbrain ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + LM_gmd_OverallPsy_LeftParahippocampalMidbrain + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

#Left rostral ACC
Model4a<-lm(LM_asl_OverallPsy_LeftRostralACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + LM_gmd_OverallPsy_LeftRostralACC + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

#Right dorsal ACC
Model5a<-lm(LM_asl_OverallPsy_RightDorsalACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + LM_gmd_OverallPsy_RightDorsalACC + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)


#### PSYCHOSIS ####

#Specify models for clusters found to be significantly related to Psychosis during voxelwise analyses:
#Models tested: a) age*sex, b) Overall*age, c) Overall*sex
#26 - Left frontal operculum/left insula (LM_asl_Psychosis_LeftFrontalOperculumInsula)

#Left frontal operculum/left insula
Model6a<-lm(LM_asl_Psychosis_LeftFrontalOperculumInsula ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + LM_gmd_Psychosis_LeftFrontalOperculumInsula + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)


#### FEAR ####

#Specify models for clusters found to be significantly related to Fear during voxelwise analyses:
#Models tested: a) age*sex, b) Overall*age, c) Overall*sex
#38 - Right occipital/fusiform gyrus (LM_asl_Fear_RightOccipFusiform)
#37 - Left subgenual ACC (LM_asl_Fear_LeftSubgenACC)

#Right occipital/fusiform gyrus
Model7a<-lm(LM_asl_Fear_RightOccipFusiform ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + LM_gmd_Fear_RightOccipFusiform + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

#Left subgenual ACC
Model8a<-lm(LM_asl_Fear_LeftSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + LM_gmd_Fear_LeftSubgenACC + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)


#FDR correction:

p_values<-c(0.0000831,0.000000246,0.00000305,0.0000451,0.0000185,0.000271,0.000005,0.00000859)
pfdr<-p.adjust(p_values,method="fdr")