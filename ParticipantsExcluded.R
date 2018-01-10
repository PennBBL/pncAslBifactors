#########################
### LOAD DATA & MERGE ###
#########################

#subject level data (GO1 data release; n=1601)
data.go1release <- read.csv("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1601_go1_datarel_020716.csv", header=TRUE, na.strings=".")

#Remove the old demographics variables and add the new ones
data.go1release$sex <- NULL
data.go1release$race <- NULL
data.go1release$race2 <- NULL
data.go1release$ethnicity <- NULL
data.newDemo <- read.csv("/data/joy/BBL/studies/pnc/n1601_dataFreezeDec2016/demographics/n1601_demographics_go1_20161212.csv", header=TRUE, na.strings=".")

#Add the new health exclusion variable (healthExcludev2)
data.newHealthExclude <- read.csv("/data/joy/BBL/studies/pnc/n1601_dataFreezeDec2016/health/n1601_health_20161214.csv", header=TRUE, na.strings=".")

#Correlated Traits(n=9350, NOTE: there are two people from the 1601 sample who are missing correlated traits data)
data.CorrTraits <- read.csv("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/GOA_itemwise_corr-traits_scores_12-19-2016.csv", header=TRUE, na.strings = ".")

#Bifactors (n=9350, NOTE: there are two people from the 1601 sample who are missing bifactors data)
data.bifactors <- read.csv("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/GOA_itemwise_bifactor_scores_12-17-2016.csv", header=TRUE, na.strings=".")

#STAI factors (the STAI bifactor variables already included in the data release are missing data; after removing those under 12yrs, n=1134 (State) and n=1124 (Trait))
data.state <- read.csv("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/STAI_State_Pre-Scan_Bifactor_FScores_1601_2.csv", header=TRUE, na.strings=".")
data.trait <- read.csv("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/STAI_Trait_Bifactor_FScores_1601_2.csv", header=TRUE, na.strings=".")

#antsCT global volumes (n=1601; total GM volume, total WM volume, CSF, etc.)
data.globalVol <- read.csv("/data/joy/BBL/studies/pnc/n1601_dataFreeze2016/neuroimaging/t1struct/n1601_antsCtVol.csv", header=TRUE, na.strings=".")

#JLF volume, cortical thickness, gmd, and their QA exclusion variables(n=1601)
data.vol <- read.csv("/data/joy/BBL/studies/pnc/n1601_dataFreeze2016/neuroimaging/t1struct/n1601_jlfVol.csv", header=TRUE, na.strings=".")
data.ct <- read.csv("/data/joy/BBL/studies/pnc/n1601_dataFreeze2016/neuroimaging/t1struct/n1601_jlfCt.csv", header=TRUE, na.strings=".")
data.gmd <- read.csv("/data/joy/BBL/studies/pnc/n1601_dataFreeze2016/neuroimaging/t1struct/n1601_jlfGMD.csv", header=TRUE, na.strings=".")
data.t1.QA <- read.csv("/data/joy/BBL/studies/pnc/n1601_dataFreeze2016/neuroimaging/t1struct/n1601_t1QaData.csv", header=TRUE, na.strings=".")

#ASL data and its QA exclusion variables (n=1601)
data.asl <- read.csv("/data/joy/BBL/studies/pnc/n1601_dataFreeze2016/neuroimaging/asl/n1601_jlfPcaslValues.csv", header=TRUE, na.strings="NA")
data.asl.QA <- read.csv("/data/joy/BBL/studies/pnc/n1601_dataFreeze2016/neuroimaging/asl/n1601_PcaslQaData.csv", header=TRUE, na.strings="NA")

##Merge data using bblid and scanid
#WARNING: Merging files with unequal cases will cause the non-matched bblids to be deleted; to merge all cases and create NAs for missing data, add all = TRUE).
data.merge1 <- merge(data.go1release, data.newDemo, by=c("bblid","scanid"), all=TRUE)
data.merge2 <- merge(data.merge1, data.newHealthExclude, by=c("bblid","scanid"), all=TRUE)
data.merge3 <- merge(data.merge2, data.CorrTraits, by="bblid", all=TRUE)
data.merge4 <- merge(data.merge3, data.bifactors, by="bblid", all=TRUE)
data.merge5 <- merge(data.merge4, data.state, by="bblid", all=TRUE)
data.merge6 <- merge(data.merge5, data.trait, by="bblid", all=TRUE)
data.merge7 <- merge(data.merge6, data.globalVol, by=c("bblid","scanid"), all=TRUE)
data.merge8 <- merge(data.merge7, data.vol, by=c("bblid","scanid"), all=TRUE)
data.merge9 <- merge(data.merge8, data.ct, by=c("bblid","scanid"), all=TRUE)
data.merge10 <- merge(data.merge9, data.gmd, by=c("bblid","scanid"), all=TRUE)
data.merge11 <- merge(data.merge10, data.t1.QA, by=c("bblid","scanid"), all=TRUE)
data.merge12 <- merge(data.merge11, data.asl, by=c("bblid","scanid"), all=TRUE)
data.merge13 <- merge(data.merge12, data.asl.QA, by=c("bblid","scanid"), all=TRUE)

#Retain only the n=1601 bblids
data.n1601 <- data.merge13[match(data.go1release$bblid, data.merge13$bblid, nomatch=0),]

#Put bblids in ascending order
data.ordered <- data.n1601[order(data.n1601$bblid),]

###########################
### TRANSFORM VARIABLES ###
###########################

#Transform the age variable from months to years ("ageAtGo1Scan" changed to "ageAtScan1" in new demographics file)
data.ordered$age <- (data.ordered$ageAtGo1Scan)/12

#make sex ordered
data.ordered$sex[which(data.ordered$sex==1)] <- "male"
data.ordered$sex[which(data.ordered$sex==2)] <- "female"
data.ordered$sex <- as.ordered(as.factor(data.ordered$sex))

#race (make white vs non-white)
data.ordered$white <- NA
data.ordered$white[which(data.ordered$race==1)] <- "Caucasian"
data.ordered$white[which(data.ordered$race!=1)] <- "notCaucasian"
data.ordered$white <- as.ordered(as.factor(data.ordered$white))

subjData <- data.ordered

#########################################################
### COUNT NUMBER EXCLUDED FOR EACH EXCLUSION VARIABLE ###
#########################################################

##Count the number excluded for the proband sample (excludes those younger than 11 years because only collateral reports of psychiatric symptoms were available (Wolf et al., 2015 JAMA) (Incuded: n=1288; Excluded: n=313)
subjData$ACROSS.INCLUDE.11 <- 0
subjData$ACROSS.INCLUDE.11[subjData$age >= 11] <- 1
proband.include<-sum(subjData$ACROSS.INCLUDE.11)
proband.exclude<-1601-proband.include

#Subset the data to just the  proband sample (11 and up)
data.subset <-subjData[which(subjData$ACROSS.INCLUDE.11 == 1), ]

##Count the total number excluded for healthExcludev2=1 (1=Excludes those with medical rating 3/4, major incidental findings that distort anatomy, psychoactive medical medications)
#Included: n=1161; Excluded: n=127, but medical.exclude (n=68) + incidental.exclude (16) + medicalMed.exclude (53) = 137, so 10 people were excluded on the basis of two or more of these criteria)
data.subset$ACROSS.INCLUDE.health <- 1
data.subset$ACROSS.INCLUDE.health[data.subset$healthExcludev2==1] <- 0
health.include<-sum(data.subset$ACROSS.INCLUDE.health)
health.exclude<-1288-health.include

#Count the number excluded just medical rating 3/4 (GOAssess Medial History and CHOP EMR were used to define one summary rating for overall medical problems) (n=68)
data.subset$ACROSS.INCLUDE.medical <- 1
data.subset$ACROSS.INCLUDE.medical[data.subset$medicalratingExclude==1] <- 0
medical.include<-sum(data.subset$ACROSS.INCLUDE.medical)
medical.exclude<-1288-medical.include

#Count the number excluded for just major incidental findings that distort anatomy (n=16)
data.subset$ACROSS.INCLUDE.incidental <- 1
data.subset$ACROSS.INCLUDE.incidental[data.subset$incidentalFindingExclude==1] <- 0
incidental.include<-sum(data.subset$ACROSS.INCLUDE.incidental)
incidental.exclude<-1288-incidental.include

#Count the number excluded for just psychoactive medical medications (n=53)
data.subset$ACROSS.INCLUDE.medicalMed <- 1
data.subset$ACROSS.INCLUDE.medicalMed[data.subset$psychoactiveMedMedicalv2==1] <- 0
medicalMed.include<-sum(data.subset$ACROSS.INCLUDE.medicalMed)
medicalMed.exclude<-1288-medicalMed.include

#Subset the data to just the  that pass healthExcludev2 (n=1161)
data.subset2 <-data.subset[which(data.subset$ACROSS.INCLUDE.health == 1), ]

#Count the number who are missing clinical data (n=2)
data.subset2$ACROSS.INCLUDE.clinical <- 1
data.subset2$ACROSS.INCLUDE.clinical[is.na(data.subset2$Bifactor_Overall_Psychopathology)] <- 0
#this also works: data.subset2$ACROSS.INCLUDE.clinical[data.subset2$Bifactor_Overall_Psychopathology %in% NA] <- 0
clinical.include<-sum(data.subset2$ACROSS.INCLUDE.clinical)
clinical.exclude<-1161-clinical.include

#Count the number who failed to complete perfusion imaging (n=5)
data.subset2$ACROSS.INCLUDE.AslCollected <- 1
data.subset2$ACROSS.INCLUDE.AslCollected[data.subset2$pcaslNoDataExclude==1] <- 0
AslCollected.include<-sum(data.subset2$ACROSS.INCLUDE.AslCollected)
AslCollected.exclude<-1161-AslCollected.include

#Count the number who failed to meet image quality assurance protocols (t1 or pcasl) (n=117)
data.subset2$ACROSS.INCLUDE.QA <- 1
data.subset2$ACROSS.INCLUDE.QA[data.subset2$pcaslExclude==1] <- 0
data.subset2$ACROSS.INCLUDE.QA[data.subset2$pcaslVoxelwiseExclude==1] <- 0
data.subset2$ACROSS.INCLUDE.QA[data.subset2$t1Exclude==1] <- 0
QA.include<-sum(data.subset2$ACROSS.INCLUDE.QA)
QA.exclude<-1161-QA.include

##Count the number excluded for missing clinical data, failure to complete perfusion imaging, or failing to meet image quality assurance protocols
#Included: n=1042; Excluded: n=119, but clinical.exclude (n=2) + AslCollected.exclude (5) + QA.exclude (117) = 124, so 5 people were excluded on the basis of two or more of these criteria)
data.subset2$ACROSS.INCLUDE.clinQA <- 1
data.subset2$ACROSS.INCLUDE.clinQA[data.subset2$ACROSS.INCLUDE.clinical==0] <- 0
data.subset2$ACROSS.INCLUDE.clinQA[data.subset2$ACROSS.INCLUDE.AslCollected==0] <- 0
data.subset2$ACROSS.INCLUDE.clinQA[data.subset2$ACROSS.INCLUDE.QA==0] <- 0
clinQA.include<-sum(data.subset2$ACROSS.INCLUDE.clinQA)
clinQA.exclude<-1161-clinQA.include

#Subset the data to the final 1042 sample
data.final <-data.subset2[which(data.subset2$ACROSS.INCLUDE.clinQA == 1), ]

#Demographics for the paper
meanAge<-mean(data.final$age)
sdAge<-sd(data.final$age)
rangeAge<-range(data.final$age)
genderTable<-table(data.final$sex)

#Count the number taking psychotropic psychiatric medications (sensitivity analyses) (n=120)
data.final$ACROSS.INCLUDE.psychMeds <- 1
data.final$ACROSS.INCLUDE.psychMeds[data.final$psychoactiveMedPsychv2==1] <- 0
psychMeds.include<-sum(data.final$ACROSS.INCLUDE.psychMeds)
psychMeds.exclude<-1042-psychMeds.include

