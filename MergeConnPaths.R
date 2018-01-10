#Merge the connectivity data file paths with the subject-level data file.

###############################
### n833 (11 and up sample) ###
###############################

#Read in subject data
subjData<-readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n833_JLF_connVox11andUp_subjData.rds")
dACCPaths<-read.csv("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n833_dorsalACC_conPaths.csv", header=FALSE)
rACCPaths<-read.csv("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n833_rostralACC_conPaths.csv", header=FALSE)

#Add headers to paths files
names(dACCPaths) <- c("bblid", "dACCPath")
names(rACCPaths) <- c("bblid", "rACCPath")

#Merge paths data
data.merge <- merge(subjData, dACCPaths, by="bblid")
data.merge2 <- merge(data.merge, rACCPaths, by="bblid")

#Save file.
saveRDS(data.merge2, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n833_JLF_connVox11andUp_subjData_conPaths.rds")
