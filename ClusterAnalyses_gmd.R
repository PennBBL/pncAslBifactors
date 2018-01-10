##########################
#### CLUSTER ANALYSES ####
##########################

#Read in data
subjData<-readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_JLF_aslVox11andUp_subjData_GMDclusters.rds")

#Define GMD var list
Gmd_ROI_List <-names(subjData)[2913:2920] 

#Model1 with averageManualRating and TBV
Gmd_AslClust_Bifactors_ROIs <- lapply(Gmd_ROI_List, function(x) {
    lm(substitute(i ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + averageManualRating + mprage_antsCT_vol_TBV + Bifactor_Mood + Bifactor_Psychosis 
    + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology, list(i = as.name(x))), data = subjData)
})

#Model2 with only averageManualRating
Gmd_AslClust_Bifactors_ROIs_noTBV <- lapply(Gmd_ROI_List, function(x) {
  lm(substitute(i ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + averageManualRating + Bifactor_Mood + Bifactor_Psychosis 
                + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology, list(i = as.name(x))), data = subjData)
})

#See model results
lapply(Gmd_AslClust_Bifactors_ROIs, summary)
lapply(Gmd_AslClust_Bifactors_ROIs_noTBV, summary)

##FDR correct across tests

#Model1
#Create a vector p-values
Gmd_AslClust_ROIs_Mood <- sapply(Gmd_AslClust_Bifactors_ROIs, function(v) summary(v)$coefficients[7,4])
Gmd_AslClust_ROIs_Psych <- sapply(Gmd_AslClust_Bifactors_ROIs, function(v) summary(v)$coefficients[8,4])
Gmd_AslClust_ROIs_Ext <- sapply(Gmd_AslClust_Bifactors_ROIs, function(v) summary(v)$coefficients[9,4])
Gmd_AslClust_ROIs_Fear <- sapply(Gmd_AslClust_Bifactors_ROIs, function(v) summary(v)$coefficients[10,4])
Gmd_AslClust_ROIs_OverallPsy <- sapply(Gmd_AslClust_Bifactors_ROIs, function(v) summary(v)$coefficients[11,4])

#FDR correct p-values
Gmd_AslClust_ROIs_Mood_fdr <- p.adjust(Gmd_AslClust_ROIs_Mood,method="fdr")
Gmd_AslClust_ROIs_Psych_fdr <- p.adjust(Gmd_AslClust_ROIs_Psych,method="fdr")
Gmd_AslClust_ROIs_Ext_fdr <- p.adjust(Gmd_AslClust_ROIs_Ext,method="fdr")
Gmd_AslClust_ROIs_Fear_fdr <- p.adjust(Gmd_AslClust_ROIs_Fear,method="fdr")
Gmd_AslClust_ROIs_OverallPsy_fdr <- p.adjust(Gmd_AslClust_ROIs_OverallPsy,method="fdr")

#Model2
#Create a vector p-values
Gmd_AslClust_ROIs_Mood2 <- sapply(Gmd_AslClust_Bifactors_ROIs_noTBV, function(v) summary(v)$coefficients[7,4])
Gmd_AslClust_ROIs_Psych2 <- sapply(Gmd_AslClust_Bifactors_ROIs_noTBV, function(v) summary(v)$coefficients[8,4])
Gmd_AslClust_ROIs_Ext2 <- sapply(Gmd_AslClust_Bifactors_ROIs_noTBV, function(v) summary(v)$coefficients[9,4])
Gmd_AslClust_ROIs_Fear2 <- sapply(Gmd_AslClust_Bifactors_ROIs_noTBV, function(v) summary(v)$coefficients[10,4])
Gmd_AslClust_ROIs_OverallPsy2 <- sapply(Gmd_AslClust_Bifactors_ROIs_noTBV, function(v) summary(v)$coefficients[11,4])

#FDR correct p-values
Gmd_AslClust_ROIs_Mood2_fdr <- p.adjust(Gmd_AslClust_ROIs_Mood2,method="fdr")
Gmd_AslClust_ROIs_Psych2_fdr <- p.adjust(Gmd_AslClust_ROIs_Psych2,method="fdr")
Gmd_AslClust_ROIs_Ext2_fdr <- p.adjust(Gmd_AslClust_ROIs_Ext2,method="fdr")
Gmd_AslClust_ROIs_Fear2_fdr <- p.adjust(Gmd_AslClust_ROIs_Fear2,method="fdr")
Gmd_AslClust_ROIs_OverallPsy2_fdr <- p.adjust(Gmd_AslClust_ROIs_OverallPsy2,method="fdr")
