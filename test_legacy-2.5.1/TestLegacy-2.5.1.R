####################################
### Setup for scripted execution ###
####################################

# Check that we are standing in a relevant directory
setupScript="test_legacy-2.5.1/r_script_setup_for_regressiontest.R"
here::i_am(setupScript)
source(here::here(setupScript))

# Set standardized locale so that the calls to 'sort' in allelematch
# work the same regardless on what machine our tests are executed on.
# See issue locale / collation used in testhat #1181
#  at https://github.com/r-lib/testthat/issues/1181#issuecomment-692851342
withr::local_collate("C")
withr::local_language("en")
Sys.getlocale()


wantedVersion    = "2.5.3"
regressiontest::auAssertAllelematchVersion(wantedVersion)
stopifnot(wantedVersion == toString(packageVersion("allelematch")))


cat("\nTestLegacy-2.5.1: About to test that allelematch ", toString(packageVersion("allelematch")), " is compatible with 2.5.1\n")

if (FALSE) {
    outputDir = here::here("test_legacy-2.5.1/")
    outputDir = here::here("data/")
    regressiontest::testDataSet(dataSetDir = outputDir);
    warnings()
} else {
    # ggDataSet = auLoadDataSet("ggSample")
    outputDir = here::here("test_legacy-2.5.1/")
    outputDir = here::here("data/")
    expectedData = "output_mThr0.9_expected"
    summaryCsv= paste(outputDir, "/", "output_mThr0.9_actual.csv", sep="")

    # data(ggSample)
    ggDataSet = allelematch::amDataset(getdata(ggSample), indexColumn=1, missingCode="-99")

    amUniqueOutput = amUniqueWrapper(ggDataSet, matchThreshold=0.9)
    # amUniqueOutput_mThr0.9_expected = amUniqueWrapper(ggDataSet, matchThreshold=0.9)
    # dump(list = c("amUniqueOutput_mThr0.9_expected"), file="amUniqueOutput_mThr0.9_expected.R")

    # Generate a summary to a .csv file:
    allelematch::summary.amUnique(amUniqueOutput, csv=summaryCsv)

    # actualSummary = read.csv(file=summaryCsv, check.names=FALSE) # auReadSummary(summaryCsv)
    actualSummary = auRead_amCSV(summaryCsv)
    readr::problems(df)

    auAssertCsvEqualToExpectedData(summaryCsv, expectedData)

    #regressiontest::testDataSet(dataSetDir = paste(R_PROJ_DIR, "/test_legacy-2.5.1/", sep=""));
    warnings()
}
cat("\nTestLegacy-2.5.1: DONE!\n\n")
