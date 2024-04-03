
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
        expect_identical_R(example4, "amExample4_0100_expected", overwrite)
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
        expect_identical_R(uniqueExample4, "amExample4_0101_expected", overwrite)

        # Generate a summary file:
        summary.amUnique(uniqueExample4, csv=summaryFile <- tempfile("example4_1.csv"))

        # Re-read the generated .csv file:
        actual = artReadCsvFile(summaryFile)

        # Ensure that the result is still the same as that from 2.5.3
        expect_identical_R(actual, "amExample4_0102_example4_1_expected", overwrite)
    }

    if(HTML) {
        summary.amUnique(uniqueExample4, html=artHtml("example4_1.html"))
    }

    output = capture.output(
        uniqueExample4ballpark <- amUnique(example4, alleleMismatch=6)
    )
    {
        testthat::expect_match(output, "allelematch:  assuming genotype columns are in pairs, representing 10 loci$", all=FALSE)

        # Ensure that the result is still the same as that from 2.5.3:
        expect_identical_R(uniqueExample4ballpark, "amExample4_0103_expected", overwrite)

        # Generate a summary file:
        summary.amUnique(uniqueExample4ballpark, csv=summaryFile <- tempfile("example4_2.csv"))

        # Re-read the generated .csv file:
        actual = artReadCsvFile(summaryFile)

        # Ensure that the result is still the same as that from 2.5.3
        expect_identical_R(actual, "amExample4_0104_example4_2_expected", overwrite)
    }

    if(HTML) {
        summary.amUnique(uniqueExample4ballpark, html=artHtml("example4_2.html"))
    }

    output = capture.output(
        uniqueExample4high <- amUnique(example4, alleleMismatch=6)
    )
    {
        testthat::expect_match(output, "allelematch:  assuming genotype columns are in pairs, representing 10 loci$", all=FALSE)

        # Ensure that the result is still the same as that from 2.5.3:
        expect_identical_R(uniqueExample4high, "amExample4_0105_expected", overwrite)

        # Generate a summary file:
        summary.amUnique(uniqueExample4high, csv=summaryFile <- tempfile("example4_3.csv"))

        # Re-read the generated .csv file:
        actual = artReadCsvFile(summaryFile)

        # Ensure that the result is still the same as that from 2.5.3
        expect_identical_R(actual, "amExample4_0106_example4_3_expected", overwrite)
    }

    if(HTML) {
        summary.amUnique(uniqueExample4high, html=artHtml("example4_3.html"))
    }


})
