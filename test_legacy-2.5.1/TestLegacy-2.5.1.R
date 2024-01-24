######################
### Raw data input ###
######################

# browser()

# Clear the Environment from old data to avoid this error:
#    "Error: allelematch: error in dynamic tree cutting; several causes for this error;"
# Happens when sourcing allelematch.r to be able to set breakpoints and run the debugger.
rm(list = ls())  # Clear the Environment

######################
### Needed libs    ###
######################
library(readr)
library(plyr)
library(allelematch)

# Check that we are standing in a relevant directory
if (file.exists("./R/regresiontest.r") == FALSE) {
  stop("ERROR! getwd() = ", getwd(), " does not contain './R/alelematch.r'!\n",
       "    You are recommended to use paths that starts at the Working Directory that you set,\n",
       "    either using the RStudio menu 'Session' -> 'Set Working Directory'\n",
       "    or using the R command 'setwd()' \n"
  )
}
source("./test_legacy-2.5.1/allele_utilities.R")


######################
### Constants      ###
######################

## WORKING_DIRECTORY
#
# You are recommended to use paths that starts at the Working Directory that you set
# either using the RStudio menu 'Session' -> 'Set Working Directory'
# or using the R command 'setwd()':
#setwd(" ... the directory where the input files are stored ...")
WORKING_DIRECTORY          = getwd()

## DROP_COLUMNS_FROM_NEW_SAMPLES
#
# Note that all alleles that are not present in both new samples and old ref
# will be dropped automatically.
#
# Note also that column headers that are invalid to R are converted to a valid format
# when read from comma separated value (.csv) and tab separated value (.txt) files.
#
# For example: "#SNPs" is converted to "X.SNPs" and "16S1_Gg2912" is converted to "X16S1_Gg2912"
#DROP_COLUMNS_FROM_NEW_SAMPLES = c("Plate", "Place", "Sex", "amp", "ZZ", "YY", "Y2_Gg_644", "Y2_Gg_720", "Y3_Gg_97")

## DROP_COLUMNS_FROM_OLD_REFERENCE
#
# Note that all alleles that are not present in both new samples and old ref
# will be dropped automatically.
#
# Note also that column headers that are invalid to R are converted to a valid format
# when read from comma separated value (.csv) and tab separated value (.txt) files.
#
# For example: "#SNPs" is converted to "X.SNPs" and "16S1_Gg2912" is converted to "X16S1_Gg2912"
#DROP_COLUMNS_FROM_OLD_REFERENCE = c("X.SNPs", "DeadYear", "Ind2", "Sex")

# Column headers that start with digits are not allowed as R 'names'
ALLOW_COLUMN_NAMES_TO_START_WITH_DIGITS = FALSE

## WRITE_CLEANED_INPUT_TO_FILE
#
# After the new samples and reference input files have been
# loaded, cleaned up and aligned, should they then be written out
# again for examination and re-use?
WRITE_CLEANED_INPUT_TO_FILE = TRUE

## IS_BRIEF_AMUNIQUE_SUPPORTED_BY_ALLELEMATCH
#
# This update of allelematch adds one more csv output format
# intended to give a quick overview.
IS_BRIEF_AMUNIQUE_SUPPORTED_BY_ALLELEMATCH = FALSE

## MAX_MISSING_SUPPORTED
#
MAX_MISSING_SUPPORTED = FALSE


###################
### Allelematch ###
###################

analyzeUnique <- function(amDatasetFocal, multilocusMap=NULL, alleleMismatch=NULL, matchThreshold=NULL, cutHeight=NULL, maxMissing=NULL, doPsib="missing", outputDir, outputFile=NULL) {
  # amDatasetFocal, multilocusMap=NULL, alleleMismatch=NULL, matchThreshold=NULL, cutHeight=NULL, maxMissing=NULL, doPsib="missing"

  if(is.null(outputFile)) { outputFile=auDefaultFileName(alleleMismatch=alleleMismatch, matchThreshold=matchThreshold, cutHeight=cutHeight, maxMissing=maxMissing, doPsib=doPsib)}
  paramString=amUniqueParamString(alleleMismatch=alleleMismatch, matchThreshold=matchThreshold, cutHeight=cutHeight, maxMissing=maxMissing, doPsib=doPsib)

  cat("\nTestLegacy-2.5.1: About to call amUnique with params", paramString, "\n")
  #  B2_allelmatch_uniqueAnalysis <- amUnique(amDatasetFocal=amDatasetFocal, multilocusMap=multilocusMap, alleleMismatch=alleleMismatch, matchThreshold=matchThreshold, cutHeight=cutHeight, maxMissing=maxMissing, doPsib=doPsib, verbose=TRUE)
  startTime <- Sys.time()
  B2_allelmatch_uniqueAnalysis <- amUnique(amDatasetFocal=amDatasetFocal, multilocusMap=multilocusMap, alleleMismatch=alleleMismatch, matchThreshold=matchThreshold, cutHeight=cutHeight,         doPsib=doPsib, verbose=TRUE)
  endTime <- Sys.time()

  cat("\nTestLegacy-2.5.1: Done calling amUnique with params", paramString, "in", difftime(endTime, startTime, unit = "secs" ), " sec \n")
  cat("   outputDir      = ", outputDir, "\n")
  cat("   outputFile     = ", outputFile,  "\n")
  csvFile = strcat(outputDir, outputFile)
  summary(B2_allelmatch_uniqueAnalysis, csv=csvFile)

  # Make it easier to verify that the output is still good:
  auSortCsvFile(      csvFile )
  auMakeBriefCsvFile( csvFile )
  auAssertExpected(   csvFile )

  if(IS_BRIEF_AMUNIQUE_SUPPORTED_BY_ALLELEMATCH) {
    outputFile = sub(".csv", "_brief.csv", outputFile, fixed=TRUE)
    cat("   outputFile     = ", outputFile,  "\n")
    briefFile = strcat(outputDir, outputFile)
    summary(B2_allelmatch_uniqueAnalysis, brief=briefFile)
    auSortCsvFile(file=briefFile);
  }
}

analyzeMatchThreshold <- function(inputDataSet, dataDirectory, matchThreshold=0.9, maxMissing=10, outputFile=NULL) {
  analyzeUnique(inputDataSet, matchThreshold=matchThreshold, maxMissing=NULL, outputDir=dataDirectory, outputFile=outputFile)
  readr::problems()
}

analyzeAleleMismatch <- function(inputDataSet, dataDirectory, alleleMismatch=15, maxMissing=10, outputFile=NULL) {
  analyzeUnique(inputDataSet, alleleMismatch=alleleMismatch, maxMissing=NULL, outputDir=dataDirectory, outputFile=outputFile)
  readr::problems()
}

testDataSet <- function(dataSetDir, skippCleaningInput = FALSE) {

  if (!skippCleaningInput) {
    auCleanInputFiles(dataSetDir)
  } else {
    # Use previously cleaned input files
  }

  # Create an amDataset from the input files:
  dataDirectory = strcat(WORKING_DIRECTORY, dataSetDir)
  inputDataSet <- auReadInput(dataSetDir, "input_new_samples.txt", "input_Match_references.txt")
  readr::problems(inputDataSet)

  # Run the tests of interest on the created amDataset:
  analyzeMatchThreshold(inputDataSet, dataDirectory)
  analyzeAleleMismatch( inputDataSet, dataDirectory)

  readr::problems()
  warnings()
}


###################
### Allelematch ###
###################
# options(warn=1)

testDataSet(dataSetDir = "/test_legacy-2.5.1/");
warnings()

cat("\nTestLegacy-2.5.1: DONE!\n\n")
