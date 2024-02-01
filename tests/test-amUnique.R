library(testthat);
# context("Temperature function testing");
library(allelematch)
library(regressiontest);
library(remotes)

# # Check that we are standing in a relevant directory
# here::i_am("tests/test-amUnique.R")
# stopifnot(file.exists(here::here("R/.")))
# R_PROJ_DIR          = here::here()


test_that("I can use the 3rd edition of testthat", code = {
    local_edition(3)
    expect_true(TRUE)
})


test_that("Loaded version of package allelematch", code = {

    wantedVersion = "2.5.2"
    actualVersion = auAssertAllelematchVersion(wantedVersion)

    # Test that the result is numeric
    testthat::expect_identical( wantedVersion, actualVersion )
})
