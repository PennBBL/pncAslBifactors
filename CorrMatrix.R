#################
### LOAD DATA ###
#################

##Read in data
subjData <- readRDS("/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1029_JLF_aslVox11andUp_subjData.rds")

##Subset only by rows needed for correlation tables
Vars <- c("Mood","Psychosis","Externalizing","Fear","goassessItemBifactor4FactorMood","goassessItemBifactor4FactorPsych","goassessItemBifactor4FactorExt","goassessItemBifactor4FactorPhb","goassessItemBifactor4FactorOverallPsy")

subjData_short <- subjData[Vars]

#rename variables for plotting
colnames(subjData_short) <- c("Mood", "Psychosis", "Externalizing", "Fear", "Bifactors Mood", "Bifactors Psychosis", "Bifactors Externalizing", "Bifactors Fear", "Bifactors Overall")

#Load libraries
library(psych)
library(corrgram)
library(corrplot)

####################
### CORRELATIONS ###
####################

#make correlation table
corTable <- cor(subjData_short, method="pearson", use="complete.obs")

#Round correlation values to two decimal places
corTable_rounded <- round(corTable, 2)

#save table
write.csv(corTable_rounded,"/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/CorrTraits_Bifactors.csv",row.names=TRUE,quote=FALSE)


#############
### PLOTS ###
#############

#Graph the corr results with corrplot
M<-cor(subjData_short, use="complete.obs", method="pearson")

# mat : is a matrix of data
# ... : further arguments to pass to the native R cor.test function
cor.mtest <- function(mat, ...) {
    mat <- as.matrix(mat)
    n <- ncol(mat)
    p.mat<- matrix(NA, n, n)
    diag(p.mat) <- 0
    for (i in 1:(n - 1)) {
        for (j in (i + 1):n) {
            tmp <- cor.test(mat[, i], mat[, j], ...)
            p.mat[i, j] <- p.mat[j, i] <- tmp$p.value
        }
    }
  colnames(p.mat) <- rownames(p.mat) <- colnames(mat)
  p.mat
}
# matrix of the p-values of the correlation
p.mat <- cor.mtest(subjData_short)

#FDR correct across all correlations
p.mat_fdr <- matrix(p.adjust(as.vector(as.matrix(p.mat)), method='fdr'),ncol=9)
colnames(p.mat_fdr) <- colnames(p.mat)
rownames(p.mat_fdr) <- rownames(p.mat) 

col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))

png(height=1200, width=1200, pointsize=25, file="/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/Corrplot_FDR.png")
corrplot(M, method="color", col=col(200),  
         type="upper", title="Correlations between Correlated Traits and Bifactors",
         addCoef.col = "black", # Add coefficient of correlation
         tl.col="black", tl.srt=45, #Text label color and rotation
         # Combine with significance
         p.mat = p.mat_fdr, sig.level = 0.05, insig = "blank", 
         # hide correlation coefficient on the principal diagonal
         diag=FALSE,
	 #move title
	 mar=c(0,0,1,5) 
         )
dev.off()

png(height=1200, width=1200, pointsize=25, file="/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/Corrplot2.png")
corrplot(M, method="color", title="Correlations between Correlated Traits and Bifactors", mar=c(0,0,1,0))
dev.off()

#jpeg("/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/Corrplot3.jpg")
#corrplot(M, method="number",type="lower",tl.cex = .6, title="Correlations between Correlated Traits and Bifactors", mar=c(0,0,1,0))
#corrplot.mixed(M,tl.cex=.5)
#dev.off()

#corrgram plot
#jpeg("/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/Corrplot4.jpg")
#Correlations<-corrgram(subjData_short, order=TRUE, lower.panel=panel.shade,
#  upper.panel=NULL, text.panel=panel.txt,
#  main="Correlations between Correlated Traits and Bifactors")
#dev.off()

#Mood vs OverallPsy
#jpeg("/data/joy/BBL/projects/pncAslAcrossDisorder/TablesFigures/MoodByOverall.jpg")
#MoodByOverall <- plot(subjData$Mood, subjData$goassessItemBifactor4FactorOverallPsy)
#dev.off()
