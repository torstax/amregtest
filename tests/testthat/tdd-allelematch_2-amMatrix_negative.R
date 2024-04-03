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
  miniExample = data.frame(
    # sampleId        = c(1:4),
    # knownIndividual = c("A","A","B","  B"),
    # dismiss         = c("Rain", " drops", " keep", " fallin' on my head "),
    "LOC1a"         = c(11:14),
    "LOC1b"         = c(21:24),
    "LOC2a"         = c(31:33, -99),
    "LOC2b"         = c(41:44)
  )
  amdata <- amDataset(miniExample)

  # These parameters should probably have caused errors:
  {
    # Correct argument value, but wrong data type:
    expect_error(amMatrix(amdata, missingMethod = "2"), "allelematch:  missingMethod must equal 1 or 2")
    expect_error(amMatrix(amdata, missingMethod = 2.0), "allelematch:  missingMethod must equal 1 or 2")
    expect_error(amMatrix(amdata, missingMethod = 1.00000000000000001), "allelematch:  missingMethod must equal 1 or 2")
    expect_error(amMatrix(amdata, 1.00000000000000001), "allelematch:  missingMethod must equal 1 or 2")
  }

  # The following arguments to missingMethod pas. Maybe they shouldn't:
  expect_snapshot(mx0 <- amMatrix(amdataMini, 1) )    # Expected datatype
  {
    # Make sure that different argument types for the parameter "missingMethod"
    # doesn't change the calculation of the amMatrix:
    expect_identical(mx0, amMatrix(amdata, "1"))  # Unexp
    expect_identical(mx0, amMatrix(amdata, 1.0))  # Unexp
    expect_identical(mx0, amMatrix(amdata, 1.0000000000000001))  # Unexp
    
    expect_snapshot_value(mx0, style = "json2")
  }
})
