
test_that("Wanted version of of package allelematch is loaded", code = {

    wantedVersion = "2.5.3"
    actualVersion = toString(utils::packageVersion("allelematch")) # auAssertAllelematchVersion(wantedVersion)
    # if(!identical(actualVersion, wantedVersion)){warning("Unexpected version=", actualVersion, " of allelematch. Expected ", wantedVersion)}
    testthat::expect_identical( actualVersion, wantedVersion )
})


test_that("", code = {

    regressiontest::testDataSet(dataSetDir = paste0(R_PROJ_DIR, "/test_legacy-2.5.1/"));

    testthat::expect_identical( actualVersion, wantedVersion )
})


test_that("amUnique(matchThreshold=0.9) for dataset ggSample", code = {

    # ggDataSet = amDataset(getdata(ggSample))
    ggDataSet = auLoadDataSet("ggSample")
    # ggDataSet = amDataset(getdata(ggSample), indexColumn=1, missingCode="-99")
    outputDir = here::here("test_legacy-2.5.1/")
    outputDir = here::here("data/")

    # amUniqueWrapper(ggDataSet, matchThreshold=0.9, outputDir=outputDir, summary=TRUE)
    # readr::problems()

    summaryName="output_mThr0.9"
    summaryCsv = paste(tempdir(), "/", summaryName, "_actual.csv", sep="")
    summaryCsv = paste(here::here("data"), "/", summaryName, "_actual.csv", sep="")
    cat("   summaryCsv   =", summaryCsv, "\n")

    expectedData=paste(summaryName,"_expected", sep="")
    cat("   expectedData =", expectedData, "\n")
    expectedSummary = getdata(list=c(expectedData))


    amUniqueOutput <- amUnique(ggDataSet, matchThreshold=0.9)

    # Generate a summary to a .csv file:
    summary.amUnique(amUniqueOutput, csv=summaryCsv)

    actualSummary = read.csv(file=summaryCsv, colClasses="character", check.names=FALSE) # auReadSummary(summaryCsv)
    readr::problems(df)

    expectedSummary = getdata(list=c(expectedData))

    testthat::expect_identical( actualSummary, expectedSummary)
})
