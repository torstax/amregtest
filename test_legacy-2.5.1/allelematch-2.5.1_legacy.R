#############################
### Finding R project dir ###
#############################

# Check that we are standing in a relevant directory
here::i_am("test_legacy-2.5.1/allelematch-2.5.1_legacy.R")
stopifnot(file.exists(here::here("R/.")))

# browser() # Start debugger

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
requireNamespace("readr")
requireNamespace("dplyr")
requireNamespace("data.table")

######################
### Configuration  ###
######################
R_PROJ_DIR          = here::here()
source(here::here("data/au_config.R"))

wantedVersion    = "2.5.2"

regressiontest::auAssertAllelematchVersion(wantedVersion)
# require(remotes)
# installedVersion = toString(packageVersion("allelematch"))
# if (wantedVersion != toString(packageVersion("allelematch"))) {
#     cat("\nAbout to install wantedVersion of allelematch,", wantedVersion, " - Current version is", installedVersion,
#         "\nPLEASE RESTART after R session has beeen restarted ...\n")
#     detach("package:allelematch", unload=TRUE)
#     remotes::install_version("allelematch", version = wantedVersion, repos="https://cran.rstudio.com//")
#     .rs.restartR()
# }
stopifnot(wantedVersion == toString(packageVersion("allelematch")))

cat("\nTestLegacy-2.5.1: About to test that allelematch ", toString(packageVersion("allelematch")), " is compatible with 2.5.1\n")

regressiontest::testDataSet(dataSetDir = paste(R_PROJ_DIR, "/test_legacy-2.5.1/", sep=""));
warnings()

cat("\nTestLegacy-2.5.1: DONE!\n\n")
