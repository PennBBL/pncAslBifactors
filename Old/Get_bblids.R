##############################################################
#### Create list of bblids for voxelwise T1 data analyses ####
##############################################################

##Create bblid, scanid, date list

#Read in subject level data file
subjData<-readRDS("/data/joy/BBL/projects/pncT1AcrossDisorder_Kaczkurkin/subjectData/ASL_subjectData/n1274_ASL_datarel_020716.rds")

#Select variables
IDs <- c("bblid", "scanid", "date")
bblids <- subjData[IDs]

#Remove header
names(bblids) <- NULL

#Save file.
write.table(bblids, "/data/joy/BBL/projects/pncT1AcrossDisorder_Kaczkurkin/subjectData/ASL_subjectData/bblids_scanids_date.csv", row.names=F, col.names=F, sep=",")
