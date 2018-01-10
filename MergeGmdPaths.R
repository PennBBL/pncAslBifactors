#Merge GMD paths with subject-level data files.

################################
### n1042 (11 and up sample) ###
################################

#Read in subject data
subjData11<-readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_JLF_aslVox11andUp_subjData.rds")
gmdPaths11<-read.csv("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_aslVox11andUp_gmdPaths.csv", header=FALSE)

#Add headers to aslPaths file
names(gmdPaths11) <- c("scanid", "GmdPath")

#Merge Asl paths data
data.merge11 <- merge(subjData11, gmdPaths11, by="scanid", all=TRUE)

#Save file.
saveRDS(data.merge11, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_JLF_aslVox11andUp_subjData_gmdPaths.rds")

