#load data

subjData<-readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_JLF_aslVox11andUp_subjData_clusters.rds")

#GMD

Model1<-lm(mprage_jlf_gmd_R_ACgG ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + averageManualRating + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

Model2<-lm(mprage_jlf_gmd_L_ACgG ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + averageManualRating + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

#Volume

Model3<-lm(mprage_jlf_ct_R_ACgG ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + averageManualRating + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

Model4<-lm(mprage_jlf_ct_L_ACgG ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + averageManualRating + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

#CT

Model5<-lm(mprage_jlf_vol_R_ACgG ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + averageManualRating + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

Model6<-lm(mprage_jlf_vol_L_ACgG ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + averageManualRating + Bifactor_Mood + Bifactor_Psychosis + Bifactor_Externalizing + Bifactor_Fear + Bifactor_Overall_Psychopathology,data=subjData)

