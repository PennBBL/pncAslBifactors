##########################
#### CLUSTER ANALYSES ####
##########################

#setwd('~/Desktop/BBL/')
setwd('/data/joy/BBL')

#Read in data
subjData<-readRDS("./projects/pncAslAcrossDisorder/subjectData/n1042_JLF_aslVox11andUp_subjData_clusters.rds")

#Load library for nonlinear analyses and plotting
library(mgcv)
library(visreg)
library(ggfortify)
library(ggplot2)

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

#Colors used: #329444 = green (OverallPsych), #325194 = blue (Anxious-Misery), #943282 = purple (Psychosis), #B3141C = red (Behavioral), #F58311 = orange (Fear)

#Figure 2a and 2b: Perfusion by OverallPsy
#green line
jpeg(file = "./projects/pncAslAcrossDisorder/TablesFigures/OverallPsy_LeftRostralACC_scatterplot.jpg")
par(mar=c(5,5,2,2),mgp=c(3.3,1,0))
visreg(Model1, "Bifactor_Overall_Psychopathology", ylab = "L Rostral ACC CBF (ml/100g/min)", xlab = "Overall Psychopathology (z)", 
       cex.lab=1.75, font.lab=2, cex.axis=1.5, fill=list(col="#C8E6C9"), line=list(col="#329444"))
dev.off()

#green line
jpeg(file = "./projects/pncAslAcrossDisorder/TablesFigures/OverallPsy_RightDorsalACC_scatterplot.jpg")
par(mar=c(5,5,2,2),mgp=c(3.3,1,0))
visreg(Model2, "Bifactor_Overall_Psychopathology", ylab = "R Dorsal ACC CBF (ml/100g/min)", xlab = "Overall Psychopathology (z)", 
       ylim=c(0,80), cex.lab=1.75, font.lab=2, cex.axis=1.5, fill=list(col="#C8E6C9"), line=list(col="#329444"))
dev.off()

#Figure 3a: Perfusion by Psychosis
#purple line
jpeg(file = "./projects/pncAslAcrossDisorder/TablesFigures/Psychosis_LeftFrontalOperculumInsula_scatterplot.jpg")
par(mar=c(5,5,2,2),mgp=c(3.3,1,0))
visreg(Model3, "Bifactor_Psychosis", ylab = "L Operculum/Insula CBF (ml/100g/min)", xlab = "Psychosis (z)",
       cex.lab=1.75, font.lab=2, cex.axis=1.5, fill=list(col="#E1BEE7"), line=list(col="#943282"))
dev.off()
 

#Figure 3b and 3c: Perfusion by Fear
#yellow/orange line
jpeg(file = "./projects/pncAslAcrossDisorder/TablesFigures/Fear_RightOccipFusiform_scatterplot.jpg")
par(mar=c(5,5,2,2),mgp=c(3.3,1,0))
visreg(Model4, "Bifactor_Fear", ylab = "R Occipital/Fusiform CBF (ml/100g/min)", xlab = "Fear (z)", 
       cex.lab=1.75, font.lab=2, cex.axis=1.5, fill=list(col="#FFF9C4"), line=list(col="#F58311"))
dev.off()

#yellow/orange line
jpeg(file = "./projects/pncAslAcrossDisorder/TablesFigures/Fear_LeftSubgenACC_scatterplot.jpg")
par(mar=c(5,5,2,2),mgp=c(3.3,1,0))
visreg(Model5, "Bifactor_Fear", ylab = "L Subgenual ACC CBF (ml/100g/min)", xlab = "Fear (z)", 
       cex.lab=1.75, font.lab=2, cex.axis=1.5, fill= list(col="#FFF9C4"), line=list(col="#F58311"))
dev.off()


##visreg options
#mar – A numeric vector of length 4, which sets the margin sizes in the following order: bottom, left, top, and right. The default is c(5.1, 4.1, 4.1, 2.1).
#mgp – A numeric vector of length 3, which sets the axis label locations relative to the edge of the inner plot window. The first value represents the location the labels (i.e. xlab and ylab in plot), the second the tick-mark labels, and third the tick marks. The default is c(3, 1, 0).


#Supplemental Figure: Sex by Age graphs for significant regions
colorFillSex<-c("#FF00004D","#0000FF4D")
colorSex<-c("red","blue")

##OverallPsy##
jpeg(file = "./projects/pncAslAcrossDisorder/TablesFigures/SexByAge_OverallPsy_LeftRostralACC.jpg")
par(mar=c(5,5,2,2),mgp=c(3.3,1,0))
visreg(Model1,"age",by="sex",overlay=TRUE,legend=FALSE,partial=FALSE,rug=FALSE,line.par=list(col=colorSex),fill.par=list(col=colorFillSex),points.par=list(col=colorSex),xlim=c(11,22),ylab="L Rostral ACC CBF (ml/100g/min)",xlab="Age (years)",cex.lab=1.75,font.lab=2,cex.axis=1.5)
leg.text<-c("Female","Male")
legend("topright", legend=leg.text, lwd=c(2.5,2.5), col=c("red","blue"), cex=1.5)
dev.off()

jpeg(file = "./projects/pncAslAcrossDisorder/TablesFigures/SexByAge_OverallPsy_RightDorsalACC.jpg")
par(mar=c(5,5,2,2),mgp=c(3.3,1,0))
visreg(Model2,"age",by="sex",overlay=TRUE,legend=FALSE,partial=FALSE,rug=FALSE,line.par=list(col=colorSex),fill.par=list(col=colorFillSex),points.par=list(col=colorSex),xlim=c(11,22),ylab="R Dorsal ACC CBF (ml/100g/min)",xlab="Age (years)",cex.lab=1.75,font.lab=2,cex.axis=1.5)
leg.text<-c("Female","Male")
legend("topright", legend=leg.text, lwd=c(2.5,2.5), col=c("red","blue"), cex=1.5)
dev.off()

##Psychosis##
jpeg(file = "./projects/pncAslAcrossDisorder/TablesFigures/SexByAge_Psychosis_LeftFrontalOperculumInsula.jpg")
par(mar=c(5,5,2,2),mgp=c(3.3,1,0))
visreg(Model3,"age",by="sex",overlay=TRUE,legend=FALSE,partial=FALSE,rug=FALSE,line.par=list(col=colorSex),fill.par=list(col=colorFillSex),points.par=list(col=colorSex),xlim=c(11,22),ylab="L Operculum/Insula CBF (ml/100g/min)",xlab="Age (years)",cex.lab=1.75,font.lab=2,cex.axis=1.5)
leg.text<-c("Female","Male")
legend("topright", legend=leg.text, lwd=c(2.5,2.5), col=c("red","blue"), cex=1.5)
dev.off()

##Fear##
jpeg(file = "./projects/pncAslAcrossDisorder/TablesFigures/SexByAge_Fear_RightOccipFusiform.jpg")
par(mar=c(5,5,2,2),mgp=c(3.3,1,0))
visreg(Model4,"age",by="sex",overlay=TRUE,legend=FALSE,partial=FALSE,rug=FALSE,line.par=list(col=colorSex),fill.par=list(col=colorFillSex),points.par=list(col=colorSex),xlim=c(11,22),ylab="R Occipital/Fusiform CBF (ml/100g/min)",xlab="Age (years)",cex.lab=1.75,font.lab=2,cex.axis=1.5)
leg.text<-c("Female","Male")
legend("topright", legend=leg.text, lwd=c(2.5,2.5), col=c("red","blue"), cex=1.5)
dev.off()

jpeg(file = "./projects/pncAslAcrossDisorder/TablesFigures/SexByAge_Fear_LeftSubgenACC.jpg")
par(mar=c(5,5,2,2),mgp=c(3.3,1,0))
visreg(Model5,"age",by="sex",overlay=TRUE,legend=FALSE,partial=FALSE,rug=FALSE,line.par=list(col=colorSex),fill.par=list(col=colorFillSex),points.par=list(col=colorSex),xlim=c(11,22),ylab="L Subgenual ACC CBF (ml/100g/min)",xlab="Age (years)",cex.lab=1.75,font.lab=2,cex.axis=1.5)
leg.text<-c("Female","Male")
legend("topright", legend=leg.text, lwd=c(2.5,2.5), col=c("red","blue"), cex=1.5)
dev.off()
