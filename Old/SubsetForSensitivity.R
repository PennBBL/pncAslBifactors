##########################
### LOAD DATA & SUBSET ###
##########################

subjData_sensitivity <- readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1259_JLF_aslVox_subjData_aslPaths.rds")
subjData_sensitivity11 <- readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1029_JLF_aslVox11andUp_subjData_aslPaths.rds")

############################
### SENSITIVITY ANALYSES ###
############################

#Exclude those on psychiatric psychotropic meds.

#1259 voxelwise sample
subjData_sensitivity$ACROSS.INCLUDE.PSYCMEDS <- 1
subjData_sensitivity$ACROSS.INCLUDE.PSYCMEDS[subjData_sensitivity$psychoactiveMedPsych==1] <- 0
subjData_sensitivity <- subjData_sensitivity[which(subjData_sensitivity$ACROSS.INCLUDE.PSYCMEDS == 1), ]

#save file
saveRDS(subjData_sensitivity,"/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1259_JLF_aslVoxSensitivity_subjData_aslPaths.rds")


#11andUp sample (n=1029)
subjData_sensitivity11$ACROSS.INCLUDE.PSYCMEDS <- 1
subjData_sensitivity11$ACROSS.INCLUDE.PSYCMEDS[subjData_sensitivity11$psychoactiveMedPsych==1] <- 0
subjData_sensitivity11 <- subjData_sensitivity11[which(subjData_sensitivity11$ACROSS.INCLUDE.PSYCMEDS == 1), ]

#save file
saveRDS(subjData_sensitivity11,"/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1029_JLF_aslVox11andUpSensitivity_subjData_aslPaths.rds")

