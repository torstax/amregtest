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


    # # Log result files early:
    # test = "ggSample_mThr0.9"
    # summaryCsv  = ggActualCsv(test, tempdir(), "/ggSample_mThr0.9_actual.csv")
    # expectedData= ggExpectedData(test, "ggSample_mThr0.9_expected")

    # Prepare for printing very large snapshot files:
    withr::local_options(width=3000) # Allow longer lines for the summaries:

    # Load the large gg-style sample file:
    data("ggSample")
    expect_identical(dim(ggSample), c(1658L, 187L))

    # Load the sample into an allelematch amDataset:
    expect_snapshot(ggDataset <- allelematch::amDataset(ggSample, indexColumn=1, missingCode="-99"))

    # We want to run amUnique many times with many combinations of parameters,
    # and we want to compare the results with previous runs. Like this:
    snapshot_amUnique <- function(ds, ...) {

        # Log the call to the snapshot file:
        argstr = artArgToString(...)
        cmdstr = paste("obj <- amUnique(", ds, ", ", argstr, ")", sep="") ; expect_snapshot(cat(cmdstr))

        # Make the call to allelematch:
        sink(nullfile()) # Block output from 'cat' within allelematch
        obj = amUnique(amDatasetFocal=get(ds), ...)
        sink()

        # amCSV.amUnique should have the same output as before
        tmp = tempfile(paste(ds, "_", sep=""), fileext=".csv")
        expect_snapshot(summary.amUnique(obj, csv=tmp))
        expect_snapshot(format(read.csv(tmp)))

        # # amHTML.amUnique should have the same output as before
        # tmp = tempfile(paste(ds, "_", sep=""), fileext=".html")
        # expect_snapshot(amHTML.amUnique( obj, htmlFile=tmp))
        # expect_snapshot(
        #     cat(
        #         sub("summary generated: </b><em>.+?</em>",
        #             "summary generated: </b><em>(date)</em>",
        #             readLines(tmp, warn=FALSE),
        #             perl=TRUE),
        #         sep="\n")
        #
        # )

        invisible(NULL)
    }

    snapshot_amUnique("ggDataset", matchThreshold=0.9)
    snapshot_amUnique("ggDataset", alleleMismatch=15)

})

# test_that("amUnique(alleleMismatch=15) for dataset ggSample", code = {
#     skip_if(Sys.getenv("ART_SKIP_SLOW") == "TRUE")
#
#     # Log result files early:
#     test = "ggSample_aMm15"
#     summaryCsv  = ggActualCsv(test, tempdir(), "/ggSample_aMm15_actual.csv")
#     expectedData= "ggSample_aMm15_expected"
#
#     # Load the large gg-style sample file and load it into a allelematch amDataset:
#     ggDataset = allelematch::amDataset(getdata("ggSample"), indexColumn=1, missingCode="-99")
#
#     # Run amUnique:
#     amUniqueOutput <- amUniqueWrapper(ggDataset, alleleMismatch=15)
#
#     # Generate a summary to a .csv file:
#     allelematch::summary.amUnique(amUniqueOutput, csv=summaryCsv)
#     {
#         # Load the generated summary:
#         # actualSummary = read.csv(file=summaryCsv, check.names=FALSE) # artReadSummary(summaryCsv)
#         actualSummary = artRead_amCSV(summaryCsv)
#
#         # Compare with expected summary:
#         expect_gg_summaries_equal(test, summaryCsv, expectedData)
#     }
# })
