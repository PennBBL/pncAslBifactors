############################################
#### Create list of bblids and scanids  ####
############################################

#Read data
subjData <- readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n833_JLF_connVox11andUp_subjData.rds")

#bblid list
bblids<-subjData$bblid
write.table(bblids, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n833_connVox11andUp_bblids.csv", row.names=F, col.names=F)

#scanid list
scanids<-subjData$scanid
write.table(scanids, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n833_connVox11andUp_scanids.csv", row.names=F, col.names=F)

#bblids and scanids list
IDs <- c("bblid", "scanid")
bblidsScanids <- subjData[IDs]

#Remove header
names(bblidsScanids) <- NULL

#Save file.
write.table(bblidsScanids, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n833_connVox11andUp_bblids_scanids.csv", row.names=F, col.names=F, sep=",")
