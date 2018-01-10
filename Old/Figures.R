##########################
#### CLUSTER ANALYSES ####
##########################

#Read in data
subjData<-readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_JLF_aslVox11andUp_subjData_clusters.rds")

#Load library for nonlinear analyses and plotting
library(mgcv)
library(visreg)

#### OVERALL PSYC ####

#Left rostral ACC
Model1<-lm(LM_asl_OverallPsy_LeftRostralACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

#Right dorsal ACC
Model2<-lm(LM_asl_OverallPsy_RightDorsalACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)


#### PSYCHOSIS ####

#Left frontal operculum/left insula
Model3<-lm(LM_asl_Psychosis_LeftFrontalOperculumInsula ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)


#### FEAR ####

#Right occipital/fusiform gyrus
Model4<-lm(LM_asl_Fear_RightOccipFusiform ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

#Left subgenual ACC
Model5<-lm(LM_asl_Fear_LeftSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)


###############
#### PLOTS ####
###############

#Figure 2a and 2b: Perfusion by OverallPsy
#Ted wants a green line (might need to abandon visreg and use ggplot instead)
jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/OverallPsy_LeftRostralACC.jpg")
visreg(Model1, "Bifactor_Overall_Psychopathology", ylab = "Left Rostral ACC CBF (ml/100g/min)", xlab = "Overall Psychopathology (z)", cex.lab=1.5, cex.axis=1.25, mgp=c(2.5, 1, 0))
dev.off()

#green line
jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/OverallPsy_RightDorsalACC.jpg")
visreg(Model2, "Bifactor_Overall_Psychopathology", ylab = "Right Dorsal ACC CBF (ml/100g/min)", xlab = "Overall Psychopathology (z)", ylim=c(0,80), cex.lab=1.5, cex.axis=1.25, mgp=c(2.5, 1, 0))
dev.off()


#Figure 3a: Perfusion by Psychosis
#purple line
jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/Psychosis_LeftFrontalOperculumInsula.jpg")
visreg(Model3, "Bifactor_Psychosis", ylab = "Left Frontal Operculum/Insula CBF (ml/100g/min)", xlab = "Psychosis (z)", cex.lab=1.5, cex.axis=1.25, mgp=c(2.5, 1, 0))
dev.off()


#Figure 3b and 3c: Perfusion by Fear
#yellow/orange line
jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/Fear_RightOccipFusiform.jpg")
visreg(Model4, "Bifactor_Fear", ylab = "Right Occipital/Fusiform CBF (ml/100g/min)", xlab = "Fear (z)", cex.lab=1.5, cex.axis=1.25, mgp=c(2.5, 1, 0))
dev.off()

#yellow/orange line
jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/Fear_LeftSubgenACC.jpg")
visreg(Model5, "Bifactor_Fear", ylab = "Left Subgenual ACC CBF (ml/100g/min)", xlab = "Fear (z)", cex.lab=1.5, cex.axis=1.25, mgp=c(2.5, 1, 0))
dev.off()

