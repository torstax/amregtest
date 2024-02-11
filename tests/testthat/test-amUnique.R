# library(testthat);
# # context("Temperature function testing");
# library(allelematch)
# library(regressiontest);
# #library(remotes)


test_that("I can use the second edition of testthat", code = {
    testthat::local_edition(2)
    expect_true(TRUE)
})


test_that("I can use the 3rd edition of testthat", code = {
    testthat::local_edition(3)
    expect_true(TRUE)
})


test_that("Wanted version of of package allelematch is loaded", code = {

    wantedVersion = "2.5.3"
    actualVersion = toString(utils::packageVersion("allelematch")) # auAssertAllelematchVersion(wantedVersion)
    testthat::expect_identical( wantedVersion, actualVersion )
})


test_that("amExample1 doesn't break legacy", code = {

    # Follow the instructions from allelematchSuppDoc.pdf:
    data("amExample1")
    example1 <- amDataset(amExample1, indexColumn="sampleId", ignoreColumn="knownIndividual", missingCode="-99")
    # TODO: Compare with expected?

    amUniqueProfile(example1, doPlot=TRUE)
    # TODO: Write to .csv instead and compare with expected?

    uniqueExample1 <- amUnique(example1, alleleMismatch=2)

    ## Save to disk
    summary(uniqueExample1, html="example1_1.html")

    ## View in default browser
    summary(uniqueExample1, html=TRUE)

    # Test that ...
    testthat::expect_identical(999, 999)
})
