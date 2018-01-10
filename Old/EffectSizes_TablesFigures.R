######################
#### READ IN DATA ####
######################

subjData<-readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1029_JLF_aslVox11andUp_subjData_clusters.rds")

#########################################
#### MAKE DIAGNOSIS FACTOR VARIABLES ####
#########################################

##Calculate means, sds, percentage of females, percentage of White, and Ns for all diagnoses. 

#ADHD
numAdd<-sum(subjData$Add, na.rm=TRUE)
ageAddMean<-mean(subjData$age[which(subjData$Add==1)],na.rm=T)
ageAddSd<-sd(subjData$age[which(subjData$Add==1)],na.rm=T)
femAdd<-length(which(subjData$sex=="female" & subjData$Add==1))/numAdd
whiteAdd<-(length(which(subjData$race==1 & subjData$Add==1)))/numAdd
meduAddMean<-mean(subjData$meduCnbGo1[which(subjData$Add==1)],na.rm=T)
meduAddSd<-sd(subjData$meduCnbGo1[which(subjData$Add==1)],na.rm=T)

#Agoraphobia
numAgr<-sum(subjData$Agr, na.rm=TRUE)
ageAgrMean<-mean(subjData$age[which(subjData$Agr==1)],na.rm=T)
ageAgrSd<-sd(subjData$age[which(subjData$Agr==1)],na.rm=T)
femAgr<-length(which(subjData$sex=="female" & subjData$Agr==1))/numAgr
whiteAgr<-(length(which(subjData$race==1 & subjData$Agr==1)))/numAgr
meduAgrMean<-mean(subjData$meduCnbGo1[which(subjData$Agr==1)],na.rm=T)
meduAgrSd<-sd(subjData$meduCnbGo1[which(subjData$Agr==1)],na.rm=T)

#Anorexia
numAno<-sum(subjData$Ano, na.rm=TRUE)
ageAnoMean<-mean(subjData$age[which(subjData$Ano==1)],na.rm=T)
ageAnoSd<-sd(subjData$age[which(subjData$Ano==1)],na.rm=T)
femAno<-length(which(subjData$sex=="female" & subjData$Ano==1))/numAno
whiteAno<-(length(which(subjData$race==1 & subjData$Ano==1)))/numAno
meduAnoMean<-mean(subjData$meduCnbGo1[which(subjData$Ano==1)],na.rm=T)
meduAnoSd<-sd(subjData$meduCnbGo1[which(subjData$Ano==1)],na.rm=T)

#Bulimia
numBul<-sum(subjData$Bul, na.rm=TRUE)
ageBulMean<-mean(subjData$age[which(subjData$Bul==1)],na.rm=T)
ageBulSd<-sd(subjData$age[which(subjData$Bul==1)],na.rm=T)
femBul<-length(which(subjData$sex=="female" & subjData$Bul==1))/numBul
whiteBul<-(length(which(subjData$race==1 & subjData$Bul==1)))/numBul
meduBulMean<-mean(subjData$meduCnbGo1[which(subjData$Bul==1)],na.rm=T)
meduBulSd<-sd(subjData$meduCnbGo1[which(subjData$Bul==1)],na.rm=T)

#Conduct Disorder
numCon<-sum(subjData$Con, na.rm=TRUE)
ageConMean<-mean(subjData$age[which(subjData$Con==1)],na.rm=T)
ageConSd<-sd(subjData$age[which(subjData$Con==1)],na.rm=T)
femCon<-length(which(subjData$sex=="female" & subjData$Con==1))/numCon
whiteCon<-(length(which(subjData$race==1 & subjData$Con==1)))/numCon
meduConMean<-mean(subjData$meduCnbGo1[which(subjData$Con==1)],na.rm=T)
meduConSd<-sd(subjData$meduCnbGo1[which(subjData$Con==1)],na.rm=T)

#Generalized Anxiety Disorder
numGad<-sum(subjData$Gad, na.rm=TRUE)
ageGadMean<-mean(subjData$age[which(subjData$Gad==1)],na.rm=T)
ageGadSd<-sd(subjData$age[which(subjData$Gad==1)],na.rm=T)
femGad<-length(which(subjData$sex=="female" & subjData$Gad==1))/numGad
whiteGad<-(length(which(subjData$race==1 & subjData$Gad==1)))/numGad
meduGadMean<-mean(subjData$meduCnbGo1[which(subjData$Gad==1)],na.rm=T)
meduGadSd<-sd(subjData$meduCnbGo1[which(subjData$Gad==1)],na.rm=T)

#Major Depressive Disorder
numMdd<-sum(subjData$Mdd, na.rm=TRUE)
ageMddMean<-mean(subjData$age[which(subjData$Mdd==1)],na.rm=T)
ageMddSd<-sd(subjData$age[which(subjData$Mdd==1)],na.rm=T)
femMdd<-length(which(subjData$sex=="female" & subjData$Mdd==1))/numMdd
whiteMdd<-(length(which(subjData$race==1 & subjData$Mdd==1)))/numMdd
meduMddMean<-mean(subjData$meduCnbGo1[which(subjData$Mdd==1)],na.rm=T)
meduMddSd<-sd(subjData$meduCnbGo1[which(subjData$Mdd==1)],na.rm=T)

#Mania
numMan<-sum(subjData$Man, na.rm=TRUE)
ageManMean<-mean(subjData$age[which(subjData$Man==1)],na.rm=T)
ageManSd<-sd(subjData$age[which(subjData$Man==1)],na.rm=T)
femMan<-length(which(subjData$sex=="female" & subjData$Man==1))/numMan
whiteMan<-(length(which(subjData$race==1 & subjData$Man==1)))/numMan
meduManMean<-mean(subjData$meduCnbGo1[which(subjData$Man==1)],na.rm=T)
meduManSd<-sd(subjData$meduCnbGo1[which(subjData$Man==1)],na.rm=T)

#OCD
numOcd<-sum(subjData$Ocd, na.rm=TRUE)
ageOcdMean<-mean(subjData$age[which(subjData$Ocd==1)],na.rm=T)
ageOcdSd<-sd(subjData$age[which(subjData$Ocd==1)],na.rm=T)
femOcd<-length(which(subjData$sex=="female" & subjData$Ocd==1))/numOcd
whiteOcd<-(length(which(subjData$race==1 & subjData$Ocd==1)))/numOcd
meduOcdMean<-mean(subjData$meduCnbGo1[which(subjData$Ocd==1)],na.rm=T)
meduOcdSd<-sd(subjData$meduCnbGo1[which(subjData$Ocd==1)],na.rm=T)

#Oppositional Defiant Disorder
numOdd<-sum(subjData$Odd, na.rm=TRUE)
ageOddMean<-mean(subjData$age[which(subjData$Odd==1)],na.rm=T)
ageOddSd<-sd(subjData$age[which(subjData$Odd==1)],na.rm=T)
femOdd<-length(which(subjData$sex=="female" & subjData$Odd==1))/numOdd
whiteOdd<-(length(which(subjData$race==1 & subjData$Odd==1)))/numOdd
meduOddMean<-mean(subjData$meduCnbGo1[which(subjData$Odd==1)],na.rm=T)
meduOddSd<-sd(subjData$meduCnbGo1[which(subjData$Odd==1)],na.rm=T)

#Panic Disorder
numPan<-sum(subjData$Pan, na.rm=TRUE)
agePanMean<-mean(subjData$age[which(subjData$Pan==1)],na.rm=T)
agePanSd<-sd(subjData$age[which(subjData$Pan==1)],na.rm=T)
femPan<-length(which(subjData$sex=="female" & subjData$Pan==1))/numPan
whitePan<-(length(which(subjData$race==1 & subjData$Pan==1)))/numPan
meduPanMean<-mean(subjData$meduCnbGo1[which(subjData$Pan==1)],na.rm=T)
meduPanSd<-sd(subjData$meduCnbGo1[which(subjData$Pan==1)],na.rm=T)

#Psychosis
numPs<-sum(subjData$Ps, na.rm=TRUE)
agePsMean<-mean(subjData$age[which(subjData$Ps==1)],na.rm=T)
agePsSd<-sd(subjData$age[which(subjData$Ps==1)],na.rm=T)
femPs<-length(which(subjData$sex=="female" & subjData$Ps==1))/numPs
whitePs<-(length(which(subjData$race==1 & subjData$Ps==1)))/numPs
meduPsMean<-mean(subjData$meduCnbGo1[which(subjData$Ps==1)],na.rm=T)
meduPsSd<-sd(subjData$meduCnbGo1[which(subjData$Ps==1)],na.rm=T)

#Posttraumatic Stress Disorder
numPtd<-sum(subjData$Ptd, na.rm=TRUE)
agePtdMean<-mean(subjData$age[which(subjData$Ptd==1)],na.rm=T)
agePtdSd<-sd(subjData$age[which(subjData$Ptd==1)],na.rm=T)
femPtd<-length(which(subjData$sex=="female" & subjData$Ptd==1))/numPtd
whitePtd<-(length(which(subjData$race==1 & subjData$Ptd==1)))/numPtd
meduPtdMean<-mean(subjData$meduCnbGo1[which(subjData$Ptd==1)],na.rm=T)
meduPtdSd<-sd(subjData$meduCnbGo1[which(subjData$Ptd==1)],na.rm=T)

#Separation Anxiety Disorder
numSep<-sum(subjData$Sep, na.rm=TRUE)
ageSepMean<-mean(subjData$age[which(subjData$Sep==1)],na.rm=T)
ageSepSd<-sd(subjData$age[which(subjData$Sep==1)],na.rm=T)
femSep<-length(which(subjData$sex=="female" & subjData$Sep==1))/numSep
whiteSep<-(length(which(subjData$race==1 & subjData$Sep==1)))/numSep
meduSepMean<-mean(subjData$meduCnbGo1[which(subjData$Sep==1)],na.rm=T)
meduSepSd<-sd(subjData$meduCnbGo1[which(subjData$Sep==1)],na.rm=T)

#Social Anxiety Disorder
numSoc<-sum(subjData$Soc, na.rm=TRUE)
ageSocMean<-mean(subjData$age[which(subjData$Soc==1)],na.rm=T)
ageSocSd<-sd(subjData$age[which(subjData$Soc==1)],na.rm=T)
femSoc<-length(which(subjData$sex=="female" & subjData$Soc==1))/numSoc
whiteSoc<-(length(which(subjData$race==1 & subjData$Soc==1)))/numSoc
meduSocMean<-mean(subjData$meduCnbGo1[which(subjData$Soc==1)],na.rm=T)
meduSocSd<-sd(subjData$meduCnbGo1[which(subjData$Soc==1)],na.rm=T)

#Specific Phobia
numSph<-sum(subjData$Sph, na.rm=TRUE)
ageSphMean<-mean(subjData$age[which(subjData$Sph==1)],na.rm=T)
ageSphSd<-sd(subjData$age[which(subjData$Sph==1)],na.rm=T)
femSph<-length(which(subjData$sex=="female" & subjData$Sph==1))/numSph
whiteSph<-(length(which(subjData$race==1 & subjData$Sph==1)))/numSph
meduSphMean<-mean(subjData$meduCnbGo1[which(subjData$Sph==1)],na.rm=T)
meduSphSd<-sd(subjData$meduCnbGo1[which(subjData$Sph==1)],na.rm=T)

#Typically Developing
numTd<-sum(subjData$Td, na.rm=TRUE)
ageTdMean<-mean(subjData$age[which(subjData$Td==1)],na.rm=T)
ageTdSd<-sd(subjData$age[which(subjData$Td==1)],na.rm=T)
femTd<-length(which(subjData$sex=="female" & subjData$Td==1))/numTd
whiteTd<-(length(which(subjData$race==1 & subjData$Td==1)))/numTd
meduTdMean<-mean(subjData$meduCnbGo1[which(subjData$Td==1)],na.rm=T)
meduTdSd<-sd(subjData$meduCnbGo1[which(subjData$Td==1)],na.rm=T)



###############################
#### TABLE 1: DEMOGRAPHICS ####
###############################

#Combine variables
dxNames<-c("bblid","Td","Add","Agr","Ano","Bul","Con","Gad","Man","Mdd","Ocd","Odd","Pan","Ps","Ptd","Sep","Soc","Sph")
dxDf<-subjData[,dxNames]

numComb<-c(numTd,numAdd,numAgr,numAno,numBul,numCon,numGad,numMdd,numMan,numOcd,numOdd,numPan,numPs,numPtd,numSep,numSoc,numSph)

ageMeanComb<-round(c(ageTdMean,ageAddMean,ageAgrMean,ageAnoMean,ageBulMean,ageConMean,ageGadMean,ageMddMean,ageManMean,ageOcdMean,ageOddMean,agePanMean,agePsMean,agePtdMean,ageSepMean,ageSocMean,ageSphMean),2)

ageSdComb<-round(c(ageTdSd,ageAddSd,ageAgrSd,ageAnoSd,ageBulSd,ageConSd,ageGadSd,ageMddSd,ageManSd,ageOcdSd,ageOddSd,agePanSd,agePsSd,agePtdSd,ageSepSd,ageSocSd,ageSphSd),2)

femComb<-round(c(femTd,femAdd,femAgr,femAno,femBul,femCon,femGad,femMdd,femMan,femOcd,femOdd,femPan,femPs,femPtd,femSep,femSoc,femSph),3)*100

whiteComb<-round(c(whiteTd,whiteAdd,whiteAgr,whiteAno,whiteBul,whiteCon,whiteGad,whiteMdd,whiteMan,whiteOcd,whiteOdd,whitePan,whitePs,whitePtd,whiteSep,whiteSoc,whiteSph),3)*100

meduMeanComb<-round(c(meduTdMean,meduAddMean,meduAgrMean,meduAnoMean,meduBulMean,meduConMean,meduGadMean,meduMddMean,meduManMean,meduOcdMean,meduOddMean,meduPanMean,meduPsMean,meduPtdMean,meduSepMean,meduSocMean,meduSphMean),2)

meduSdComb<-round(c(meduTdSd,meduAddSd,meduAgrSd,meduAnoSd,meduBulSd,meduConSd,meduGadSd,meduMddSd,meduManSd,meduOcdSd,meduOddSd,meduPanSd,meduPsSd,meduPtdSd,meduSepSd,meduSocSd,meduSphSd),2)

#MAKE TABLE
dxNamesFull<-c("Typically Developing","ADHD","Agoraphobia","Anorexia","Bulimia","Conduct Disorder","Generalized Anxiety Disorder","Major Depression","Mania","Obsessive-Compulsive Disorder","Oppositional Defiant Disorder","Panic","Psychosis-spectrum","PTSD","Separation Anxiety","Social Phobia","Specific Phobia")
table1<-as.data.frame(matrix(nrow=17,ncol=7))
row.names(table1)<-dxNamesFull
colnames(table1)[1]<-"N"
colnames(table1)[2]<-"Female (%)"
colnames(table1)[3]<-"Caucasian (%)"
colnames(table1)[4]<-"Mean Age"
colnames(table1)[5]<-"SD Age"
colnames(table1)[6]<-"Mean Maternal Education (Years)"
colnames(table1)[7]<-"SD Maternal Education"
table1[,1]<-numComb
table1[,2]<-femComb
table1[,3]<-whiteComb
table1[,4]<-ageMeanComb
table1[,5]<-ageSdComb
table1[,6]<-meduMeanComb
table1[,7]<-meduSdComb

#SAVE TABLE
write.csv(table1,"/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/Table1.csv",row.names=TRUE,quote=FALSE)


 
######################################################
#### FIGURE 1a: CORR TRAITS BY SCREENING CATEGORY ####
######################################################

#Create table with bifactor means and sds only for diagnoses with >20 subjects.
facTbl<-as.data.frame(matrix(nrow=13,ncol=8))
colnames(facTbl)[1]<-"MoodMean"
colnames(facTbl)[2]<-"MoodSem"
colnames(facTbl)[3]<-"PsychosisMean"
colnames(facTbl)[4]<-"PsychosisSem"
colnames(facTbl)[5]<-"ExternalizingMean"
colnames(facTbl)[6]<-"ExternalizingSem"
colnames(facTbl)[7]<-"FearMean"
colnames(facTbl)[8]<-"FearSem"

#Name the rows
dxNamesShort<-c("ADHD","Agoraphobia","Conduct","GAD","MDD","OCD","ODD","Psychosis","PTSD","Separation Anxiety","Social Phobia","Specific Phobia","TD")

row.names(facTbl)<-dxNamesShort

dxs<-c("Add","Agr","Con","Gad","Mdd","Ocd","Odd","Ps","Ptd","Sep","Soc","Sph","Td")

#Calculate means and standard deviations
for (i in 1:13){
        dx<-dxs[i]
        print(dx)
        y<-subjData[,dx]

        facTbl[i,1]<-mean(subjData$Mood[which(y==1)],na.rm=TRUE)
        facTbl[i,2]<-sd(subjData$Mood[which(y==1)],na.rm=TRUE)/sqrt(length(which(y==1)))

        facTbl[i,3]<-mean(subjData$Psychosis[which(y==1)],na.rm=TRUE)
        facTbl[i,4]<-sd(subjData$Psychosis[which(y==1)],na.rm=TRUE)/sqrt(length(which(y==1)))

        facTbl[i,5]<-mean(subjData$Externalizing[which(y==1)],na.rm=TRUE)
        facTbl[i,6]<-sd(subjData$Externalizing[which(y==1)],na.rm=TRUE)/sqrt(length(which(y==1)))

        facTbl[i,7]<-mean(subjData$Fear[which(y==1)],na.rm=TRUE)
        facTbl[i,8]<-sd(subjData$Fear[which(y==1)],na.rm=TRUE)/sqrt(length(which(y==1)))

}


#Reshape to long format
library(reshape2)
facTbl$group<-as.factor(dxs)
facTblSem<-facTbl[,c(2,4,6,8,9)]
facTblMean<-facTbl[,c(1,3,5,7,9)]
facTblMeanLong<-melt(facTblMean,id.vars="group",variable.name="factor",value.name="meanScore")
facTblSemLong<-melt(facTblSem,id.vars="group",variable.name="factor",value.name="semScore")
facTblLong<-facTblMeanLong
facTblLong$semScore<-facTblSemLong$semScore

#Remove empty factors
facTblLong$group<-factor(facTblLong$group)


#Plot w/ ggplot
library(ggplot2)
library(grid)

#Colors used: #325194 = blue (Mood), #943282 = purple (Psychosis), #B3141C = red (Behavioral), #F58311 = orange (Fear)

Fig1a<-ggplot(facTblLong, aes(x=group, y=meanScore,fill=factor)) +
        ylab("Factor Score (z)") + xlab("") + ggtitle("Correlated Dimensions of Psychopathology by Screening Diagnosis") +
	geom_bar(stat="identity",position=position_dodge()) +
        scale_fill_manual(values=c("#325194","#943282","#B3141C","#F58311"), breaks=c("MoodMean","PsychosisMean","ExternalizingMean","FearMean"),
	labels=c("Mood", "Psychosis", "Behavioral", "Fear")) +
	theme(axis.title.y = element_text(size = rel(1.5), angle = 90)) + theme(legend.text = element_text(size = 10), legend.justification=c(0.5,0.5), legend.position=c(.9,.9)) +
	theme(plot.title = element_text(size = rel(1.5), vjust = 2)) + theme(axis.text.x = element_text(size = rel(1.25), colour="black")) +
	theme(axis.text.y = element_text(size = rel(1.25), colour="black")) + guides(fill=guide_legend(title=NULL)) +
	scale_x_discrete(breaks=c("Add","Agr","Con","Gad","Mdd","Ocd","Odd","Ps","Ptd","Sep","Soc","Sph","Td"), labels=c("ADHD","Agoraphobia","Conduct","GAD","MDD","OCD","ODD",
	"Psychosis","PTSD","Separation Anx","Social Anx","Specific Phobia","TD")) + theme(plot.margin = unit(c(1,2.5,1,0.5), "cm")) +
	theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line.x = element_line(colour = "black"), 
	axis.line.y = element_line(colour = "black"))

#see colors used in plot (leave "data" specified as is)
Plot1a<-ggplot_build(Fig1a)$data

ggsave(file="/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/Figure1a_CorrTraitsByDiag.png", width = 15, height = 5, units = "in", dpi = 300)


##helpful ggplot guides:
#ylab- y label title
#xlab- x label title
#ggtitle- plot title
#geom_bar - make bar plot
#geom_errorbar - create error-bars on plot
#scale_fill_manual- manually change the colors and names of the legend labels
#Within theme(axis.title.y = element_text()) or theme(axis.title.x = element_text()) or theme(plot.title = element_text()) you can change:
        #size = size of axis title
        #angle = orientation of text
        #vjust = vertical adjustment of text from axes
        #hjust = horizontal adjustment of text from axes
        #color = change color of text
#Above also works for axis tick labels using theme(axis.text.y=element_text()) or theme(axis.text.x=element_text())
#guides(fill=guide_legend(title=NULL)) - remove legend title
#scale_x_discrete(breaks=c("",""), labels=c("","")) - take the pre-existing axis labels and give them new labels
#theme(plot.margin = unit(c(1,2.5,1,0.5), "cm")) - change the margins of the plot to add a little extra room around the entire figure. Note: this requires the function "unit" from the package "grid" to work. unit(c(top,right,bottom,left))
#geom_bar(size=0.3) = changes the thickness of the black line around each bar (1 = thicker, .03 = thinner)
#geom_bar(color="black") = changes the color of the black line around each bar (remove this command to remove the black outlines).
#legend.justification = defines which side of the legend that the legend.position coordinates refer to (can use left, right, centre or numeric value (x = between 0 and 1))
#legend.position = move the legend (accepts left, right, top, bottom or define relative coordinates on plot c(x, y) between 0 and 1) 



####################################################
#### FIGURE 1b: BIFACTORS BY SCREENING CATEGORY ####
####################################################

#Create table with bifactor means and sds only for diagnoses with >20 subjects.
facTbl2<-as.data.frame(matrix(nrow=13,ncol=10))
colnames(facTbl2)[1]<-"OverallMean"
colnames(facTbl2)[2]<-"OverallSem"
colnames(facTbl2)[3]<-"MoodMean"
colnames(facTbl2)[4]<-"MoodSem"
colnames(facTbl2)[5]<-"PsychosisMean"
colnames(facTbl2)[6]<-"PsychosisSem"
colnames(facTbl2)[7]<-"ExternalizingMean"
colnames(facTbl2)[8]<-"ExternalizingSem"
colnames(facTbl2)[9]<-"PhobiasMean"
colnames(facTbl2)[10]<-"PhobiasSem"

#Name the rows
dxNamesShort2<-c("ADHD","Agoraphobia","Conduct","GAD","MDD","OCD","ODD","Psychosis","PTSD","Separation Anxiety","Social Phobia","Specific Phobia","TD")

row.names(facTbl2)<-dxNamesShort2

dxs2<-c("Add","Agr","Con","Gad","Mdd","Ocd","Odd","Ps","Ptd","Sep","Soc","Sph","Td")

#Calculate means and standard deviations
for (i in 1:13){
        dx<-dxs2[i]
        print(dx)
        y<-subjData[,dx]

        facTbl2[i,1]<-mean(subjData$goassessItemBifactor4FactorOverallPsy[which(y==1)],na.rm=TRUE)
        facTbl2[i,2]<-sd(subjData$goassessItemBifactor4FactorOverallPsy[which(y==1)],na.rm=TRUE)/sqrt(length(which(y==1)))

        facTbl2[i,3]<-mean(subjData$goassessItemBifactor4FactorMood[which(y==1)],na.rm=TRUE)
        facTbl2[i,4]<-sd(subjData$goassessItemBifactor4FactorMood[which(y==1)],na.rm=TRUE)/sqrt(length(which(y==1)))

        facTbl2[i,5]<-mean(subjData$goassessItemBifactor4FactorPsych[which(y==1)],na.rm=TRUE)
        facTbl2[i,6]<-sd(subjData$goassessItemBifactor4FactorPsych[which(y==1)],na.rm=TRUE)/sqrt(length(which(y==1)))

        facTbl2[i,7]<-mean(subjData$goassessItemBifactor4FactorExt[which(y==1)],na.rm=TRUE)
        facTbl2[i,8]<-sd(subjData$goassessItemBifactor4FactorExt[which(y==1)],na.rm=TRUE)/sqrt(length(which(y==1)))

        facTbl2[i,9]<-mean(subjData$goassessItemBifactor4FactorPhb[which(y==1)],na.rm=TRUE)
        facTbl2[i,10]<-sd(subjData$goassessItemBifactor4FactorPhb[which(y==1)],na.rm=TRUE)/sqrt(length(which(y==1)))

}


#Reshape to long format
library(reshape2)
facTbl2$group<-as.factor(dxs2)
facTbl2Sem<-facTbl2[,c(2,4,6,8,10,11)]
facTbl2Mean<-facTbl2[,c(1,3,5,7,9,11)]
facTbl2MeanLong<-melt(facTbl2Mean,id.vars="group",variable.name="factor",value.name="meanScore")
facTbl2SemLong<-melt(facTbl2Sem,id.vars="group",variable.name="factor",value.name="semScore")
facTbl2Long<-facTbl2MeanLong
facTbl2Long$semScore<-facTbl2SemLong$semScore

#Remove empty factors
facTbl2Long$group<-factor(facTbl2Long$group)


#Plot w/ ggplot
library(ggplot2)
library(grid)

#Colors used: #329444 = green (OverallPsych), #325194 = blue (Anxious-Misery), #943282 = purple (Psychosis), #B3141C = red (Behavioral), #F58311 = orange (Fear)

Fig1b<-ggplot(facTbl2Long, aes(x=group, y=meanScore,fill=factor)) +
        ylab("Factor Score (z)") + xlab("") + ggtitle("Orthogonal Dimensions of Psychopathology by Screening Diagnosis") +
        geom_bar(stat="identity",position=position_dodge()) +
        scale_fill_manual(values=c("#329444","#325194","#943282","#B3141C","#F58311"), breaks=c("OverallMean","MoodMean","PsychosisMean","ExternalizingMean","PhobiasMean"),
        labels=c("Overall Psychopathology", "Anxious-Misery", "Psychosis", "Behavioral", "Fear")) +
        theme(axis.title.y = element_text(size = rel(1.5), angle = 90)) + theme(legend.text = element_text(size = 10), legend.justification=c(0.5,0.5), legend.position=c(.9,.9)) +
        theme(plot.title = element_text(size = rel(1.5), vjust = 2)) + theme(axis.text.x = element_text(size = rel(1.25), colour="black")) +
        theme(axis.text.y = element_text(size = rel(1.25), colour="black")) + guides(fill=guide_legend(title=NULL)) +
        scale_x_discrete(breaks=c("Add","Agr","Con","Gad","Mdd","Ocd","Odd","Ps","Ptd","Sep","Soc","Sph","Td"), labels=c("ADHD","Agoraphobia","Conduct","GAD","MDD","OCD","ODD",
        "Psychosis","PTSD","Separation Anx","Social Anx","Specific Phobia","TD")) + theme(plot.margin = unit(c(1,2.5,1,0.5), "cm")) +
        theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line.x = element_line(colour = "black"),
        axis.line.y = element_line(colour = "black"))

#see colors used in plot (leave "data" specified as is)
Plot1b<-ggplot_build(Fig1b)$data

ggsave(file="/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/Figure1b_BifactorsByDiag.png", width = 15, height = 5, units = "in", dpi = 300)


##helpful ggplot guides:
#ylab- y label title
#xlab- x label title
#ggtitle- plot title
#geom_bar - make bar plot
#geom_errorbar - create error-bars on plot
#scale_fill_manual- manually change the colors and names of the legend labels
#Within theme(axis.title.y = element_text()) or theme(axis.title.x = element_text()) or theme(plot.title = element_text()) you can change:
        #size = size of axis title
        #angle = orientation of text
        #vjust = vertical adjustment of text from axes
        #hjust = horizontal adjustment of text from axes
        #color = change color of text
#Above also works for axis tick labels using theme(axis.text.y=element_text()) or theme(axis.text.x=element_text())
#guides(fill=guide_legend(title=NULL)) - remove legend title
#scale_x_discrete(breaks=c("",""), labels=c("","")) - take the pre-existing axis labels and give them new labels
#theme(plot.margin = unit(c(1,2.5,1,0.5), "cm")) - change the margins of the plot to add a little extra room around the entire figure. Note: this requires the function "unit" from the package "grid" to work. unit(c(top,right,bottom,left))
#geom_bar(size=0.3) = changes the thickness of the black line around each bar (1 = thicker, .03 = thinner)
#geom_bar(color="black") = changes the color of the black line around each bar (remove this command to remove the black outlines).
#legend.justification = defines which side of the legend that the legend.position coordinates refer to (can use left, right, centre or numeric value (x = between 0 and 1))
#legend.position = move the legend (accepts left, right, top, bottom or define relative coordinates on plot c(x, y) between 0 and 1)


##########################################################
#### CREATE SUBSETS FOR EACH DIAGNOSIS (FOR FIGURE 4) ####
##########################################################

#subset the data for each diagnosis with N>20
AddData<-subjData[!is.na(subjData$Add), ]
AgrData<-subjData[!is.na(subjData$Agr), ]
ConData<-subjData[!is.na(subjData$Con), ]
GadData<-subjData[!is.na(subjData$Gad), ]
MddData<-subjData[!is.na(subjData$Mdd), ]
OcdData<-subjData[!is.na(subjData$Ocd), ]
OddData<-subjData[!is.na(subjData$Odd), ]
PsData<-subjData[!is.na(subjData$Ps), ]
PtdData<-subjData[!is.na(subjData$Ptd), ]
SepData<-subjData[!is.na(subjData$Sep), ]
SocData<-subjData[!is.na(subjData$Soc), ]
SphData<-subjData[!is.na(subjData$Sph), ]

#Divide OverallPsy into quartiles
subjData$quartile <- with(subjData, factor(
                            findInterval( subjData$goassessItemBifactor4FactorOverallPsy, c(-Inf,
                               quantile(subjData$goassessItemBifactor4FactorOverallPsy, na.rm=TRUE, probs=c(0.25, .5, .75)), Inf)),
                            labels=c("OverallPsy_Q1","OverallPsy_Q2","OverallPsy_Q3","OverallPsy_Q4")
      ))


#Look at high vs low OverallPsy (defined by the first and fourth quartile)
subjData$OverallPsyBinary <- NA
subjData$OverallPsyBinary[subjData$quartile=="OverallPsy_Q4"] <- 1
subjData$OverallPsyBinary[subjData$quartile=="OverallPsy_Q1"] <- 0


#########################
#### LS MEANS VOLUME ####
#########################

#Load library; If not installed, then use this command: install.packages("lsmeans", repos="http://R-Forge.R-project.org")
library(lsmeans)

#Use lsmeans to save the adjusted mean for each disorder

#First, define lists
Asl_Region_List <- names(subjData)[2883:2885]

###ADD###

#Run models for Regions
require(lsmeans)
Add_RegionModels_asl <- lapply(Asl_Region_List, function(x) {
    lm(substitute(i ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Add, list(i = as.name(x))), data = AddData)
})

#Calculate and pull the lsmeans and SEs from each lm summary
Add_RegionLSMeans_asl<-sapply(Add_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Add))$lsmean } )
Add_RegionSEs_asl<-sapply(Add_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Add))$SE } )


###Agr###

#Run models for Regions
require(lsmeans)
Agr_RegionModels_asl <- lapply(Asl_Region_List, function(x) {
    lm(substitute(i ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Agr, list(i = as.name(x))), data = AgrData)
})

#Calculate and pull the lsmeans and SEs from each lm summary
Agr_RegionLSMeans_asl<-sapply(Agr_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Agr))$lsmean } )
Agr_RegionSEs_asl<-sapply(Agr_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Agr))$SE } )


###CON###

#Run models for Regions
require(lsmeans)
Con_RegionModels_asl <- lapply(Asl_Region_List, function(x) {
    lm(substitute(i ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Con, list(i = as.name(x))), data = ConData)
})

#Calculate and pull the lsmeans and SEs from each lm summary
Con_RegionLSMeans_asl<-sapply(Con_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Con))$lsmean } )
Con_RegionSEs_asl<-sapply(Con_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Con))$SE } )


###GAD###

#Run models for Regions
require(lsmeans)
Gad_RegionModels_asl <- lapply(Asl_Region_List, function(x) {
    lm(substitute(i ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Gad, list(i = as.name(x))), data = GadData)
})

#Calculate and pull the lsmeans and SEs from each lm summary
Gad_RegionLSMeans_asl<-sapply(Gad_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Gad))$lsmean } )
Gad_RegionSEs_asl<-sapply(Gad_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Gad))$SE } )


###MDD###

#Run models for Regions
require(lsmeans)
Mdd_RegionModels_asl <- lapply(Asl_Region_List, function(x) {
    lm(substitute(i ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Mdd, list(i = as.name(x))), data = MddData)
})

#Calculate and pull the lsmeans and SEs from each lm summary
Mdd_RegionLSMeans_asl<-sapply(Mdd_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Mdd))$lsmean } )
Mdd_RegionSEs_asl<-sapply(Mdd_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Mdd))$SE } )


###OCD###

#Run models for Regions
require(lsmeans)
Ocd_RegionModels_asl <- lapply(Asl_Region_List, function(x) {
    lm(substitute(i ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Ocd, list(i = as.name(x))), data = OcdData)
})

#Calculate and pull the lsmeans and SEs from each lm summary
Ocd_RegionLSMeans_asl<-sapply(Ocd_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Ocd))$lsmean } )
Ocd_RegionSEs_asl<-sapply(Ocd_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Ocd))$SE } )


###ODD###

#Run models for Regions
require(lsmeans)
Odd_RegionModels_asl <- lapply(Asl_Region_List, function(x) {
    lm(substitute(i ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Odd, list(i = as.name(x))), data = OddData)
})

#Calculate and pull the lsmeans and SEs from each lm summary
Odd_RegionLSMeans_asl<-sapply(Odd_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Odd))$lsmean } )
Odd_RegionSEs_asl<-sapply(Odd_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Odd))$SE } )


###PS###

#Run models for Regions
require(lsmeans)
Ps_RegionModels_asl <- lapply(Asl_Region_List, function(x) {
    lm(substitute(i ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Ps, list(i = as.name(x))), data = PsData)
})

#Calculate and pull the lsmeans and SEs from each lm summary
Ps_RegionLSMeans_asl<-sapply(Ps_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Ps))$lsmean } )
Ps_RegionSEs_asl<-sapply(Ps_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Ps))$SE } )


###PTD###

#Run models for Regions
require(lsmeans)
Ptd_RegionModels_asl <- lapply(Asl_Region_List, function(x) {
    lm(substitute(i ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Ptd, list(i = as.name(x))), data = PtdData)
})

#Calculate and pull the lsmeans and SEs from each lm summary
Ptd_RegionLSMeans_asl<-sapply(Ptd_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Ptd))$lsmean } )
Ptd_RegionSEs_asl<-sapply(Ptd_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Ptd))$SE } )


###Sep###

#Run models for Regions
require(lsmeans)
Sep_RegionModels_asl <- lapply(Asl_Region_List, function(x) {
    lm(substitute(i ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Sep, list(i = as.name(x))), data = SepData)
})

#Calculate and pull the lsmeans and SEs from each lm summary
Sep_RegionLSMeans_asl<-sapply(Sep_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Sep))$lsmean } )
Sep_RegionSEs_asl<-sapply(Sep_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Sep))$SE } )


###SOC###

#Run models for Regions
require(lsmeans)
Soc_RegionModels_asl <- lapply(Asl_Region_List, function(x) {
    lm(substitute(i ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Soc, list(i = as.name(x))), data = SocData)
})

#Calculate and pull the lsmeans and SEs from each lm summary
Soc_RegionLSMeans_asl<-sapply(Soc_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Soc))$lsmean } )
Soc_RegionSEs_asl<-sapply(Soc_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Soc))$SE } )


###SPH###

#Run models for Regions
require(lsmeans)
Sph_RegionModels_asl <- lapply(Asl_Region_List, function(x) {
    lm(substitute(i ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Sph, list(i = as.name(x))), data = SphData)
})

#Calculate and pull the lsmeans and SEs from each lm summary
Sph_RegionLSMeans_asl<-sapply(Sph_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Sph))$lsmean } )
Sph_RegionSEs_asl<-sapply(Sph_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ Sph))$SE } )


###OverallPsy First and Fourth Quartiles###

#Run models for Regions
require(lsmeans)
OverallPsyBinary_RegionModels_asl <- lapply(Asl_Region_List, function(x) {
    lm(substitute(i ~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + OverallPsyBinary, list(i = as.name(x))), data = subjData)
})

#Calculate and pull the lsmeans and SEs from each lm summary
OverallPsyBinary_RegionLSMeans_asl<-sapply(OverallPsyBinary_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ OverallPsyBinary))$lsmean } )
OverallPsyBinary_RegionSEs_asl<-sapply(OverallPsyBinary_RegionModels_asl, function(x) { f <- summary(lsmeans(x, ~ OverallPsyBinary))$SE } )


############################
### FDR CORRECT P-VALUES ###
############################

#Create vectors of p-values. NOTE: this is hardcoded as [6,4], which will need to be changed if you change the variables in the model.
Add_RegionModels_p <- sapply(Add_RegionModels_asl, function(v) summary(v)$coefficients[6,4])
Agr_RegionModels_p <- sapply(Agr_RegionModels_asl, function(v) summary(v)$coefficients[6,4])
Con_RegionModels_p <- sapply(Con_RegionModels_asl, function(v) summary(v)$coefficients[6,4])
Gad_RegionModels_p <- sapply(Gad_RegionModels_asl, function(v) summary(v)$coefficients[6,4])
Mdd_RegionModels_p <- sapply(Mdd_RegionModels_asl, function(v) summary(v)$coefficients[6,4])
Ocd_RegionModels_p <- sapply(Ocd_RegionModels_asl, function(v) summary(v)$coefficients[6,4])
Odd_RegionModels_p <- sapply(Odd_RegionModels_asl, function(v) summary(v)$coefficients[6,4])
Ps_RegionModels_p <- sapply(Ps_RegionModels_asl, function(v) summary(v)$coefficients[6,4])
Ptd_RegionModels_p <- sapply(Ptd_RegionModels_asl, function(v) summary(v)$coefficients[6,4])
Sep_RegionModels_p <- sapply(Sep_RegionModels_asl, function(v) summary(v)$coefficients[6,4])
Soc_RegionModels_p <- sapply(Soc_RegionModels_asl, function(v) summary(v)$coefficients[6,4])
Sph_RegionModels_p <- sapply(Sph_RegionModels_asl, function(v) summary(v)$coefficients[6,4])
OverallPsyBinary_RegionModels_p <- sapply(OverallPsyBinary_RegionModels_asl, function(v) summary(v)$coefficients[6,4])

#combine all p-value vectors into one data frame
pvalues <- as.data.frame(rbind(Add_RegionModels_p, Agr_RegionModels_p, Con_RegionModels_p, Gad_RegionModels_p, Mdd_RegionModels_p, Ocd_RegionModels_p, Odd_RegionModels_p, Ps_RegionModels_p, Ptd_RegionModels_p, Sep_RegionModels_p, Soc_RegionModels_p, Sph_RegionModels_p, OverallPsyBinary_RegionModels_p))

#Add column names
colnames(pvalues) <- c("RostralACC","MiddleFrontalGyrus","DorsalACC")

#FDR correct p-values across diagnoses for each cluster separately
RostralACC_fdr <- p.adjust(pvalues$RostralACC,method="fdr")
MiddleFrontalGyrus_fdr <- p.adjust(pvalues$MiddleFrontalGyrus,method="fdr")
DorsalACC_fdr <- p.adjust(pvalues$DorsalACC,method="fdr")


####################
### EFFECT SIZES ###
####################

#Compute covariate-adjusted effect sizes (Cohens d)

#Define the effect size function (which controls for covariates)
###NOTE: the coefficient is hard coded at t$coefficients[6,1], if you change the number of variables in your model, this number will also have to be changed.
dCov<-function(x){
  t<-summary(x)
  effsize <- t$coefficients[6,1]/t$sigma
  return(abs(effsize))
}

#Double check that the effect size (estimate divided by residual standard error) is correctly calculated.
#test<-lm(GAM_asl_OverallPsy_rostralACC~ age + sex + I(scale(age, scale=FALSE, center=TRUE)^2) + age*sex + I(scale(age, scale=FALSE, center=TRUE)^2)*sex + pcaslRelMeanRMSMotion + Add, data = AddData)

#Calculate effect sizes:

#Add vs Td
Add_RegionModels_asl_d<-lapply(Add_RegionModels_asl, dCov)

#Agr vs Td
Agr_RegionModels_asl_d<-lapply(Agr_RegionModels_asl, dCov)

#Con vs Td
Con_RegionModels_asl_d<-lapply(Con_RegionModels_asl, dCov)

#Gad vs Td
Gad_RegionModels_asl_d<-lapply(Gad_RegionModels_asl, dCov)

#Mdd vs Td
Mdd_RegionModels_asl_d<-lapply(Mdd_RegionModels_asl, dCov)

#Ocd vs Td
Ocd_RegionModels_asl_d<-lapply(Ocd_RegionModels_asl, dCov)

#Odd vs Td
Odd_RegionModels_asl_d<-lapply(Odd_RegionModels_asl, dCov)

#Ps vs Td
Ps_RegionModels_asl_d<-lapply(Ps_RegionModels_asl, dCov)

#Ptd vs Td
Ptd_RegionModels_asl_d<-lapply(Ptd_RegionModels_asl, dCov)

#Sep vs Td
Sep_RegionModels_asl_d<-lapply(Sep_RegionModels_asl, dCov)

#Soc vs Td
Soc_RegionModels_asl_d<-lapply(Soc_RegionModels_asl, dCov)

#Sph vs Td
Sph_RegionModels_asl_d<-lapply(Sph_RegionModels_asl, dCov)

#OverallPsy low vs high (1st and 4th quartiles)
OverallPsyBinary_RegionModels_asl_d<-lapply(OverallPsyBinary_RegionModels_asl, dCov)


#############################################################
#### FIGURE 4: REGION EFFECT SIZES BY SCREENING CATEGORY ####
#############################################################

##Create table with region effect sizes only for diagnoses with >20 subjects.
facTbl3<-as.data.frame(matrix(nrow=13,ncol=3))
colnames(facTbl3)[1]<-"RostralACC"
colnames(facTbl3)[2]<-"MiddleFrontalGyrus"
colnames(facTbl3)[3]<-"DorsalACC"

##Name the rows
dxNamesShort3<-c("ADHD","Agoraphobia","Conduct","GAD","MDD","OCD","ODD","Psychosis","PTSD","Separation Anxiety","Social Phobia","Specific Phobia","Overall Psy")

row.names(facTbl3)<-dxNamesShort3

dxs3<-c("Add","Agr","Con","Gad","Mdd","Ocd","Odd","Ps","Ptd","Sep","Soc","Sph","OverallPsyBinary")

##Add effect sizes to table
         facTbl3[1,1]<-Add_RegionModels_asl_d[1]
         facTbl3[1,2]<-Add_RegionModels_asl_d[2]
         facTbl3[1,3]<-Add_RegionModels_asl_d[3]

         facTbl3[2,1]<-Agr_RegionModels_asl_d[1]
         facTbl3[2,2]<-Agr_RegionModels_asl_d[2]
         facTbl3[2,3]<-Agr_RegionModels_asl_d[3]

         facTbl3[3,1]<-Con_RegionModels_asl_d[1]
         facTbl3[3,2]<-Con_RegionModels_asl_d[2]
         facTbl3[3,3]<-Con_RegionModels_asl_d[3]

         facTbl3[4,1]<-Gad_RegionModels_asl_d[1]
         facTbl3[4,2]<-Gad_RegionModels_asl_d[2]
         facTbl3[4,3]<-Gad_RegionModels_asl_d[3]

         facTbl3[5,1]<-Mdd_RegionModels_asl_d[1]
         facTbl3[5,2]<-Mdd_RegionModels_asl_d[2]
         facTbl3[5,3]<-Mdd_RegionModels_asl_d[3]

         facTbl3[6,1]<-Ocd_RegionModels_asl_d[1]
         facTbl3[6,2]<-Ocd_RegionModels_asl_d[2]
         facTbl3[6,3]<-Ocd_RegionModels_asl_d[3]

         facTbl3[7,1]<-Odd_RegionModels_asl_d[1]
         facTbl3[7,2]<-Odd_RegionModels_asl_d[2]
         facTbl3[7,3]<-Odd_RegionModels_asl_d[3]

         facTbl3[8,1]<-Ps_RegionModels_asl_d[1]
         facTbl3[8,2]<-Ps_RegionModels_asl_d[2]
         facTbl3[8,3]<-Ps_RegionModels_asl_d[3]

         facTbl3[9,1]<-Ptd_RegionModels_asl_d[1]
         facTbl3[9,2]<-Ptd_RegionModels_asl_d[2]
         facTbl3[9,3]<-Ptd_RegionModels_asl_d[3]

         facTbl3[10,1]<-Sep_RegionModels_asl_d[1]
         facTbl3[10,2]<-Sep_RegionModels_asl_d[2]
         facTbl3[10,3]<-Sep_RegionModels_asl_d[3]

         facTbl3[11,1]<-Soc_RegionModels_asl_d[1]
         facTbl3[11,2]<-Soc_RegionModels_asl_d[2]
         facTbl3[11,3]<-Soc_RegionModels_asl_d[3]

         facTbl3[12,1]<-Sph_RegionModels_asl_d[1]
         facTbl3[12,2]<-Sph_RegionModels_asl_d[2]
         facTbl3[12,3]<-Sph_RegionModels_asl_d[3]

         facTbl3[13,1]<-OverallPsyBinary_RegionModels_asl_d[1]
         facTbl3[13,2]<-OverallPsyBinary_RegionModels_asl_d[2]
         facTbl3[13,3]<-OverallPsyBinary_RegionModels_asl_d[3]


##Reshape to long format
library(reshape2)
facTbl3$group<-factor(dxs3, levels = dxs3)

#Adjust the order of the columns to put the ACC's together in the table and subsequent figure.
facTbl3EffectSize<-facTbl3[,c(1,3,2,4)]
facTbl3EFLong<-melt(facTbl3EffectSize,id.vars="group",variable.name="region",value.name="EffectSize")

##Plot w/ ggplot
library(ggplot2)
library(grid)


Fig4<-ggplot(facTbl3EFLong, aes(x=group, y=EffectSize,fill=region)) +
     ylab("Effect Size") + xlab("") + ggtitle("CBF Effect Sizes by Region") +
     geom_bar(stat="identity",position=position_dodge()) +
     scale_fill_manual(values=c("#325194","#B3141C","#F58311"), breaks=c("RostralACC","DorsalACC","MiddleFrontalGyrus"),
     labels=c("Rostral ACC", "Dorsal ACC", "Middle Frontal Gyrus")) +
     theme(axis.title.y = element_text(size = rel(1.5), angle = 90)) + theme(legend.text = element_text(size = 10), legend.justification=c(0.5,0.5),
     legend.position=c(.1,.9)) +
     theme(plot.title = element_text(size = rel(1.5), vjust = 2)) + theme(axis.text.x = element_text(size = rel(1.25), colour="black")) +
     theme(axis.text.y = element_text(size = rel(1.25), colour="black")) + guides(fill=guide_legend(title=NULL)) +
     scale_x_discrete(breaks=c("Add","Agr","Con","Gad","Mdd","Ocd","Odd","Ps","Ptd","Sep","Soc","Sph","OverallPsyBinary"), 
     labels=c("ADHD","Agoraphobia","Conduct","GAD","MDD","OCD","ODD","Psychosis","PTSD","Separation Anx","Social Anx","Specific Phobia","Overall Psy")) + 
     theme(plot.margin = unit(c(1,2.5,1,0.5), "cm")) +
     theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line.x = element_line(colour = "black"),
     axis.line.y = element_line(colour = "black"))

##see colors used in plot (leave "data" specified as is)
#Plot1<-ggplot_build(Fig1)$data

ggsave(file="/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/Figure4_RegionByDiag.png", width = 15, height = 5, units = "in", dpi = 300)



##helpful ggplot guides:
#ylab- y label title
#xlab- x label title
#ggtitle- plot title
#geom_bar - make bar plot
#geom_errorbar - create error-bars on plot
#scale_fill_manual- manually change the colors and names of the legend labels
#Within theme(axis.title.y = element_text()) or theme(axis.title.x = element_text()) or theme(plot.title = element_text()) you can change:
        #size = size of axis title
        #angle = orientation of text
        #vjust = vertical adjustment of text from axes
        #hjust = horizontal adjustment of text from axes
        #color = change color of text
#Above also works for axis tick labels using theme(axis.text.y=element_text()) or theme(axis.text.x=element_text())
#guides(fill=guide_legend(title=NULL)) - remove legend title
#scale_x_discrete(breaks=c("",""), labels=c("","")) - take the pre-existing axis labels and give them new labels
#theme(plot.margin = unit(c(1,2.5,1,0.5), "cm")) - change the margins of the plot to add a little extra room around the entire figure. Note: this requires the function "unit" from the package "grid" to work. unit(c(top,right,bottom,left))
#geom_bar(size=0.3) = changes the thickness of the black line around each bar (1 = thicker, .03 = thinner)
#geom_bar(color="black") = changes the color of the black line around each bar (remove this command to remove the black outlines).
#legend.justification = defines which side of the legend that the legend.position coordinates refer to (can use left, right, centre or numeric value (x = between 0 and 1))
#legend.position = move the legend (accepts left, right, top, bottom or define relative coordinates on plot c(x, y) between 0 and 1)
