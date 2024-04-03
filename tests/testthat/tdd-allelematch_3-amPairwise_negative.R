#
# This file is called 'tdd-xxxx.R' rather than 'test-xxx.R'.
# It is therefore not included the normal package tests.
# But they can still be executed manually.
#
# The content of a 'tdd-xxxx.R' contains tests that currently fail because of 
# some flaws in allelematch.
#
# The intention is to fix the flaws by using the Test Driven Design (TDD) approach.
#
# In TDD, you (1) make sure the flaw can be reproduced and detected with a new test.
# You then (2) fix the flaw and (3) make sure the test are now working.
# You  then (4) move the tests to 'test-xxx.R' to ensure the fixed problems 
# never occur again.
#
test_that("Test Driven Design, TDD - Tests that are still failing", {
  
  # Create valid miniature input sample:    
  miniExample1 = data.frame(
    "LOC1a"         = c(11:14),
    "LOC1b"         = c(21:24),
    "LOC2a"         = c(31:33, -99),
    "LOC2b"         = c(41:44)
  )
  {
    amdata <- amDataset(miniExample1)
  }

  # These bad parameters should have caused errors:
  {
    # These bad parameters should have caused errors:

    # Correct argument value, but wrong data type:
    expect_identical(class(amdata), "amDataset")
    
    # TODO: These arguments do not throw errors. But maybe they should:
    expect_error(amPairwise(amdata, missingMethod = "2", alleleMismatch=2), "allelematch:  missingMethod must equal 1 or 2")
    expect_error(amPairwise(amdata, missingMethod = 2.0, alleleMismatch=2), "allelematch:  missingMethod must equal 1 or 2")

    # This call does not generate any error:    
    amPairwise(amdata, matchThreshold=0.5)

    # TODO: The following error messages are invalid:
    must_be_amDataset = 'allelematch:  amDatasetFocal and amDatasetComparison must be an object of class "amDataset"'
    expect_error(amPairwise(amdata, matchThreshold=0,5), must_be_amDataset) # /NOK
    expect_error(amPairwise(amdata, matchThreshold="0,5"), "matchThreshold`: non-numeric argument to binary operator") # /OK
    expect_error(amPairwise(amdata, amDatasetComparison=amdata, matchThreshold=0,5), "allelematch:  please specify alleleMismatch OR matchThreshold.") # /NOK
    expect_error(amPairwise(amDatasetFocal=amdata, amDatasetComparison=amdata, matchThreshold=0,5), "allelematch:  please specify alleleMismatch OR matchThreshold.") # /NOK
    expect_error(amPairwise(amdata, missingMethod = 1.00000000000000001, matchThreshold=0,5), must_be_amDataset) # /NOK
    expect_error(amPairwise(amdata, matchThreshold=0,5, "1"), must_be_amDataset) # /NOK
    expect_error(amPairwise(amdata, matchThreshold=0,5, 1.0), must_be_amDataset) # /NOK
    expect_error(amPairwise(amdata, matchThreshold=0,5, 1.0000000000000001), must_be_amDataset) # /NOK
    
  }

  # The following arguments to missingMethod pass. Maybe they shouldn't:
  expect_identical(class(amdata), "amDataset")
  expect_snapshot(pw0 <- amPairwise(amdata, alleleMismatch=2))
  # expect_snapshot(pw0 <- amPairwise(amdataMini1, matchThreshold=0,5) )    # Expected datatype
  {

    # Make sure that different argument types for the parameter "missingMethod"
    # doesn't change the calculation of the amPairwise:
    # expect_identical(pw0, amPairwise(amdata, matchThreshold=0.5, 1.0))  # Unexp
    expect_identical(pw0, amPairwise(amdata, matchThreshold=0.5))
    
    expect_snapshot_value(pw0, style = "json2")
  }
})
