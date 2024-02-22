####################################
### Setup for scripted execution ###
####################################
#
# valToString <- function(val) {
#     switch(type(val))
# }
#
# nosa <- function(prelude=NULL, ...) {
#     # form the ... arguments into a string on the form "<name1>=<value1>, <name2>=<value2> ..."
#     v = character(...length()) # Reserve space for a vector of strings
#     name = ...names()          # Get the argument names
#
#     # Paste together <name>=<value> pairs
#     for(n in 1:...length()) v[n] = paste(name[n], ...elt(n), sep="=")
#
#     # Return a string were the pairs are ", " -separated:
#     paste0(v, collapse=", ")
# }
#
# cat(nosa(hej=1, hopp=2, hammarslojd="kaffe med dopp"), "\n")
#
# stop("Enough for today", call. = FALSE)

# Check that we are standing in a relevant directory
setupScript="test_legacy-2.5.1/r_script_setup_for_regressiontest.R"
here::i_am(setupScript)
source(here::here(setupScript))


wantedVersion    = "2.5.3"
regressiontest::auAssertAllelematchVersion(wantedVersion)
stopifnot(wantedVersion == toString(packageVersion("allelematch")))


cat("\nTestLegacy-2.5.1: About to test that allelematch ", toString(packageVersion("allelematch")), " is compatible with 2.5.1\n")

if (TRUE) {
    outputDir = here::here("test_legacy-2.5.1/")
    outputDir = here::here("data/")
    regressiontest::testDataSet(dataSetDir = outputDir);
    warnings()
} else {
    # ggDataSet = auLoadDataSet("ggSample")
    outputDir = here::here("test_legacy-2.5.1/")
    outputDir = here::here("data/")
    # data(ggSample)
    ggDataSet = allelematch::amDataset(getdata(ggSample), indexColumn=1, missingCode="-99")

    amUniqueWrapper(ggDataSet, matchThreshold=0.9, expectedData="output_mThr0.9_expected", summary=TRUE)
    readr::problems()

    #regressiontest::testDataSet(dataSetDir = paste(R_PROJ_DIR, "/test_legacy-2.5.1/", sep=""));
    warnings()
}
cat("\nTestLegacy-2.5.1: DONE!\n\n")
