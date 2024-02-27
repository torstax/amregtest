
test_that("Wanted version of of package allelematch is loaded", code = {

    wantedVersion = "2.5.3"
    actualVersion = toString(utils::packageVersion("allelematch")) # auAssertAllelematchVersion(wantedVersion)
    # if(!identical(actualVersion, wantedVersion)){warning("Unexpected version=", actualVersion, " of allelematch. Expected ", wantedVersion)}
    testthat::expect_identical( actualVersion, wantedVersion )
})


test_that("Test something", code = {

    # regressiontest::testDataSet(dataSetDir = here::here("/test_legacy-2.5.1/"));

    # run_ggTest()

    testthat::expect_identical( 1, 1 )
})


test_that("amUnique(matchThreshold=0.9) for dataset ggSample", code = {

    skip_if(Sys.getenv("SKIP_SLOW_TESTS") == "TRUE")
    # Type Sys.setenv(SKIP_SLOW_TESTS = "TRUE") from the console to skip,
    # Type Sys.unsetenv("SKIP_SLOW_TESTS") to enable again

    # Log result files early:
    summaryCsv  = paste(tempdir(), "/output_mThr0.9_actual.csv", sep="")
    expectedData= "output_mThr0.9_expected"
    {
        ggAssertSummaryNamesAlligned(summaryCsv, expectedData)
        expectedSummary = getdata(expectedData)
    }


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
        auAssertCsvEqualToExpectedData(summaryCsv, expectedData)
        testthat::expect_equal( actualSummary, expectedSummary, ignore_attr = TRUE)
    }
})

test_that("amUnique(alleleMismatch=15) for dataset ggSample", code = {
    skip_if(Sys.getenv("SKIP_SLOW_TESTS") == "TRUE")

    # Log result files early:
    summaryCsv  = paste(tempdir(), "/output_aMm15_actual.csv", sep="")
    expectedData= "output_aMm15_expected"
    {
        ggAssertSummaryNamesAlligned(summaryCsv, expectedData)
        expectedSummary = getdata(expectedData)
    }


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
        auAssertCsvEqualToExpectedData(summaryCsv, expectedData)
        testthat::expect_equal( actualSummary, expectedSummary, ignore_attr = TRUE)
    }
})
