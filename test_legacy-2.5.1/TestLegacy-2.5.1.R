####################################
### Setup for scripted execution ###
####################################

# Check that we are standing in a relevant directory
setupScript="test_legacy-2.5.1/r_script_setup_for_regressiontest.R"
here::i_am(setupScript)
source(here::here(setupScript))

wantedVersion    = "2.5.3"
regressiontest::auAssertAllelematchVersion(wantedVersion)
stopifnot(wantedVersion == toString(packageVersion("allelematch")))


cat("\nTestLegacy-2.5.1: About to test that allelematch ", toString(packageVersion("allelematch")), " is compatible with 2.5.1\n")

regressiontest::testDataSet(dataSetDir = paste(R_PROJ_DIR, "/test_legacy-2.5.1/", sep=""));
warnings()

cat("\nTestLegacy-2.5.1: DONE!\n\n")
