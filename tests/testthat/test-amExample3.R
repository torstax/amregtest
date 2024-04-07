
test_that("We are running the 3rd edition of testthat", code = {
    # Set by adding the line "Config/testthat/edition: 3" to DESCRIPTION:
    testthat::expect_gte(!!testthat::edition_get(), 3)
})

HTML=isTRUE(Sys.getenv("ART_GENERATE_HTML") == "TRUE") # Set with Sys.setenv(ART_GENERATE_HTML = "TRUE")

overwrite = FALSE # Use TRUE when creating new tests that need new *_expected data.

test_that("amExample3 results from pg 10 in allelematchSuppDoc.pdf are 2.5.3 compatible", code = {

    # Prepare for printing large snapshot files:
    withr::local_options(width=200) # Allow longer lines for the summaries:

    # Follow the instructions from allelematchSuppDoc.pdf, pg 10:
    data("amExample3")
    example3 <- amDataset(amExample3, indexColumn="sampleId",
      metaDataColumn="knownIndividual", missingCode="-99")
    {
        # Ensure that the result is still the same as that from 2.5.3:
        expect_snapshot_value(example3, style="deparse")
    }

    output = capture.output(
        amUniqueProfile(example3, doPlot=TRUE)
    )
    {
        # Ensure that the result is still the same as that from 2.5.3:
        # cat("\nOutput from amUniqueProfile:\n", output, "\nEnd of output\n", sep="\n    ")

        testthat::expect_match(output, "missing data load for input dataset is 0.097 ", fixed=TRUE, all=FALSE)
        testthat::expect_match(output, "allelic diversity for input dataset is 8.2 ", fixed=TRUE, all=FALSE)
        testthat::expect_match(output, "Best guess for optimal parameter at alleleMismatch=6 OR matchThreshold=0.7 OR cutHeight=0.3$", all=FALSE)
        testthat::expect_match(output, "Best guess for unique profile morphology: NonZeroSecondMinimum$", all=FALSE)
        testthat::expect_match(output, "Use extra caution.", fixed=TRUE, all=FALSE)
    }

    output = capture.output(
        uniqueExample3 <- amUnique(example3, alleleMismatch=6)
    )
    {
        testthat::expect_match(output, "allelematch:  assuming genotype columns are in pairs, representing 10 loci$", all=FALSE)

        # Ensure that the result is still the same as that from 2.5.3:
        expect_snapshot_value(uniqueExample3, style="deparse")

        # Generate a summary file:
        summary.amUnique(uniqueExample3, csv=summaryFile <- tempfile("example3_1.csv"))

        # Ensure that the result is still the same as that from 2.5.3
        expect_snapshot_value(read.csv(file=summaryFile, colClasses="character"), style="deparse")
        file.remove(summaryFile)
    }

    if(HTML) {
        summary.amUnique(uniqueExample3, html=helpHtml("example3_1.html"))
    }

    output = capture.output(
        unclassifiedExample3 <- amPairwise(uniqueExample3$unclassified,
                                uniqueExample3$unique, alleleMismatch=7)
    )
    {
        # cat("\n    output='", output, "'\n", sep="")
        # testthat::expect_match(output, "^$", perl=TRUE, all=FALSE) # (Empty output)

        # Ensure that the result is still the same as that from 2.5.3:
        expect_snapshot_value(unclassifiedExample3, style="deparse")

        # Generate a summary file:
        summary.amPairwise(unclassifiedExample3, csv=summaryFile <- tempfile("example3_2.csv"))

        # Ensure that the result is still the same as that from 2.5.3
        expect_snapshot_value(read.csv(file=summaryFile, colClasses="character"), style="deparse")
        file.remove(summaryFile)
    }

    if(HTML) {
        summary.amPairwise(unclassifiedExample3, html=helpHtml("example3_2.html"))
    }


    output = capture.output(
        multipleMatchExample3 <- amPairwise(uniqueExample3$multipleMatch,
                                            uniqueExample3$unique, alleleMismatch=6)
    )
    {
        # testthat::expect_match(output, "^$", all=FALSE) # (Empty output)

        # Ensure that the result is still the same as that from 2.5.3:
        expect_snapshot_value(multipleMatchExample3, style="deparse")

        # Generate a summary file:
        summary.amPairwise(multipleMatchExample3, csv=summaryFile <- tempfile("example3_3.csv"))

        # Re-read the generated .csv file:
        expect_snapshot_value(read.csv(file=summaryFile, colClasses="character"), style="deparse")
        file.remove(summaryFile)
    }

    if(HTML) {
        summary.amPairwise(multipleMatchExample3, html=helpHtml("example3_3.html"))
    }

})
