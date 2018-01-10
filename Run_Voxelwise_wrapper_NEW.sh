qloginp3 -q qlogin.himem.q -l h_vmem=30G,s_vmem=30G

# Run LM                                                                                                                                                                        

subjDataName="/data/joy/BBL/projects/pncAslAcrossDisorder/subjectData/n1042_JLF_aslVox11andUp_subjData_aslPaths_NEW.rds"
OutDirRoot="/data/joy/BBL/projects/pncAslAcrossDisorder/results/TESTING_LM_WRAPPER"
namePaths="AslPath"
maskName="/data/joy/BBL/projects/pncAslAcrossDisorder/images/n1601_PcaslCoverageMask_GM.nii.gz"
smooth=0
inclusionName="ACROSS.INCLUDE"
subjID="bblid"
covsFormula="~age+sex+ageSq+age*sex+ageSq*sex+pcaslRelMeanRMSMotion+Bifactor_Mood+Bifactor_Psychosis+Bifactor_Externalizing+Bifactor_Fear+Bifactor_Overall_Psychopathology"
logfile="/data/joy/BBL/projects/pncAslAcrossDisorder/results/TESTING_LM_WRAPPER/logFiles"
errfile="/data/joy/BBL/projects/pncAslAcrossDisorder/results/TESTING_LM_WRAPPER/logFiles"

Rscript /data/joy/BBL/applications/groupAnalysis/lm_voxelwise.R -c $subjDataName -o $OutDirRoot -p $namePaths -m $maskName -i $inclusionName -u $subjID -f $covsFormula -n 3 -s 0 -r TRUE -d FALSE -a "fdr"
