######################
### Raw data input ###
######################

# Check that we are standing in a relevant directory
here::i_am("test_legacy-2.5.1/TestLegacy-2.5.1.R")
stopifnot(file.exists(here::here("R/.")))

# browser()

# Clear the Environment from old data:
rm(list = ls())  # Clear the Environment

#######################
### Needed packages ###
#######################
#library(readr)
#library(plyr)
library(here)
library(allelematch)
library(regressiontest)


######################
### Constants      ###
######################

## R_PROJ_DIR
#
# TODO: REMOVE THIS COMMENT:
# You are recommended to use paths that starts at the Working Directory that you set
# either using the RStudio menu 'Session' -> 'Set Working Directory'
# or using the R command 'setwd()':
#setwd(" ... the directory where the input files are stored ...")
R_PROJ_DIR          = here::here()
stopifnot(file.exists(here::here("test_legacy-2.5.1/TestLegacy-2.5.1.R")))

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
# options(warn=1)

wantedVersion    = "2.5.2"

require(remotes)
installedVersion = toString(packageVersion("allelematch"))
if (wantedVersion != toString(packageVersion("allelematch"))) {
    cat("\nAbout to install wantedVersion of allelematch,", wantedVersion, " - Current version is", installedVersion,
        "\nPLEASE RESTART after R session has beeen restarted ...\n")
    detach("package:allelematch", unload=TRUE)
    remotes::install_version("allelematch", version = wantedVersion, repos="https://cran.rstudio.com//")
    .rs.restartR()
}
stopifnot(wantedVersion == toString(packageVersion("allelematch")))

cat("\nTestLegacy-2.5.1: About to test that allelematch ", toString(packageVersion("allelematch")), " is compatible with 2.5.1\n")

regressiontest::testDataSet(dataSetDir = "/test_legacy-2.5.1/");
warnings()

cat("\nTestLegacy-2.5.1: DONE!\n\n")
