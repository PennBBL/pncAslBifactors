############################################
#### Create list of bblids and scanids  ####
############################################

##Create bblid and scanid list

#Read in subject level data file
subjData<-readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n833_JLF_connVox11andUp_subjData.rds")

#Select variables
IDs <- subjData$bblid

#Remove header
names(bblids) <- NULL

#Save file.
write.table(bblids, "/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n833_connVox11andUp_bblids_scanids.csv", row.names=F, col.names=F, sep=",")
