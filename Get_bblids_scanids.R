####################################
### n1274 (asl voxelwise sample) ###
####################################

#Read data
subjData <- readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1274_JLF_aslVox_subjData.rds")

#bblid list
bblids<-subjData$bblid
write.table(bblids, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1274_aslVox_bblids.csv", row.names=F, col.names=F, sep=",")

#scanid list
scanids<-subjData$scanid
write.table(scanids, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1274_aslVox_scanids.csv", row.names=F, col.names=F, sep=",")


##############################################
### n1042 (11 and up asl voxelwise sample) ###
##############################################

#Read data
subjData11 <- readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_JLF_aslVox11andUp_subjData.rds")

#bblid list
bblids11<-subjData11$bblid
write.table(bblids11, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_aslVox11andUp_bblids.csv", row.names=F, col.names=F, sep=",")

#scanid list
scanids11<-subjData11$scanid
write.table(scanids11, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_aslVox11andUp_scanids.csv", row.names=F, col.names=F, sep=",")


################################################
### n1274 (asl voxelwise sample) Sensitivity ###
################################################

#Read data
subjData_Sensitivity <- readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1135_JLF_aslVoxSensitivity_subjData.rds")

#bblid list
bblidsSensitivity<-subjData_Sensitivity$bblid
write.table(bblidsSensitivity, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1135_aslVoxSensitivity_bblids.csv", row.names=F, col.names=F, sep=",")

#scanid list
scanidsSensitivity<-subjData_Sensitivity$scanid
write.table(scanidsSensitivity, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1135_aslVoxSensitivity_scanids.csv", row.names=F, col.names=F, sep=",")


##########################################################
### n1042 (11 and up asl voxelwise sample) Sensitivity ###
##########################################################

#Read data
subjData11_Sensitivity <- readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n922_JLF_aslVox11andUpSensitivity_subjData.rds")

#bblid list
bblids11Sensitivity<-subjData11_Sensitivity$bblid
write.table(bblids11Sensitivity, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n922_aslVox11andUpSensitivity_bblids.csv", row.names=F, col.names=F, sep=",")

#scanid list
scanids11Sensitivity<-subjData11_Sensitivity$scanid
write.table(scanids11Sensitivity, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n922_aslVox11andUpSensitivity_scanids.csv", row.names=F, col.names=F, sep=",")


#############################################
### n587 (male only asl voxelwise sample) ###
#############################################

#Read data
subjDataMale <- readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n587_JLF_aslVoxMale_subjData.rds")

#bblid list
bblidsMale<-subjDataMale$bblid
write.table(bblidsMale, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n587_aslVoxMale_bblids.csv", row.names=F, col.names=F, sep=",")

#scanid list
scanidsMale<-subjDataMale$scanid
write.table(scanidsMale, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n587_aslVoxMale_scanids.csv", row.names=F, col.names=F, sep=",")


###############################################
### n687 (female only asl voxelwise sample) ###
###############################################

#Read data
subjDataFemale <- readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n687_JLF_aslVoxFemale_subjData.rds")

#bblid list
bblidsFemale<-subjDataFemale$bblid
write.table(bblidsFemale, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n687_aslVoxFemale_bblids.csv", row.names=F, col.names=F, sep=",")

#scanid list
scanidsFemale<-subjDataFemale$scanid
write.table(scanidsFemale, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n687_aslVoxFemale_scanids.csv", row.names=F, col.names=F, sep=",")


#########################################
### n468 (male only 11 and up sample) ###
#########################################

#Read data
subjDataMale11 <- readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n468_JLF_aslVox11andUpMale_subjData.rds")

#bblid list
bblidsMale11<-subjDataMale11$bblid
write.table(bblidsMale11, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n468_aslVox11andUpMale_bblids.csv", row.names=F, col.names=F, sep=",")

#scanid list
scanidsMale11<-subjDataMale11$scanid
write.table(scanidsMale11, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n468_aslVox11andUpMale_scanids.csv", row.names=F, col.names=F, sep=",")


###########################################
### n574 (female only 11 and up sample) ###
###########################################

#Read data
subjDataFemale11 <- readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n574_JLF_aslVox11andUpFemale_subjData.rds")

#bblid list
bblidsFemale11<-subjDataFemale11$bblid
write.table(bblidsFemale11, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n574_aslVox11andUpFemale_bblids.csv", row.names=F, col.names=F, sep=",")

#scanid list
scanidsFemale11<-subjDataFemale11$scanid
write.table(scanidsFemale11, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n574_aslVox11andUpFemale_scanids.csv", row.names=F, col.names=F, sep=",")
