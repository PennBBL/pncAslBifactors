##########################
#### CLUSTER ANALYSES ####
##########################

#Read in data
subjData<-readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_JLF_aslVox11andUp_subjData_clusters.rds")

#Load library for nonlinear analyses and plotting
library(mgcv)
library(visreg)

#Right dorsal ACC (overallpsy)
Model1a<-lm(LM_asl_OverallPsy_RightDorsalACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

#Left rostral ACC (overallpsy)
Model1b<-lm(LM_asl_OverallPsy_LeftRostralACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

#Left frontal operculum/left insula (psychosis)
Model2a<-lm(LM_asl_Psychosis_LeftFrontalOperculumInsula ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

#Right occipital/fusiform gyrus (fear)
Model2b<-lm(LM_asl_Fear_RightOccipFusiform ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

#Left subgenual ACC (fear)
Model2c<-lm(LM_asl_Fear_LeftSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)


###############
#### PLOTS ####
###############

#Supplemental Figure: Sex by Age graphs for significant regions
colorFillSex<-c("#FF00004D","#0000FF4D")
colorSex<-c("red","blue")

##OverallPsy##
jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/SexByAge_OverallPsy_RightDorsalACC.jpg")
visreg(Model5a,"age",by="sex",overlay=TRUE,legend=FALSE,partial=FALSE,rug=FALSE,line.par=list(col=colorSex),fill.par=list(col=colorFillSex),points.par=list(col=colorSex),xlim=c(11,22),ylab="Right Dorsal ACC CBF (ml/100g/min)",xlab="Age (years)",cex.lab=1.5,cex.axis=1.25,mgp=c(2.5, 1, 0))
leg.text<-c("Female","Male")
legend("topright", legend=leg.text, lwd=c(2.5,2.5), col=c("red","blue"), cex=1.25)
dev.off()

jpeg(file = "/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/SexByAge_OverallPsy_LeftRostralACC.jpg")
visreg(Model4a,"age",by="sex",overlay=TRUE,legend=FALSE,partial=FALSE,rug=FALSE,line.par=list(col=colorSex),fill.par=list(col=colorFillSex),points.par=list(col=colorSex),xlim=c(11,22),ylab="Left Rostral ACC CBF (ml/100g/min)",xlab="Age (years)",cex.lab=1.5,cex.axis=1.25,mgp=c(2.5, 1, 0))
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

