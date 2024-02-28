
test_that("We are running the 3rd edition of testthat", code = {
    testthat::expect_gte(!!testthat::edition_get(), 3)
})

test_that("amExample1 from allelematchSuppDoc.pdf is 2.5.3 compatible", code = {

    # Follow the instructions from allelematchSuppDoc.pdf:
    # Test the results within curly brackets ("{ ... }") below the instructions.
    data("amExample1")
    example1 <- amDataset(amExample1, indexColumn="sampleId", ignoreColumn="knownIndividual", missingCode="-99")
    {
        # Ensure that the result is still the same as that from 2.5.3:
        # auDumpToData(example1, "exp_01_00", dir=here::here("data"))
        testthat::expect_identical( example1, getdata("exp_01_00"))
    }

    output = capture.output(
        amUniqueProfile(example1, doPlot=TRUE), type = c("output")
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
        # auDumpToData(uniqueExample1, "exp_01_01", dir=here::here("data")) # This is how the expected data was stored
        testthat::expect_identical( uniqueExample1, getdata("exp_01_01"))
    }

    summary.amUnique(uniqueExample1, csv=summaryFile <- tempfile("example1_1.csv"))
    {
        # Note that the example from allelematchSuppDoc.pdf, summary(uniqueExample1, csv="example1_1.csv"),
        # doesn't work. summary.amUnique is needed.
        #
        # We add the "summaryFile <- tempfile("example1_1.csv")" to avoid that tests generate unwanted files in the workspace.

        # Re-read the generated .csv file:
        actual = auReadCsvFile(summaryFile)
        # auDumpToData(actual, "exp_01_02_example1_1", dir=here::here("data")) # This is how the expected data was stored
        # Ensure that the result is still the same as that from 2.5.3
        testthat::expect_identical( actual, getdata("exp_01_02_example1_1"))
    }

    summary.amUnique(uniqueExample1, csv=summaryFile <- tempfile("example1_2.csv"), uniqueOnly=TRUE)
    {
        # Re-read the generated .csv file:
        actual = auReadCsvFile(summaryFile)
        # auDumpToData(actual, "exp_01_03_example1_2", dir=here::here("data")) # This is how the expected data was stored
        # Ensure that the result is still the same as that from 2.5.3
        testthat::expect_identical( actual, getdata("exp_01_03_example1_2"))
    }

    example1chk <- amDataset(amExample1, indexColumn="sampleId",
      metaDataColumn="knownIndividual", missingCode="-99")
    {
        # Ensure that the result is still the same as that from 2.5.3:
        # auDumpToData(example1chk, "exp_01_04", dir=here::here("data")) # This is how the expected data was stored
        testthat::expect_identical( example1chk, getdata("exp_01_04"))
    }


    output = capture.output(
        uniqueExample1chk <- amUnique(example1chk, alleleMismatch=2)
    )
    {
        testthat::expect_match(output, "allelematch:  assuming genotype columns are in pairs, representing 10 loci$", all=FALSE)

        # Ensure that the result is still the same as that from 2.5.3:
        # auDumpToData(uniqueExample1chk, "exp_01_05", dir=here::here("data")) # This is how the expected data was stored
        testthat::expect_identical( uniqueExample1chk, getdata("exp_01_05"))
    }

})


test_that("amExample2 results from sample usage in allelematchSuppDoc.pdf are 2.5.3 compatible", code = {

    # Follow the instructions from allelematchSuppDoc.pdf:
    data("amExample2")
    example2 <- amDataset(amExample2, indexColumn="sampleId",
      metaDataColumn="knownIndividual", missingCode="-99")
    {
        # Ensure that the result is still the same as that from 2.5.3:
        # auDumpToData(example2, "exp_02_00", dir=here::here("data"))  # This is how the expected data was stored
        testthat::expect_identical( example2, getdata("exp_02_00"))
    }

    output = capture.output(
        amUniqueProfile(example2, doPlot=TRUE), type = c("output")
    )
    {
        # Ensure that the result is still the same as that from 2.5.3:
        # cat("\nOutput from amUniqueProfile:\n", output, "\nEnd of output\n", sep="\n    ")

        testthat::expect_match(output, "missing data load for input dataset is 0.046 ", fixed=TRUE, all=FALSE)
        testthat::expect_match(output, "allelic diversity for input dataset is 7.9 ", fixed=TRUE, all=FALSE)
        testthat::expect_match(output, "Best guess for optimal parameter at alleleMismatch=3 OR matchThreshold=0.85 OR cutHeight=0.15$", all=FALSE)
        testthat::expect_match(output, "Best guess for unique profile morphology: ZeroSecondMinimum$", all=FALSE)
    }

    output = capture.output(
        uniqueExample2 <- amUnique(example2, alleleMismatch=3)
    )
    {
        testthat::expect_match(output, "allelematch:  assuming genotype columns are in pairs, representing 10 loci$", all=FALSE)

        # Ensure that the result is still the same as that from 2.5.3:
        # auDumpToData(uniqueExample2, "exp_02_01", dir=here::here("data")) # This is how the expected data was stored
        testthat::expect_identical( uniqueExample2, getdata("exp_02_01"))

        # Generate a summary file:
        summary.amUnique(uniqueExample2, csv=summaryFile <- tempfile("example2_1.csv"))

        # Re-read the generated .csv file:
        actual = auReadCsvFile(summaryFile)
        # auDumpToData(actual, "exp_02_02_example2_1", dir=here::here("data")) # This is how the expected data was stored
        # Ensure that the result is still the same as that from 2.5.3
        testthat::expect_identical( actual, getdata("exp_02_02_example2_1"))
    }

    output = capture.output(
            uniqueExample2 <- amUnique(example2, alleleMismatch=3, doPsib="all")
    )
    {
        testthat::expect_match(output, "allelematch:  assuming genotype columns are in pairs, representing 10 loci$", all=FALSE)

        # Ensure that the result is still the same as that from 2.5.3:
        # auDumpToData(uniqueExample2, "exp_02_03", dir=here::here("data")) # This is how the expected data was stored
        testthat::expect_identical( uniqueExample2, getdata("exp_02_03"))

        # Generate a summary file:
        summary.amUnique(uniqueExample2, csv=summaryFile <- tempfile("example2_2.csv"))

        # Re-read the generated .csv file:
        actual = auReadCsvFile(summaryFile)
        # auDumpToData(actual, "exp_02_04_example2_2", dir=here::here("data")) # This is how the expected data was stored
        # Ensure that the result is still the same as that from 2.5.3
        testthat::expect_identical( actual, getdata("exp_02_04_example2_2"))
    }


    # Copied from test of amExample1:
    example2chk <- amDataset(amExample2, indexColumn="sampleId",
                             metaDataColumn="knownIndividual", missingCode="-99")
    {
        # Ensure that the result is still the same as that from 2.5.3:
        # auDumpToData(example2chk, "exp_02_05", dir=here::here("data")) # This is how the expected data was stored
        testthat::expect_identical( example2chk, getdata("exp_02_05"))
    }

    output = capture.output(
        uniqueExample2chk <- amUnique(example2chk, alleleMismatch=2)
    )
    {
        testthat::expect_match(output, "allelematch:  assuming genotype columns are in pairs, representing 10 loci$", all=FALSE)

        # Ensure that the result is still the same as that from 2.5.3:
        # auDumpToData(uniqueExample2chk, "exp_02_06", dir=here::here("data")) # This is how the expected data was stored
        testthat::expect_identical( getdata("exp_02_06"), uniqueExample2chk)
    }

})
