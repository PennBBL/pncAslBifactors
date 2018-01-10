To see if two different	length files have the same bblids:

#Read in data
x<-read.csv("GOA_itemwise_bifactor_scores_12-17-2016.csv")
subjData<-read.csv("n1601_go1_datarel_020716.csv")

#Pull out the bblids
All_bblids<-x$bblid
n1601_bblids<-subjData$bblid

#Make a data frame with variables with 0's for one file and 1's for the other file.
All_bblids<-as.data.frame(All_bblids)
All_bblids$All<-0
n1601_bblids<-as.data.frame(n1601_bblids)
n1601_bblids$n1601<-1

#Rename the bblids the same name in both files
names(n1601_bblids)[names(n1601_bblids)=="n1601_bblids"]<-"bblids"
names(All_bblids)[names(All_bblids)=="All_bblids"]<-"bblids"

#Merge the files
merged<-merge(n1601_bblids,All_bblids,by="bblid",all=TRUE)

#Now scroll through the data to find NAs in "All"
merged
