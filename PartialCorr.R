#################
### LOAD DATA ###
#################

##Read in data
aslData<-readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_JLF_aslVox11andUp_subjData_clusters.rds")
connData<-readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n833_JLF_connVox11andUp_subjData_clusters.rds")

##Subset only by rows needed for correlation tables
aslVars <- c("age","sex","ageSq","pcaslRelMeanRMSMotion","Bifactor_Mood","Bifactor_Psychosis","Bifactor_Externalizing","Bifactor_Fear","Bifactor_Overall_Psychopathology","LM_asl_OverallPsy_RightPostcentralGyrus","LM_asl_OverallPsy_MidbrainSubgenACC","LM_asl_OverallPsy_LeftParahippocampalMidbrain","LM_asl_OverallPsy_LeftRostralACC","LM_asl_OverallPsy_RightDorsalACC","LM_asl_Psychosis_LeftFrontalOperculumInsula","LM_asl_Fear_RightOccipFusiform","LM_asl_Fear_LeftSubgenACC")
connVars <- c("age","sex","ageSq","restRelMeanRMSMotion","Bifactor_Mood","Bifactor_Psychosis","Bifactor_Externalizing","Bifactor_Fear","Bifactor_Overall_Psychopathology","LM_OverallPsy_dACC_conn_RightDMN","LM_OverallPsy_dACC_conn_LeftDMN","LM_OverallPsy_dACC_conn_RightCaudate","LM_OverallPsy_dACC_conn_RightSupramarginalGyrus","LM_OverallPsy_dACC_conn_RightThalamus","LM_OverallPsy_dACC_conn_LeftCaudate","LM_OverallPsy_dACC_conn_RightPutamen","LM_OverallPsy_rACC_conn_RightInfTempGyrus")

aslData_short <- aslData[aslVars]
connData_short <- connData[connVars]

#Make sex numeric (for correlations)
aslData_short$sex <- as.numeric(aslData_short$sex)
connData_short$sex <- as.numeric(connData_short$sex)

#Load library
library(psych)


####################
### CORRELATIONS ###
####################

#make correlation table
aslCorTable <- cor(aslData_short, method="spearman", use="complete.obs")
connCorTable <- cor(connData_short, method="spearman", use="complete.obs")

#Round correlation values to two decimal places
aslCorTable_rounded <- round(aslCorTable, 2)
connCorTable_rounded <- round(connCorTable, 2)

#save table
write.csv(aslCorTable_rounded,"/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/aslCorrMatrix.csv",row.names=TRUE,quote=FALSE)
write.csv(connCorTable_rounded,"/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/connCorrMatrix.csv",row.names=TRUE,quote=FALSE)


############################
### PARTIAL CORRELATIONS ###
############################

#Calculate partial correlations
aslParCorTable_Overall <- partial.r(aslData_short,c(9:14),c(1:8))
aslParCorTable_Psychosis <- partial.r(aslData_short,c(6,15),c(1:5,7:9))
aslParCorTable_Fear <- partial.r(aslData_short,c(8,16:17),c(1:7,9))

connParCorTable_Overall <- partial.r(connData_short,c(9:17),c(1:8))

#save table
write.csv(aslParCorTable_Overall,"/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/aslPartialCorrMatrix_Overall.csv",row.names=TRUE,quote=FALSE)
write.csv(aslParCorTable_Psychosis,"/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/aslPartialCorrMatrix_Psychosis.csv",row.names=TRUE,quote=FALSE)
write.csv(aslParCorTable_Fear,"/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/aslPartialCorrMatrix_Fear.csv",row.names=TRUE,quote=FALSE)

write.csv(connParCorTable_Overall,"/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/connPartialCorrMatrix_Overall.csv",row.names=TRUE,quote=FALSE)
