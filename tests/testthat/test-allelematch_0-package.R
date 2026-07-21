
test_that("3rd edition of testthat", code = {
  # If this tests fails, then call
  #   usethis::use_testthat(3)
  # to configure DESCRIPTION to use 3rd edition of 'testthat'.
  testthat::expect_gte(!!testthat::edition_get(), 3)
})

