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

    # Test that the result is numeric
    testthat::expect_identical( wantedVersion, actualVersion )
})


# test_that("Wanted version of of package allelematch is loaded", code = {
#
#
#     # Test that the result is numeric
#     testthat::expect_identical( wantedVersion, actualVersion )
# })
