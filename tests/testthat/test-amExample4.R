
test_that("We are running the 3rd edition of testthat", code = {
    testthat::expect_gte(!!testthat::edition_get(), 3)
})

HTML=isTRUE(Sys.getenv("ART_GENERATE_HTML") == "TRUE") # Set with Sys.setenv(ART_GENERATE_HTML = "TRUE")

overwrite = FALSE # Use TRUE when creating new tests that need new *_expected data.

test_that("amExample4 results from pg 14 in allelematchSuppDoc.pdf are 2.5.3 compatible", code = {

    # Prepare for printing large snapshot files:
    withr::local_options(width=200) # Allow longer lines for the summaries:

    # Follow the instructions from allelematchSuppDoc.pdf, pg 14:
    data("amExample4")
    example4 <- amDataset(amExample4, indexColumn="sampleId",
      metaDataColumn="knownIndividual", missingCode="-99")
    {
        # Ensure that the result is still the same as that from 2.5.3:
        expect_snapshot_value(example4, style="deparse")
    }

    output = capture.output(
        amUniqueProfile(example4, doPlot=TRUE)
    )
    {
        # Ensure that the result is still the same as that from 2.5.3:
        # cat("\nOutput from amUniqueProfile:\n", output, "\nEnd of output\n", sep="\n    ")

        testthat::expect_match(output, "missing data load for input dataset is 0.199 ", fixed=TRUE, all=FALSE)
        testthat::expect_match(output, "allelic diversity for input dataset is 4.8 ", fixed=TRUE, all=FALSE)
        testthat::expect_match(output, "Best guess for optimal parameter at alleleMismatch=1 OR matchThreshold=0.95 OR cutHeight=0.05$", all=FALSE)
        testthat::expect_match(output, "Best guess for unique profile morphology: NoSecondMinimum$", all=FALSE)
        testthat::expect_match(output, "Use extra caution.", fixed=TRUE, all=FALSE)
    }

    output = capture.output(
        uniqueExample4 <- amUnique(example4, alleleMismatch=1)
    )
    {
        testthat::expect_match(output, "allelematch:  assuming genotype columns are in pairs, representing 10 loci$", all=FALSE)

        # Ensure that the result is still the same as that from 2.5.3:
        expect_snapshot_value(uniqueExample4, style="deparse")

        # Generate a summary file:
        summary.amUnique(uniqueExample4, csv=summaryFile <- tempfile("example4_1.csv"))

        # Ensure that the result is still the same as that from 2.5.3
        expect_snapshot_value(read.csv(file=summaryFile, colClasses="character"), style="deparse")
        file.remove(summaryFile)
    }

    if(HTML) {
        summary.amUnique(uniqueExample4, html=helpHtml("example4_1.html"))
    }

    output = capture.output(
        uniqueExample4ballpark <- amUnique(example4, alleleMismatch=6)
    )
    {
        testthat::expect_match(output, "allelematch:  assuming genotype columns are in pairs, representing 10 loci$", all=FALSE)

        # Ensure that the result is still the same as that from 2.5.3:
        # expect_snapshot_value(uniqueExample4ballpark, style="deparse") # (Couldn't serialize)

        # Generate a summary file:
        summary.amUnique(uniqueExample4ballpark, csv=summaryFile <- tempfile("example4_2.csv"))

        # Ensure that the result is still the same as that from 2.5.3
        expect_snapshot_value(read.csv(file=summaryFile, colClasses="character"), style="deparse")
        file.remove(summaryFile)
    }

    if(HTML) {
        summary.amUnique(uniqueExample4ballpark, html=helpHtml("example4_2.html"))
    }

    output = capture.output(
        uniqueExample4high <- amUnique(example4, alleleMismatch=6)
    )
    {
        testthat::expect_match(output, "allelematch:  assuming genotype columns are in pairs, representing 10 loci$", all=FALSE)

        # Ensure that the result is still the same as that from 2.5.3:
        # expect_snapshot_value(uniqueExample4high, style="deparse") # Couldn't serialize

        # Generate a summary file:
        summary.amUnique(uniqueExample4high, csv=summaryFile <- tempfile("example4_3.csv"))

        # Ensure that the result is still the same as that from 2.5.3
        expect_snapshot_value(read.csv(file=summaryFile, colClasses="character"), style="deparse")
        file.remove(summaryFile)
    }

    if(HTML) {
        summary.amUnique(uniqueExample4high, html=helpHtml("example4_3.html"))
    }


})
