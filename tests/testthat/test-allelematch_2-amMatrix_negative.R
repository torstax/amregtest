
test_that("Validation of arguments to amMatrix() is working", {

  # Test checks against invalid first param to amDataSet(multilocusDataset):
  {
    expect_error(amMatrix(NULL),      "allelematch:  amDatasetFocal must be an object of class \"amDataset\"")
    expect_error(amMatrix(NA),        "allelematch:  amDatasetFocal must be an object of class \"amDataset\"")
  }
  
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
  {
    expect_snapshot(print(miniExample))
    expect_snapshot(amdataMini <- amDataset(miniExample))
    expect_snapshot(print.amDataset(amdataMini))
  }
  
  # Use the valid amdata to test blocking of other invalid arguments:
  {
    amdata = amdataMini
    expect_error(amMatrix(amdata, missingNoneExisting =2), "unused argument")  
    expect_error(amMatrix(amdata, missingMethod = 0),   "allelematch:  missingMethod must equal 1 or 2")
    expect_error(amMatrix(amdata, missingMethod = 3),   "allelematch:  missingMethod must equal 1 or 2")
    expect_error(amMatrix(amdata, missingMethod = NULL),"argument is of length zero")
    expect_error(amMatrix(amdata, missingMethod = NA),  "allelematch:  missingMethod must equal 1 or 2")
    expect_error(amMatrix(amdata, missingMethod = "2.0"), "allelematch:  missingMethod must equal 1 or 2")
    expect_error(amMatrix(amdata, missingMethod = " 2"), "allelematch:  missingMethod must equal 1 or 2")
    expect_error(amMatrix(amdata, missingMethod = "2 "), "allelematch:  missingMethod must equal 1 or 2")
    expect_error(amMatrix(amdata, missingMethod = 2.000001), "allelematch:  missingMethod must equal 1 or 2")

    expect_snapshot_value(amdata, style = "json2")
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
