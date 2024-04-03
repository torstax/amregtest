
HTML=isTRUE(Sys.getenv("ART_GENERATE_HTML") == "TRUE") # Set with Sys.setenv(ART_GENERATE_HTML = "TRUE")

overwrite = FALSE # Use TRUE when creating new tests that need new *_epected data.

test_that("amExample2 results from pg 8 in allelematchSuppDoc.pdf 2.5.3 compatible", code = {

    # Prepare for printing large snapshot files:
    withr::local_options(width=200) # Allow longer lines for the summaries:

    # Follow the instructions from allelematchSuppDoc.pdf, pg:
    data("amExample2")
    example2 <- amDataset(amExample2, indexColumn="sampleId",
      metaDataColumn="knownIndividual", missingCode="-99")
    {
        # Ensure that the result is still the same as that from 2.5.3:
        expect_identical_R( example2, "amExample2_0100_expected", overwrite)
    }

    output = capture.output(
        amUniqueProfile(example2, doPlot=TRUE)
    )
    {
        # Check that the output to STDOUT is still the same as that from 2.5.3:
        testthat::expect_match(output, "missing data load for input dataset is 0.046 ", fixed=TRUE, all=FALSE)
        testthat::expect_match(output, "allelic diversity for input dataset is 7.9 ", fixed=TRUE, all=FALSE)
        testthat::expect_match(output, "Best guess for optimal parameter at alleleMismatch=3 OR matchThreshold=0.85 OR cutHeight=0.15$", all=FALSE)
        testthat::expect_match(output, "Best guess for unique profile morphology: ZeroSecondMinimum$", all=FALSE)
    }

    output = capture.output(
        uniqueExample2 <- amUnique(example2, alleleMismatch=3)
    )
    {
        # Check that the output to STDOUT is still the same as that from 2.5.3:
        testthat::expect_match(output, "allelematch:  assuming genotype columns are in pairs, representing 10 loci$", all=FALSE)

        # Ensure that the result is still the same as that from 2.5.3:
        expect_identical_R(uniqueExample2, "amExample2_0101_expected", overwrite)

        # Generate a summary file:
        summary.amUnique(uniqueExample2, csv=summaryFile <- tempfile("example2_1.csv"))

        # Re-read the generated .csv file:
        actual = artReadCsvFile(summaryFile)

        # Ensure that the result is still the same as that from 2.5.3
        expect_identical_R(actual, "amExample2_0102_example2_1_expected", overwrite)
    }

    if(HTML) {
        summary.amUnique(uniqueExample2, html=artHtml("example2_1.html"))
    }

    output = capture.output(
            uniqueExample2 <- amUnique(example2, alleleMismatch=3, doPsib="all")
    )
    {
        testthat::expect_match(output, "allelematch:  assuming genotype columns are in pairs, representing 10 loci$", all=FALSE)

        # Ensure that the result is still the same as that from 2.5.3:
        expect_identical_R(uniqueExample2, "amExample2_0103_expected", overwrite)

        # Generate a summary file:
        summary.amUnique(uniqueExample2, csv=summaryFile <- tempfile("example2_2.csv"))

        # Re-read the generated .csv file:
        actual = artReadCsvFile(summaryFile)

        # Ensure that the result is still the same as that from 2.5.3
        expect_identical_R(actual, "amExample2_0104_example2_2_expected", overwrite)
    }

    if(HTML) {
        summary.amUnique(uniqueExample2, html=artHtml("example2_2.html"))
    }

    # Copied from test of amExample1:
    example2chk <- amDataset(amExample2, indexColumn="sampleId",
                             metaDataColumn="knownIndividual", missingCode="-99")
    {
        # Ensure that the result is still the same as that from 2.5.3:
        expect_identical_R(example2chk, "amExample2_0105_expected", overwrite)
    }

    output = capture.output(
        uniqueExample2chk <- amUnique(example2chk, alleleMismatch=2)
    )
    {
        testthat::expect_match(output, "allelematch:  assuming genotype columns are in pairs, representing 10 loci$", all=FALSE)

        # Ensure that the result is still the same as that from 2.5.3:
        expect_identical_R(uniqueExample2chk, "amExample2_0106_expected", overwrite)
    }

})
