##########################
#### CLUSTER ANALYSES ####
##########################

#Read in data
subjData<-readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_JLF_aslVox11andUp_subjData_clusters.rds")

#### OVERALL PSYC ####

#Specify models for clusters found to be significantly related to OverallPsy during voxelwise analyses:
#Models tested: a) age*sex, b) Overall*age, c) Overall*sex
#59 - Right postcentral gyrus (LM_asl_OverallPsy_RightPostcentralGyrus)
#58 - Midbrain (near subgen ACC) (LM_asl_OverallPsy_MidbrainSubgenACC)
#57 - Left parahippocampal/midbrain (LM_asl_OverallPsy_LeftParahippocampalMidbrain)
#56 - Left rostral ACC (LM_asl_OverallPsy_LeftRostralACC)
#55 - Right dorsal ACC (LM_asl_OverallPsy_RightDorsalACC)

#Right postcentral gyrus
Model1a<-lm(LM_asl_OverallPsy_RightPostcentralGyrus ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

Model1b<-lm(LM_asl_OverallPsy_RightPostcentralGyrus ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model1c<-lm(LM_asl_OverallPsy_RightPostcentralGyrus ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model1d<-lm(LM_asl_OverallPsy_RightPostcentralGyrus ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology,data=subjData)

Model1e<-lm(LM_asl_OverallPsy_RightPostcentralGyrus ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model1f<-lm(LM_asl_OverallPsy_RightPostcentralGyrus ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model1g<-lm(LM_asl_OverallPsy_RightPostcentralGyrus ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age + Bifactor_Overall_Psychopathology*sex + Bifactor_Overall_Psychopathology*age*sex,data=subjData)


#Midbrain (near subgen ACC)
Model2a<-lm(LM_asl_OverallPsy_MidbrainSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

Model2b<-lm(LM_asl_OverallPsy_MidbrainSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model2c<-lm(LM_asl_OverallPsy_MidbrainSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model2d<-lm(LM_asl_OverallPsy_MidbrainSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology,data=subjData)

Model2e<-lm(LM_asl_OverallPsy_MidbrainSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model2f<-lm(LM_asl_OverallPsy_MidbrainSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model2g<-lm(LM_asl_OverallPsy_MidbrainSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age + Bifactor_Overall_Psychopathology*sex + Bifactor_Overall_Psychopathology*age*sex,data=subjData)


#Left parahippocampal/midbrain
Model3a<-lm(LM_asl_OverallPsy_LeftParahippocampalMidbrain ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

Model3b<-lm(LM_asl_OverallPsy_LeftParahippocampalMidbrain ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model3c<-lm(LM_asl_OverallPsy_LeftParahippocampalMidbrain ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model3d<-lm(LM_asl_OverallPsy_LeftParahippocampalMidbrain ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology,data=subjData)

Model3e<-lm(LM_asl_OverallPsy_LeftParahippocampalMidbrain ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model3f<-lm(LM_asl_OverallPsy_LeftParahippocampalMidbrain ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model3g<-lm(LM_asl_OverallPsy_LeftParahippocampalMidbrain ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age + Bifactor_Overall_Psychopathology*sex + Bifactor_Overall_Psychopathology*age*sex,data=subjData)


#Left rostral ACC
Model4a<-lm(LM_asl_OverallPsy_LeftRostralACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

Model4b<-lm(LM_asl_OverallPsy_LeftRostralACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model4c<-lm(LM_asl_OverallPsy_LeftRostralACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model4d<-lm(LM_asl_OverallPsy_LeftRostralACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology,data=subjData)

Model4e<-lm(LM_asl_OverallPsy_LeftRostralACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model4f<-lm(LM_asl_OverallPsy_LeftRostralACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model4g<-lm(LM_asl_OverallPsy_LeftRostralACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age + Bifactor_Overall_Psychopathology*sex + Bifactor_Overall_Psychopathology*age*sex,data=subjData)


#Right dorsal ACC
Model5a<-lm(LM_asl_OverallPsy_RightDorsalACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

Model5b<-lm(LM_asl_OverallPsy_RightDorsalACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model5c<-lm(LM_asl_OverallPsy_RightDorsalACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model5d<-lm(LM_asl_OverallPsy_RightDorsalACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology,data=subjData)

Model5e<-lm(LM_asl_OverallPsy_RightDorsalACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model5f<-lm(LM_asl_OverallPsy_RightDorsalACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model5g<-lm(LM_asl_OverallPsy_RightDorsalACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age + Bifactor_Overall_Psychopathology*sex + Bifactor_Overall_Psychopathology*age*sex,data=subjData)


#### PSYCHOSIS ####

#Specify models for clusters found to be significantly related to Psychosis during voxelwise analyses:
#Models tested: a) age*sex, b) Overall*age, c) Overall*sex
#26 - Left frontal operculum/left insula (LM_asl_Psychosis_LeftFrontalOperculumInsula)

#Left frontal operculum/left insula
Model6a<-lm(LM_asl_Psychosis_LeftFrontalOperculumInsula ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

Model6b<-lm(LM_asl_Psychosis_LeftFrontalOperculumInsula ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model6c<-lm(LM_asl_Psychosis_LeftFrontalOperculumInsula ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model6d<-lm(LM_asl_Psychosis_LeftFrontalOperculumInsula ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology,data=subjData)

Model6e<-lm(LM_asl_Psychosis_LeftFrontalOperculumInsula ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model6f<-lm(LM_asl_Psychosis_LeftFrontalOperculumInsula ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model6g<-lm(LM_asl_Psychosis_LeftFrontalOperculumInsula ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age + Bifactor_Overall_Psychopathology*sex + Bifactor_Overall_Psychopathology*age*sex,data=subjData)


#### FEAR ####

#Specify models for clusters found to be significantly related to Fear during voxelwise analyses:
#Models tested: a) age*sex, b) Overall*age, c) Overall*sex
#38 - Right occipital/fusiform gyrus (LM_asl_Fear_RightOccipFusiform)
#37 - Left subgenual ACC (LM_asl_Fear_LeftSubgenACC)

#Right occipital/fusiform gyrus
Model7a<-lm(LM_asl_Fear_RightOccipFusiform ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

Model7b<-lm(LM_asl_Fear_RightOccipFusiform ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model7c<-lm(LM_asl_Fear_RightOccipFusiform ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model7d<-lm(LM_asl_Fear_RightOccipFusiform ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology,data=subjData)

Model7e<-lm(LM_asl_Fear_RightOccipFusiform ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model7f<-lm(LM_asl_Fear_RightOccipFusiform ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model7g<-lm(LM_asl_Fear_RightOccipFusiform ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age + Bifactor_Overall_Psychopathology*sex + Bifactor_Overall_Psychopathology*age*sex,data=subjData)


#Left subgenual ACC
Model8a<-lm(LM_asl_Fear_LeftSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

Model8b<-lm(LM_asl_Fear_LeftSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model8c<-lm(LM_asl_Fear_LeftSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model8d<-lm(LM_asl_Fear_LeftSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology,data=subjData)

Model8e<-lm(LM_asl_Fear_LeftSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age,data=subjData)

Model8f<-lm(LM_asl_Fear_LeftSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*sex,data=subjData)

Model8g<-lm(LM_asl_Fear_LeftSubgenACC ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology + Bifactor_Overall_Psychopathology*age + Bifactor_Overall_Psychopathology*sex + Bifactor_Overall_Psychopathology*age*sex,data=subjData)

#FDR correct the age effect p-values
p<-c(0.0113,0.0457,0.05087,0.01268,2.21e-05)
p_fdr<-p.adjust(p,method="fdr")
