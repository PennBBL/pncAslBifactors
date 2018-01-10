############################
### SENSITIVITY ANALYSES ###
############################

#This will subset the data to those not on psychotropic psychiatric meds (n=922) for sensitivity analyses.
#NOTE: the new "psychoactiveMedPsychv2" replaces the old more stringent "psychoactiveMedPsych"

#Read in data
subjData<-readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_JLF_aslVox11andUp_subjData_clusters.rds")

#exclude those on psychiatric psychotropic meds
subjData_sensitivity11<-subjData
subjData_sensitivity11$ACROSS.INCLUDE.PSYCMEDS <- 1
subjData_sensitivity11$ACROSS.INCLUDE.PSYCMEDS[subjData_sensitivity11$psychoactiveMedPsychv2==1] <- 0
subjData_sensitivity11 <- subjData_sensitivity11[which(subjData_sensitivity11$ACROSS.INCLUDE.PSYCMEDS == 1), ]

#save file
saveRDS(subjData_sensitivity11,"/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n922_JLF_aslVox11andUpSensitivity_subjData_clusters.rds")
