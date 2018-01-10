#Read in subject data
subjData<-readRDS('/data/joy/BBL/projects/pncT1AcrossDisorder_Kaczkurkin/subjectData/ASL_subjectData/n1274_ASL_datarel_020716.rds')
aslPaths<-read.csv("/data/joy/BBL/projects/pncT1AcrossDisorder_Kaczkurkin/subjectData/ASL_subjectData/n1274_AslPaths.csv", header=FALSE)

#Add headers to aslPaths file and change empty cells to NA.
names(aslPaths) <- c("bblid", "scanid", "aslPath")
aslPaths$aslPath[which(aslPaths$aslPath == "")] <- NA

#Merge ASL paths data
#WARNING: Merging files with unequal cases will cause the non-matched bblids to be deleted (which is not what we want in this case, so we have to add "all=TRUE").
data.merge <- merge(subjData, aslPaths, by=c("bblid","scanid"), all=TRUE)

#Save file.
saveRDS(data.merge, "/data/joy/BBL/projects/pncT1AcrossDisorder_Kaczkurkin/subjectData/ASL_subjectData/n1274_ASL_datarel_020716_aslPaths.rds")

#Remove the 17 people with missing mom edu data and save file with different name (needed for SVR analyses, which can't handle variables with missing data). 
data.merge2<-data.merge[!is.na(data.merge$meduCnbGo1), ]

#Save file.
saveRDS(data.merge2, "/data/joy/BBL/projects/pncT1AcrossDisorder_Kaczkurkin/subjectData/ASL_subjectData/n1257_ASL_datarel_020716_aslPaths.rds")
