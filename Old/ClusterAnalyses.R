##########################
#### CLUSTER ANALYSES ####
##########################

#Read in data
subjData<-readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_JLF_aslVox11andUp_subjData_clusters.rds")

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
Model1a<-lm(LM_asl_OverallPsy_RightPostcentralGyrus ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

Model1b<-lm(LM_asl_OverallPsy_RightPostcentralGyrus ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model1c<-lm(LM_asl_OverallPsy_RightPostcentralGyrus ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model1d<-lm(LM_asl_OverallPsy_RightPostcentralGyrus ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology,data=subjData)

Model1e<-lm(LM_asl_OverallPsy_RightPostcentralGyrus ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model1f<-lm(LM_asl_OverallPsy_RightPostcentralGyrus ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)


#Midbrain (near subgen ACC)
Model2a<-lm(LM_asl_OverallPsy_MidbrainSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

Model2b<-lm(LM_asl_OverallPsy_MidbrainSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model2c<-lm(LM_asl_OverallPsy_MidbrainSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model2d<-lm(LM_asl_OverallPsy_MidbrainSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology,data=subjData)

Model2e<-lm(LM_asl_OverallPsy_MidbrainSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model2f<-lm(LM_asl_OverallPsy_MidbrainSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)


#Left parahippocampal/midbrain
Model3a<-lm(LM_asl_OverallPsy_LeftParahippocampalMidbrain ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

Model3b<-lm(LM_asl_OverallPsy_LeftParahippocampalMidbrain ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model3c<-lm(LM_asl_OverallPsy_LeftParahippocampalMidbrain ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model3d<-lm(LM_asl_OverallPsy_LeftParahippocampalMidbrain ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology,data=subjData)

Model3e<-lm(LM_asl_OverallPsy_LeftParahippocampalMidbrain ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model3f<-lm(LM_asl_OverallPsy_LeftParahippocampalMidbrain ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)


#Left rostral ACC
Model4a<-lm(LM_asl_OverallPsy_LeftRostralACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

Model4b<-lm(LM_asl_OverallPsy_LeftRostralACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model4c<-lm(LM_asl_OverallPsy_LeftRostralACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model4d<-lm(LM_asl_OverallPsy_LeftRostralACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology,data=subjData)

Model4e<-lm(LM_asl_OverallPsy_LeftRostralACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model4f<-lm(LM_asl_OverallPsy_LeftRostralACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)


#Right dorsal ACC
Model5a<-lm(LM_asl_OverallPsy_RightDorsalACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

Model5b<-lm(LM_asl_OverallPsy_RightDorsalACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model5c<-lm(LM_asl_OverallPsy_RightDorsalACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model5d<-lm(LM_asl_OverallPsy_RightDorsalACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology,data=subjData)

Model5e<-lm(LM_asl_OverallPsy_RightDorsalACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model5f<-lm(LM_asl_OverallPsy_RightDorsalACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)


#### PSYCHOSIS ####

#Specify models for clusters found to be significantly related to Psychosis during voxelwise analyses:
#Models tested: a) age*sex, b) Overall*age, c) Overall*sex
#26 - Left frontal operculum/left insula (LM_asl_Psychosis_LeftFrontalOperculumInsula)

#Left frontal operculum/left insula
Model6a<-lm(LM_asl_Psychosis_LeftFrontalOperculumInsula ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

Model6b<-lm(LM_asl_Psychosis_LeftFrontalOperculumInsula ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model6c<-lm(LM_asl_Psychosis_LeftFrontalOperculumInsula ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model6d<-lm(LM_asl_Psychosis_LeftFrontalOperculumInsula ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology,data=subjData)

Model6e<-lm(LM_asl_Psychosis_LeftFrontalOperculumInsula ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model6f<-lm(LM_asl_Psychosis_LeftFrontalOperculumInsula ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)


#### FEAR ####

#Specify models for clusters found to be significantly related to Fear during voxelwise analyses:
#Models tested: a) age*sex, b) Overall*age, c) Overall*sex
#38 - Right occipital/fusiform gyrus (LM_asl_Fear_RightOccipFusiform)
#37 - Left subgenual ACC (LM_asl_Fear_LeftSubgenACC)

#Right occipital/fusiform gyrus
Model7a<-lm(LM_asl_Fear_RightOccipFusiform ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

Model7b<-lm(LM_asl_Fear_RightOccipFusiform ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model7c<-lm(LM_asl_Fear_RightOccipFusiform ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model7d<-lm(LM_asl_Fear_RightOccipFusiform ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology,data=subjData)

Model7e<-lm(LM_asl_Fear_RightOccipFusiform ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model7f<-lm(LM_asl_Fear_RightOccipFusiform ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)


#Left subgenual ACC
Model8a<-lm(LM_asl_Fear_LeftSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

Model8b<-lm(LM_asl_Fear_LeftSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model8c<-lm(LM_asl_Fear_LeftSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model8d<-lm(LM_asl_Fear_LeftSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology,data=subjData)

Model8e<-lm(LM_asl_Fear_LeftSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model8f<-lm(LM_asl_Fear_LeftSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)



###############
#### PLOTS ####
###############

##OverallPsy
#59 - Right postcentral gyrus (LM_asl_OverallPsy_RightPostcentralGyrus)
#58 - Midbrain (near subgen ACC) (LM_asl_OverallPsy_MidbrainSubgenACC)
#57 - Left parahippocampal/midbrain (LM_asl_OverallPsy_LeftParahippocampalMidbrain)
#56 - Left rostral ACC (LM_asl_OverallPsy_LeftRostralACC)
#55 - Right dorsal ACC (LM_asl_OverallPsy_RightDorsalACC)

#Figure 2: Perfusion by OverallPsy in each significant region.
jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/OverallPsy_RightPostcentralGyrus.jpg")
visreg(Model1a, "Bifactor_Overall_Psychopathology", ylab = "Right Postcentral Gyrus CBF (ml/100g/min)", xlab = "Overall Psychopathology (z)", ylim=c(15,100), cex.lab=1.5, cex.axis=1.25, mgp=c(2.5, 1, 0))
dev.off()

jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/OverallPsy_MidbrainSubgenACC.jpg")
visreg(Model2a, "Bifactor_Overall_Psychopathology", ylab = "Midbrain CBF (ml/100g/min)", xlab = "Overall Psychopathology (z)", cex.lab=1.5, cex.axis=1.25, mgp=c(2.5, 1, 0))
dev.off()

jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/OverallPsy_LeftParahippocampalMidbrain.jpg")
visreg(Model3a, "Bifactor_Overall_Psychopathology", ylab = "Left Parahippocampal Gyrus/Midbrain CBF (ml/100g/min)", xlab = "Overall Psychopathology (z)", cex.lab=1.5, cex.axis=1.25, mgp=c(2.5, 1, 0))
dev.off()

jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/OverallPsy_LeftRostralACC.jpg")
visreg(Model4a, "Bifactor_Overall_Psychopathology", ylab = "Left Rostral ACC CBF (ml/100g/min)", xlab = "Overall Psychopathology (z)", cex.lab=1.5, cex.axis=1.25, mgp=c(2.5, 1, 0))
dev.off()

jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/OverallPsy_RightDorsalACC.jpg")
visreg(Model5a, "Bifactor_Overall_Psychopathology", ylab = "Right Dorsal ACC CBF (ml/100g/min)", xlab = "Overall Psychopathology (z)", ylim=c(0,80), cex.lab=1.5, cex.axis=1.25, mgp=c(2.5, 1, 0))
dev.off()


#Figure 3a: Perfusion by Psychosis in significant region.
#26 - Left frontal operculum/left insula (LM_asl_Psychosis_LeftFrontalOperculumInsula)

jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/Psychosis_LeftFrontalOperculumInsula.jpg")
visreg(Model6a, "Bifactor_Psychosis", ylab = "Left Frontal Operculum/Insula CBF (ml/100g/min)", xlab = "Psychosis (z)", cex.lab=1.5, cex.axis=1.25, mgp=c(2.5, 1, 0))
dev.off()


#Figure 3b and 3c: Perfusion by Fear in significant regions.
#38 - Right occipital/fusiform gyrus (LM_asl_Fear_RightOccipFusiform)
#37 - Left subgenual ACC (LM_asl_Fear_LeftSubgenACC)

jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/Fear_RightOccipFusiform.jpg")
visreg(Model7a, "Bifactor_Fear", ylab = "Right Occipital/Fusiform CBF (ml/100g/min)", xlab = "Fear (z)", cex.lab=1.5, cex.axis=1.25, mgp=c(2.5, 1, 0))
dev.off()

jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/Fear_LeftSubgenACC.jpg")
visreg(Model8a, "Bifactor_Fear", ylab = "Left Subgenual ACC CBF (ml/100g/min)", xlab = "Fear (z)", cex.lab=1.5, cex.axis=1.25, mgp=c(2.5, 1, 0))
dev.off()


#Supplemental Figure: Sex by Age graphs for significant regions
colorFillSex<-c("#FF00004D","#0000FF4D")
colorSex<-c("red","blue")

##OverallPsy##
#59 - Right postcentral gyrus (LM_asl_OverallPsy_RightPostcentralGyrus)
#58 - Midbrain (near subgen ACC) (LM_asl_OverallPsy_MidbrainSubgenACC)
#57 - Left parahippocampal/midbrain (LM_asl_OverallPsy_LeftParahippocampalMidbrain)
#56 - Left rostral ACC (LM_asl_OverallPsy_LeftRostralACC)
#55 - Right dorsal ACC (LM_asl_OverallPsy_RightDorsalACC)

jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/SexByAge_OverallPsy_RightPostcentralGyrus.jpg")
visreg(Model1a,"age",by="sex",overlay=TRUE,legend=FALSE,partial=FALSE,rug=FALSE,line.par=list(col=colorSex),fill.par=list(col=colorFillSex),points.par=list(col=colorSex),xlim=c(11,22),ylab="Right Postcentral Gyrus CBF (ml/100g/min)",xlab="Age (years)",cex.lab=1.5,cex.axis=1.25,mgp=c(2.5, 1, 0))
leg.text<-c("Female","Male")
legend("topright", legend=leg.text, lwd=c(2.5,2.5), col=c("red","blue"), cex=1.25)
dev.off()

jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/SexByAge_OverallPsy_MidbrainSubgenACC.jpg")
visreg(Model2a,"age",by="sex",overlay=TRUE,legend=FALSE,partial=FALSE,rug=FALSE,line.par=list(col=colorSex),fill.par=list(col=colorFillSex),points.par=list(col=colorSex),xlim=c(11,22),ylab="Midbrain CBF (ml/100g/min)",xlab="Age (years)",cex.lab=1.5,cex.axis=1.25,mgp=c(2.5, 1, 0))
leg.text<-c("Female","Male")
legend("topright", legend=leg.text, lwd=c(2.5,2.5), col=c("red","blue"), cex=1.25)
dev.off()

jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/SexByAge_OverallPsy_LeftParahippocampalMidbrain.jpg")
visreg(Model3a,"age",by="sex",overlay=TRUE,legend=FALSE,partial=FALSE,rug=FALSE,line.par=list(col=colorSex),fill.par=list(col=colorFillSex),points.par=list(col=colorSex),xlim=c(11,22),ylab="Left Parahippocampal Gyrus/Midbrain CBF (ml/100g/min)",xlab="Age (years)",cex.lab=1.5,cex.axis=1.25,mgp=c(2.5, 1, 0))
leg.text<-c("Female","Male")
legend("topright", legend=leg.text, lwd=c(2.5,2.5), col=c("red","blue"), cex=1.25)
dev.off()

jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/SexByAge_OverallPsy_LeftRostralACC.jpg")
visreg(Model4a,"age",by="sex",overlay=TRUE,legend=FALSE,partial=FALSE,rug=FALSE,line.par=list(col=colorSex),fill.par=list(col=colorFillSex),points.par=list(col=colorSex),xlim=c(11,22),ylab="Left Rostral ACC CBF (ml/100g/min)",xlab="Age (years)",cex.lab=1.5,cex.axis=1.25,mgp=c(2.5, 1, 0))
leg.text<-c("Female","Male")
legend("topright", legend=leg.text, lwd=c(2.5,2.5), col=c("red","blue"), cex=1.25)
dev.off()

jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/SexByAge_OverallPsy_RightDorsalACC.jpg")
visreg(Model5a,"age",by="sex",overlay=TRUE,legend=FALSE,partial=FALSE,rug=FALSE,line.par=list(col=colorSex),fill.par=list(col=colorFillSex),points.par=list(col=colorSex),xlim=c(11,22),ylab="Right Dorsal ACC CBF (ml/100g/min)",xlab="Age (years)",cex.lab=1.5,cex.axis=1.25,mgp=c(2.5, 1, 0))
leg.text<-c("Female","Male")
legend("topright", legend=leg.text, lwd=c(2.5,2.5), col=c("red","blue"), cex=1.25)
dev.off()


##Psychosis##
#26 - Left frontal operculum/left insula (LM_asl_Psychosis_LeftFrontalOperculumInsula)
jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/SexByAge_Psychosis_LeftFrontalOperculumInsula.jpg")
visreg(Model6a,"age",by="sex",overlay=TRUE,legend=FALSE,partial=FALSE,rug=FALSE,line.par=list(col=colorSex),fill.par=list(col=colorFillSex),points.par=list(col=colorSex),xlim=c(11,22),ylab="Left Frontal Operculum/Insula CBF (ml/100g/min)",xlab="Age (years)",cex.lab=1.5,cex.axis=1.25,mgp=c(2.5, 1, 0))
leg.text<-c("Female","Male")
legend("topright", legend=leg.text, lwd=c(2.5,2.5), col=c("red","blue"), cex=1.25)
dev.off()


##Fear##
#38 - Right occipital/fusiform gyrus (LM_asl_Fear_RightOccipFusiform)
#37 - Left subgenual ACC (LM_asl_Fear_LeftSubgenACC)

jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/SexByAge_Fear_RightOccipFusiform.jpg")
visreg(Model7a,"age",by="sex",overlay=TRUE,legend=FALSE,partial=FALSE,rug=FALSE,line.par=list(col=colorSex),fill.par=list(col=colorFillSex),points.par=list(col=colorSex),xlim=c(11,22),ylab="RightOccipFusiform CBF (ml/100g/min)",xlab="Age (years)",cex.lab=1.5,cex.axis=1.25,mgp=c(2.5, 1, 0))
leg.text<-c("Female","Male")
legend("topright", legend=leg.text, lwd=c(2.5,2.5), col=c("red","blue"), cex=1.25)
dev.off()

jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/SexByAge_Fear_LeftSubgenACC.jpg")
visreg(Model8a,"age",by="sex",overlay=TRUE,legend=FALSE,partial=FALSE,rug=FALSE,line.par=list(col=colorSex),fill.par=list(col=colorFillSex),points.par=list(col=colorSex),xlim=c(11,22),ylab="Left Subgenual ACC CBF (ml/100g/min)",xlab="Age (years)",cex.lab=1.5,cex.axis=1.25,mgp=c(2.5, 1, 0))
leg.text<-c("Female","Male")
legend("topright", legend=leg.text, lwd=c(2.5,2.5), col=c("red","blue"), cex=1.25)
dev.off()

