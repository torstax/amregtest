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

  # Miniature input sample:
  sample = miniExample = data.frame(
    sampleId        = c(1:4),
    knownIndividual = c("A","A","B","  B"),
    dismiss         = c("Rain", " drops", " keep", " fallin'"),
    "LOC1a"         = c(11:14),
    "LOC1b"         = c(21:24),
    "LOC2a"         = c(31:33, -88),
    "LOC2b"         = c(41:44)
  )

  {
    # These bad parameters should have caused errors:

    # TODO : Catch that integer values for missingCode are stored in amDataset as integer! Should be character!
    # All surprising conditions in the state of an object are error prone.
    x = amDataset(sample, missingCode=-88)

    expect_identical(x$missingCode, "-88")

    # TODO : Catch that indexColumn is overlapped by metaDataColumn or ignoreColumn
    expect_error(amDataset(sample, indexColumn = "sampleId", metaDataColumn = "sampleId"), "unused argument")
    expect_error(amDataset(sample, indexColumn = "sampleId", ignoreColumn = "sampleId"), "unused argument")
  }

})

#' Missing cover:
#' amDataset: Param checking
#'
#' amCluster:
#'    482	489: if (inherits(amDatasetFocal, "amInterpolate")) { ## TODO: Remove? class "amInterpolate" is never set anywhere.
#'    summary.amCluster
#'    amHTML.amCluster
#'    amCSV.amCluster
#'
#' summary.amPairwise
#'    amHTML.amPairwise
#'    amCSV.amPairwise
#'
#' summary.amUnique
#' amUnique : Param checking,
#'    1099--1101
#'
#' amUniqueProfile : Parm checking.
#'   if (verbose)
#' amCSSForHTML
#'
