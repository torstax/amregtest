# Run tests on [ggSample], a large real life data set.
#
# The tests are quite time consuming (approx one minute per test).
# They can therefore be skipped by setting "SKIP_SLOW_TESTS" to "TRUE"
# from e.g. the RStudio Console:
#
#       Type Sys.setenv(SKIP_SLOW_TESTS = "TRUE") to skip
#
#       Type Sys.unsetenv("SKIP_SLOW_TESTS") to enable again
#
test_that("amUnique(matchThreshold=0.9) for dataset ggSample", code = {

    skip_if(Sys.getenv("SKIP_SLOW_TESTS") == "TRUE")
    # Type Sys.setenv(SKIP_SLOW_TESTS = "TRUE") from the console to skip,
    # Type Sys.unsetenv("SKIP_SLOW_TESTS") to enable again

    # Log result files early:
    test = "mThr0.9"
    summaryCsv  = ggActualCsv(test, tempdir(), "/output_mThr0.9_actual.csv")
    expectedData= ggExpectedData(test, "output_mThr0.9_expected")

    # Load the large gg-style sample file and load it into a allelematch amDataset:
    ggDataset = allelematch::amDataset(getdata("ggSample"), indexColumn=1, missingCode="-99")

    # Run amUnique:
    amUniqueOutput <- amUniqueWrapper(ggDataset, matchThreshold=0.9)

    # Generate a summary to a .csv file:
    allelematch::summary.amUnique(amUniqueOutput, csv=summaryCsv)
    {
        # Load the generated summary:
        # actualSummary = read.csv(file=summaryCsv, check.names=FALSE) # auReadSummary(summaryCsv)
        actualSummary = auRead_amCSV(summaryCsv)

        # Compare with expected summary:
        # auAssertCsvEqualToExpectedData(summaryCsv, expectedData)  # Old test
        expect_gg_summaries_equal(test, summaryCsv, expectedData) # New test
    }
})

test_that("amUnique(alleleMismatch=15) for dataset ggSample", code = {
    skip_if(Sys.getenv("SKIP_SLOW_TESTS") == "TRUE")

    # Log result files early:
    test = "aMm15"
    summaryCsv  = ggActualCsv(test, tempdir(), "/output_aMm15_actual.csv")
    expectedData= "output_aMm15_expected"

    # Load the large gg-style sample file and load it into a allelematch amDataset:
    ggDataset = allelematch::amDataset(getdata("ggSample"), indexColumn=1, missingCode="-99")

    # Run amUnique:
    amUniqueOutput <- amUniqueWrapper(ggDataset, alleleMismatch=15)

    # Generate a summary to a .csv file:
    allelematch::summary.amUnique(amUniqueOutput, csv=summaryCsv)
    {
        # Load the generated summary:
        # actualSummary = read.csv(file=summaryCsv, check.names=FALSE) # auReadSummary(summaryCsv)
        actualSummary = auRead_amCSV(summaryCsv)

        # Compare with expected summary:
        # auAssertCsvEqualToExpectedData(summaryCsv, expectedData)
        expect_gg_summaries_equal(test, summaryCsv, expectedData)
    }
})
