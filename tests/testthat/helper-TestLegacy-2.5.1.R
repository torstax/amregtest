####################################
### Setup for scripted execution ###
####################################

#' Validates the output file naming convention we use for GG tests
#'
#' @param actualCsv     The actual summary is written to a .csv file
#' @param expectedData  The expected summary is loaded from the package data
ggAssertSummaryNamesAlligned <- function(actualCsv, expectedData) {
    cat("\n")
    cat("   actualCsv      =", actualCsv, "\n")
    cat("   expectedData   =", expectedData, "\n")

    stopifnot(isTRUE(grepl("_expected$", expectedData)))
    basename = sub("_expected", "", expectedData)
    allignedActual = paste("/", basename, "_actual.csv", sep="")
    if(!isTRUE(grepl(allignedActual, actualCsv))) {
        stop("Actual and Expected names are not alligned",
             "\n    actualCsv      =", actualCsv,
             "\n    allignedActual =", allignedActual,
             "\n    expectedData   =", expectedData)
    }
}

# Temp function for debugging difference between running under [testthat]
# and running from the console
if (FALSE) {
    # First source this file.
    run_ggTest() # Then run this function from the RStudio Console by clicking Run on this line
}
run_ggTest <- function() {
    withr::local_collate("C")
    withr::local_language("en")
    Sys.getlocale()
    library(regressiontest)

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

        ggDataSet = allelematch::amDataset(getdata("ggSample"), indexColumn=1, missingCode="-99")

        amUniqueOutput = amUniqueWrapper(ggDataSet, matchThreshold=0.9)
        if (FALSE) {
            #  Overwrite the expected result:
            amUniqueOutput_mThr0.9_expected = amUniqueOutput
            dump(list = c("amUniqueOutput_mThr0.9_expected"), file="amUniqueOutput_mThr0.9_expected.R")
        }

        # Generate a summary to a .csv file:
        allelematch::summary.amUnique(amUniqueOutput, csv=summaryCsv)
        {
            # actualSummary = read.csv(file=summaryCsv, check.names=FALSE) # auReadSummary(summaryCsv)
            actualSummary = auRead_amCSV(summaryCsv)
            readr::problems(df)

            if (FALSE) { file.copy(summaryCsv, sub("_actual", "_expected", summaryCsv), overwrite = TRUE) }

            auAssertCsvEqualToExpectedData(summaryCsv, expectedData)

            #regressiontest::testDataSet(dataSetDir = paste(R_PROJ_DIR, "/test_legacy-2.5.1/", sep=""));
            warnings()
        }
    }
    cat("\nTestLegacy-2.5.1: DONE!\n\n")
}

