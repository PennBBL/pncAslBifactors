#################
### LOAD DATA ###
#################
#Load data
subjData <- readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_JLF_aslVox11andUp_subjData.rds")

#########################################
### LOAD LIBRARY AND CREATE VAR LISTS ###
#########################################

##Load library for nonlinear analyses
library(mgcv)

##Create lists of variables names of interest
dataAslGm <- subjData[,grep("pcasl_jlf_cbf",names(subjData))]
Asl_ROI_List <- colnames(dataAslGm)

#############################
#### STATE TRAIT ANXIETY ####
#############################

###ROIs###
#GAM model
Asl_AllSubj_Stai_ROIs <- lapply(Asl_ROI_List, function(x) {
    gam(substitute(i ~ s(age) + sex + s(age,by=sex) + pcaslRelMeanRMSMotion + State_General + Trait_General, list(i = as.name(x))), method="REML", data = subjData)
})

#Look at the model summaries
lapply(Asl_AllSubj_Stai_ROIs, summary)

#Create a vector p-values
Asl_AllSubj_ROIs_State <- sapply(Asl_AllSubj_Stai_ROIs, function(v) summary(v)$p.table[4,4])
Asl_AllSubj_ROIs_Trait <- sapply(Asl_AllSubj_Stai_ROIs, function(v) summary(v)$p.table[5,4])

#FDR correct p-values
Asl_AllSubj_ROIs_State_fdr <- p.adjust(Asl_AllSubj_ROIs_State,method="fdr")
Asl_AllSubj_ROIs_Trait_fdr <- p.adjust(Asl_AllSubj_ROIs_Trait,method="fdr")

