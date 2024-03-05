
test_that("We are running the 3rd edition of testthat", code = {
    testthat::expect_gte(!!testthat::edition_get(), 3)
})

HTML=isTRUE(Sys.getenv("ART_GENERATE_HTML") == "TRUE") # Set with Sys.setenv(ART_GENERATE_HTML = "TRUE")

overwrite = FALSE # Use TRUE when creating new tests that need new *_epected data.

test_that("amExample1 from pg 5 in allelematchSuppDoc.pdf is 2.5.3 compatible", code = {

    # Follow the instructions from allelematchSuppDoc.pdf:
    # Test the results within curly brackets ("{ ... }") below the instructions.
    data("amExample1")
    example1 <- amDataset(amExample1, indexColumn="sampleId", ignoreColumn="knownIndividual", missingCode="-99")
    {
        # Ensure that the result is still the same as that from 2.5.3:
        artOverwriteExpected(example1, "amExample1_0100_expected", overwrite)
        testthat::expect_identical( example1, getdata("amExample1_0100_expected"))
    }

    output = capture.output(
        amUniqueProfile(example1, doPlot=TRUE)
    )
    {
        # Ensure that the result is still the same as that from 2.5.3:
        # cat("\nOutput from amUniqueProfile:\n", output, "\nEnd of output\n", sep="\n    ")

        testthat::expect_match(output, "missing data load for input dataset is 0.005 ", fixed=TRUE, all=FALSE)
        testthat::expect_match(output, "allelic diversity for input dataset is 6.1 ", fixed=TRUE, all=FALSE)
        testthat::expect_match(output, "Best guess for optimal parameter at alleleMismatch=2 OR matchThreshold=0.9 OR cutHeight=0.1", fixed=TRUE, all=FALSE)
        testthat::expect_match(output, "Best guess for optimal parameter at alleleMismatch=2 OR matchThreshold=0.9 OR cutHeight=0.1$", all=FALSE)
        testthat::expect_match(output, "Best guess for unique profile morphology: ZeroSecondMinimum", fixed=TRUE, all=FALSE)
    }

    output = capture.output(
        uniqueExample1 <- amUnique(example1, alleleMismatch=2)
    )
    {
        testthat::expect_match(output, "allelematch:  assuming genotype columns are in pairs, representing 10 loci$", all=FALSE)

        # Ensure that the result is still the same as that from 2.5.3:
        artOverwriteExpected(uniqueExample1, "amExample1_0101_expected", overwrite) # This is how the expected data was stored
        testthat::expect_identical( uniqueExample1, getdata("amExample1_0101_expected"))
    }

    if(HTML) {
        ## Save to disk
        summary.amUnique(uniqueExample1, html=artHtml("example1_1.html"))
        ## View in default browser
        # summary.amUnique(uniqueExample1, html=TRUE)
    }

    summary.amUnique(uniqueExample1, csv=summaryFile <- tempfile("example1_1.csv"))
    {
        # Note that the example from allelematchSuppDoc.pdf, summary(uniqueExample1, csv="example1_1.csv"),
        # doesn't work. summary.amUnique is needed.
        #
        # We add the "summaryFile <- tempfile("example1_1.csv")" to avoid that tests generate unwanted files in the workspace.

        # Re-read the generated .csv file:
        actual = artReadCsvFile(summaryFile)
        artOverwriteExpected(actual, "amExample1_0102_example1_1_expected", overwrite) # This is how the expected data was stored
        # Ensure that the result is still the same as that from 2.5.3
        testthat::expect_identical( actual, getdata("amExample1_0102_example1_1_expected"))
    }

    summary.amUnique(uniqueExample1, csv=summaryFile <- tempfile("example1_2.csv"), uniqueOnly=TRUE)
    {
        # Re-read the generated .csv file:
        actual = artReadCsvFile(summaryFile)
        artOverwriteExpected(actual, "amExample1_0103_example1_2_expected", overwrite) # This is how the expected data was stored
        # Ensure that the result is still the same as that from 2.5.3
        testthat::expect_identical( actual, getdata("amExample1_0103_example1_2_expected"))
    }

    example1chk <- amDataset(amExample1, indexColumn="sampleId",
      metaDataColumn="knownIndividual", missingCode="-99")
    {
        # Ensure that the result is still the same as that from 2.5.3:
        artOverwriteExpected(example1chk, "amExample1_0104_expected", overwrite) # This is how the expected data was stored
        testthat::expect_identical( example1chk, getdata("amExample1_0104_expected"))
    }


    output = capture.output(
        uniqueExample1chk <- amUnique(example1chk, alleleMismatch=2)
    )
    {
        testthat::expect_match(output, "allelematch:  assuming genotype columns are in pairs, representing 10 loci$", all=FALSE)

        # Ensure that the result is still the same as that from 2.5.3:
        artOverwriteExpected(uniqueExample1chk, "amExample1_0105_expected", overwrite) # This is how the expected data was stored
        testthat::expect_identical( uniqueExample1chk, getdata("amExample1_0105_expected"))
    }

    if(HTML) {
        ## Save to disk
        summary.amUnique(uniqueExample1chk, html=artHtml("example1_2.html"))
        ## View in default browser
        # summary.amUnique(uniqueExample1chk, html=TRUE)
    }
})
