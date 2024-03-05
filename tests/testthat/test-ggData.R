# Run tests on [ggSample], a large real life data set.
#
# The tests are quite time consuming (approx one minute per test).
# They can therefore be skipped by setting "ART_SKIP_SLOW" to "TRUE"
# from e.g. the RStudio Console:
#
#       Type Sys.setenv(ART_SKIP_SLOW = "TRUE") to skip
#
#       Type Sys.unsetenv("ART_SKIP_SLOW") to enable again
#
test_that("amUnique(matchThreshold=0.9) for dataset ggSample", code = {

    skip_if(Sys.getenv("ART_SKIP_SLOW") == "TRUE")
    # Type Sys.setenv(ART_SKIP_SLOW = "TRUE") from the console to skip,
    # Type Sys.unsetenv("ART_SKIP_SLOW") to enable again

    # Log result files early:
    test = "ggSample_mThr0.9"
    summaryCsv  = ggActualCsv(test, tempdir(), "/ggSample_mThr0.9_actual.csv")
    expectedData= ggExpectedData(test, "ggSample_mThr0.9_expected")

    # Load the large gg-style sample file and load it into a allelematch amDataset:
    ggDataset = allelematch::amDataset(getdata("ggSample"), indexColumn=1, missingCode="-99")

    # Run amUnique:
    amUniqueOutput <- amUniqueWrapper(ggDataset, matchThreshold=0.9)

    # Generate a summary to a .csv file:
    allelematch::summary.amUnique(amUniqueOutput, csv=summaryCsv)
    {
        # Load the generated summary:
        # actualSummary = read.csv(file=summaryCsv, check.names=FALSE) # artReadSummary(summaryCsv)
        actualSummary = artRead_amCSV(summaryCsv)

        # Compare with expected summary:
        # artAssertCsvEqualToExpectedData(summaryCsv, expectedData)  # Old test
        expect_gg_summaries_equal(test, summaryCsv, expectedData) # New test
    }
})

test_that("amUnique(alleleMismatch=15) for dataset ggSample", code = {
    skip_if(Sys.getenv("ART_SKIP_SLOW") == "TRUE")

    # Log result files early:
    test = "ggSample_aMm15"
    summaryCsv  = ggActualCsv(test, tempdir(), "/ggSample_aMm15_actual.csv")
    expectedData= "ggSample_aMm15_expected"

    # Load the large gg-style sample file and load it into a allelematch amDataset:
    ggDataset = allelematch::amDataset(getdata("ggSample"), indexColumn=1, missingCode="-99")

    # Run amUnique:
    amUniqueOutput <- amUniqueWrapper(ggDataset, alleleMismatch=15)

    # Generate a summary to a .csv file:
    allelematch::summary.amUnique(amUniqueOutput, csv=summaryCsv)
    {
        # Load the generated summary:
        # actualSummary = read.csv(file=summaryCsv, check.names=FALSE) # artReadSummary(summaryCsv)
        actualSummary = artRead_amCSV(summaryCsv)

        # Compare with expected summary:
        # artAssertCsvEqualToExpectedData(summaryCsv, expectedData)
        expect_gg_summaries_equal(test, summaryCsv, expectedData)
    }
})
