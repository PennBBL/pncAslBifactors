##############################################
#### Prepare Subject-Level Data for MIDAS ####
##############################################

#Read subject file
subjData<-readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1259_JLF_aslVox_subjData_aslPaths.rds")

#Make sex a numeric indicator variable (0 vs 1) instead of a factor (0=female; 1=male)
subjData$sex<-as.integer(subjData$sex)
subjData$sexInd <- subjData$sex-1 

#Make the interaction variables age*sex and ageSq*sex
subjData$ageBySex <- subjData$age*subjData$sexInd
subjData$ageSqBySex <- subjData$ageSq*subjData$sexInd

#Load stringi library to replace substrings in a character vector (to change the asl paths from chead paths to cbica paths)
library(stringi)

#Find position of "/pcasl/" in strings.
pcasl_locate <- stri_locate_all(pattern='/pcasl/',subjData$AslPath,fixed=T)
pcasl_position <- matrix(unlist(pcasl_locate), ncol=2, byrow=T)

#Take string of just image name and add new path
subjData$cbicaAslPath<-paste0("/cbica/home/sattertt/n1259_pnc_asl/pncAsl_masked",substr(subjData$AslPath, pcasl_position[,1]+6, nchar(as.character(subjData$AslPath))))

#Remove chead ASL path variable from subjData
subjData$AslPath <- NULL

#Merge the cbica ASL paths.


#Subset only by rows needed for MIDAS-RAVENS analysis
subjData_short <- subjData[which(subjData$ACROSS.INCLUDE==1),c("cbicaAslPath","age","sexInd","ageSq","ageBySex","ageSqBySex","pcaslRelMeanRMSMotion","goassessItemBifactor4FactorMood","goassessItemBifactor4FactorPsych","goassessItemBifactor4FactorExt","goassessItemBifactor4FactorPhb","goassessItemBifactor4FactorOverallPsy")]

#Save .csv to use for MIDAS
write.csv(subjData_short, '/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1259_JLF_aslVox_subjData_MIDAS.csv', row.names=F, quote=F)
