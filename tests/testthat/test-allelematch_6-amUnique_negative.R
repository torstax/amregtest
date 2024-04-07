
test_that("Validation of arguments to amUnique() is working", {

  # Create valid miniature input sample:
  miniExample1 = data.frame(
    "LOC1a"         = c(11:14),
    "LOC1b"         = c(21:24),
    "LOC2a"         = c(31:33, -99),
    "LOC2b"         = c(41:44)
  )
  {
    expect_snapshot(print(miniExample1))
    expect_snapshot(amdataMini1 <- amDataset(miniExample1))
    expect_snapshot(print.amDataset(amdataMini1))
  }

  # Parameters are:
  # amUnique <- function(amDatasetFocal, multilocusMap=NULL, alleleMismatch=NULL, matchThreshold=NULL, cutHeight=NULL, doPsib="missing", consensusMethod=1, verbose=FALSE)

  # Test checks against invalid first param to amDataSet(multilocusDataset):
  {
    expect_error(amUnique(NULL),  'allelematch:  amDatasetFocal must be an object of class "amDataset"')
    expect_error(amUnique(NA),    'allelematch:  amDatasetFocal must be an object of class "amDataset"')
    expect_error(amUnique(2),     'allelematch:  amDatasetFocal must be an object of class "amDataset"')
  }

  # Use the valid amdata to test blocking of other invalid arguments:
  amdata = amdataMini1
  sink(nullfile())
  {
    expect_error(amUnique(amdata, multilocusMap = NA),  "allelematch:  multilocusMap must be a vector of integers or strings giving the mappings onto loci")
    expect_error(amUnique(amdata, multilocusMap=c(1,2,3,4,5,6)),  "allelematch:  multilocusMap must be a vector of integers or strings") # Too long multilocusMap
    expect_error(amUnique(amdata, multilocusMap=c(1,1)),  "allelematch:  multilocusMap must be a vector of integers or strings") # Too short multilocusMap
    # expect_error(amUnique(amdata, multilocusMap=c(FALSE,FALSE,TRUE,TRUE)),  "TODO") # TODO: Neither int nor char => Should fail

    expect_error(amUnique(amdata, multilocusMap = c(1,1,2,2)), "allelematch:  please specify alleleMismatch OR matchThreshold OR cutHeight.")

    expect_no_error(amUnique(amdata, multilocusMap = c(1,1,2,2), alleleMismatch=1))
    expect_no_error(amUnique(amdata, alleleMismatch=1))

    oneOf = "^allelematch:  please specify alleleMismatch OR matchThreshold OR cutHeight.$"
    expect_error(amUnique(amdata, alleleMismatch=1, matchThreshold=0.5, cutHeight=0.5), oneOf)
    expect_error(amUnique(amdata, alleleMismatch=1, matchThreshold=0.5), oneOf)
    expect_error(amUnique(amdata, alleleMismatch=1, cutHeight=0.5), oneOf)
    expect_error(amUnique(amdata, matchThreshold=0.5, cutHeight=0.5), oneOf)

    expect_error(amUnique(amdata, alleleMismatch=5), "no clusters formed.  Please set cutHeight lower and run again.") # TODO: alleleMismatch can't larger than number of alleles
    expect_error(amUnique(amdata, alleleMismatch=-1), "matchThreshold must be between 0 and 1") # TODO: alleleMismatch can't be negative

    expect_error(amUnique(amdata, matchThreshold=-0.0001), "matchThreshold must be between 0 and 1")
    expect_error(amUnique(amdata, matchThreshold=1.0001),  "matchThreshold must be between 0 and 1")
    expect_error(amUnique(amdata, matchThreshold=0),  "no clusters formed.  Please set cutHeight lower and run again")

    expect_no_error(amUnique(amdata, matchThreshold=1))

    expect_error(amUnique(amdata, cutHeight=-0.0001), "cutHeight must be greater than 0 and less than 1") # TODO: alleleMismatch can't be negative
    expect_error(amUnique(amdata, cutHeight=1.00001), "cutHeight must be greater than 0 and less than 1") # TODO: alleleMismatch can't be negative
    expect_error(amUnique(amdata, cutHeight=1), "no clusters formed.  Please set cutHeight lower and run again") # TODO : Error detection and message not alligned

    expect_no_error(amUnique(amdata, cutHeight=0)) # TODO : Error detection and message not alligned
    expect_no_error(amUnique(amdata, cutHeight=0.5))

    expect_no_error(amUnique(amdata, cutHeight=0.5, doPsib="missing"))
    expect_no_error(amUnique(amdata, cutHeight=0.5, doPsib="all"))

    expect_no_error(amUnique(amdata, cutHeight=0.5, doPsib="a")) # TODO : Should fail!
    expect_no_error(amUnique(amdata, cutHeight=0.5, doPsib="")) # TODO : Should fail!
    expect_no_error(amUnique(amdata, cutHeight=0.5, doPsib="THIS SHOULD FAIL!")) # TODO : Should fail!
    expect_error(amUnique(amdata, cutHeight=0.5, doPsib=NULL), "argument is of length zero") # TODO : Bad msg. But perhaps from RLang?
    expect_error(amUnique(amdata, cutHeight=0.5, doPsib=NA), "missing value where TRUE/FALSE needed") # TODO : Bad msg

    expect_no_error(amUnique(amdata, cutHeight=0.5, consensusMethod=1))
    expect_no_error(amUnique(amdata, cutHeight=0.5, consensusMethod=4))

    expect_error(amUnique(amdata, cutHeight=0.5, consensusMethod=0), "consensusMethod must equal 1, 2, 3 or 4")
    expect_error(amUnique(amdata, cutHeight=0.5, consensusMethod=5), "consensusMethod must equal 1, 2, 3 or 4")

    expect_no_error(amUnique(amdata, cutHeight=0.5, verbose=FALSE))

    expect_no_error(amUnique(amdata, cutHeight=0.5, verbose=TRUE))

    expect_error(amUnique(amdata, cutHeight=0.5, verbose="ESLAF"), "argument is not interpretable as logical") # TODO: Bad msg.
  }
  sink()

  # The output below changed between allelematch 2.5.2 and 2.5.3, which is OK:
  expect_output(summary.amUnique(amUnique(amdata, cutHeight=0.5)), 'Console summary is not available for "amUnique" objects.  Please use summary(.amUnique)?\\(x, html=TRUE\\) or summary(.amUnique)?\\(x, csv="file.csv"\\) options.')


})
