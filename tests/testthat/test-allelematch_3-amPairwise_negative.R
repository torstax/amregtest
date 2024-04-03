
test_that("Validation of arguments to amPairwise() is working", {

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
    expect_snapshot_value(amdataMini1, style="json2")

    expect_identical(class(amdataMini1), "amDataset")
    expect_true(inherits(amdataMini1, "amDataset"))
  }

  # Create a miniature input sample with extra, odd column:
  oddExample2 = data.frame(
    "LOC1a"         = c(11:14),
    "LOC1b"         = c(21:24),
    "LOC2a"         = c(31:33, -99),
    "LOC2b"         = c(41:44),
    "LOC3a"         = c(51:53, -99)  # Extra, odd column
  )
  {
    expect_snapshot(print(oddExample2))
    expect_snapshot(amdataOdd2 <- amDataset(oddExample2))
    expect_snapshot(print.amDataset(amdataOdd2))
    expect_snapshot_value(amdataOdd2, style = "json2")
  }

    # Parameters are:
  # (amDatasetFocal, amDatasetComparison=amDatasetFocal, alleleMismatch=NULL, matchThreshold=NULL, missingMethod=2) {

  # Test checks against invalid first param to amDataSet(multilocusDataset):
  {
    expect_error(amPairwise(NULL),  "allelematch:  amDatasetFocal and amDatasetComparison must be an object of class \"amDataset\"")
    expect_error(amPairwise(NA),    "allelematch:  amDatasetFocal and amDatasetComparison must be an object of class \"amDataset\"")
    expect_error(amPairwise(2),     "allelematch:  amDatasetFocal and amDatasetComparison must be an object of class \"amDataset\"")
    expect_error(amPairwise(hipphopp=2), "unused argument")
    expect_error(amPairwise(amdataOdd2), "allelematch:  please specify alleleMismatch OR matchThreshold.")

    # An odd number of columns does not generate an error. Maybe it should?
    # expect_error(amPairwise(amdataOdd2, alleleMismatch=5), "allelematch:  there are an odd number of genotype columns in amDatasetFocal")
  }

  # Test blocking of invalid arguments for second parameter, amDatasetComparison:
  amdata = amdataMini1
  {
    must_be_amDataset = 'allelematch:  amDatasetFocal and amDatasetComparison must be an object of class "amDataset"'

    expect_error(amPairwise(amdata, amDatasetComparison = 0),   must_be_amDataset)
    expect_error(amPairwise(amdata, amDatasetComparison = 3),   must_be_amDataset)
    expect_error(amPairwise(amdata, amDatasetComparison = NULL),must_be_amDataset)
    expect_error(amPairwise(amdata, amDatasetComparison = NA),  must_be_amDataset)
    expect_error(amPairwise(amdata, amDatasetComparison = ""),  must_be_amDataset)
    expect_error(amPairwise(amdata, 1.00000000000000001),       must_be_amDataset)
    expect_error(amPairwise(amdata, 1,0),                       must_be_amDataset)
    expect_error(amPairwise(amdata, amDatasetComparison = amdataOdd2),  "allelematch:  please specify alleleMismatch OR matchThreshold")
    expect_error(amPairwise(amdata, amDatasetComparison = amdataOdd2, alleleMismatch=2),  "amDatasetFocal and amDatasetComparison must have the same number of columns / loci")
    expect_error(amPairwise(amdata, amDatasetComparison = amdataOdd2, matchThreshold=0.5),"amDatasetFocal and amDatasetComparison must have the same number of columns / loci")
  }

  # Use the valid amdata to test blocking of other invalid arguments:
  {
    expect_error(amPairwise(amdata, missingMethod = 0),   "allelematch:  missingMethod must equal 1 or 2")
    expect_error(amPairwise(amdata, missingMethod = 3),   "allelematch:  missingMethod must equal 1 or 2")
    expect_error(amPairwise(amdata, missingMethod = NULL),"argument is of length zero")
    expect_error(amPairwise(amdata, missingMethod = NA),  "allelematch:  missingMethod must equal 1 or 2")
    expect_error(amPairwise(amdata, missingMethod = "2.0"), "allelematch:  missingMethod must equal 1 or 2")
    expect_error(amPairwise(amdata, missingMethod = " 2"), "allelematch:  missingMethod must equal 1 or 2")
    expect_error(amPairwise(amdata, missingMethod = "2 "), "allelematch:  missingMethod must equal 1 or 2")
    expect_error(amPairwise(amdata, missingMethod = 2,0),  must_be_amDataset)
    expect_error(amPairwise(amdata, missingMethod = 2.000000000000001), "allelematch:  missingMethod must equal 1 or 2")

    expect_snapshot_value(amdata, style = "json2")

    # The following calls did not throw an error. Maybe they should?
    # expect_error(amPairwise(amdata, all=2), "unused argument")   # 'all' matches 'alleleMismatch'

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
