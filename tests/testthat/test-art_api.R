
test_that("We are running the 3rd edition of testthat", code = {
  # If this tests fails, then call
  #   usethis::use_testthat(3)
  # to configure DESCRIPTION to use 3rd edition of 'testthat'.
  testthat::expect_gte(!!testthat::edition_get(), 3)
})

test_that("art_api functions working", {

  sink(nullfile())

  # These tests should give 100% test coverage for our API calls:
  expect_no_error(artVersion())
  expect_output(artList(), "Reproduction of the examples in 'allelematchSuppDoc.pdf':")
  expect_no_error(artRun("^$")) # Special filter to avoid starting tests recursively

  sink()
})

