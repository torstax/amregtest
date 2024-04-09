
test_that("Loop the Loop", {
  
  # We want to run amPairwise many times with many combinations of parameters
  # and we want to compare the results with previous runs. Like this:
  snapshot_amPairwise <- function(ds, ...) {
    
    # Log the call to the snapshot file:
    argstr = helpArgToString(...)
    cmdstr = paste("amPairwise(", ds, ", ", argstr, ")", sep="") ; expect_snapshot(cat(cmdstr))
    
    # Make the call:
    pw <- amPairwise(amDatasetFocal=get(ds), ...)
    
    # Log the result to the snapshot file:
    # expect_snapshot(summary.amPairwise(pw)) # Too big. :-(
    expect_snapshot_value(pw, style = "json2")
    
    return(pw)
  }
  
  # Run different data sets with different qualities through the same loops:
  miniExample = data.frame(
    "LOC1a"         = c(11:14),
    "LOC1b"         = c(21:24),
    "LOC2a"         = c(31:33, -99),
    "LOC2b"         = c(41:44)
  )
  data("amExample1")
  data("amExample2") ; amExample2 = amExample2[c(1:20),] # Just keep the first 20 rows to save speed and disk
  data("amExample3") ; amExample3 = amExample3[c(1:20),] # Just keep the first 20 rows to save speed and disk
  data("amExample4") ; amExample4 = amExample4[c(1:20),] # Just keep the first 20 rows to save speed and disk
  data("amExample5") ; amExample5 = amExample5[c(1:20),] # Just keep the first 20 rows to save speed and disk

  amdataMini     = amDataset(miniExample)
  amdataExample1 = amDataset(amExample1, indexColumn="sampleId", metaDataColumn="knownIndividual")
  amdataExample2 = amDataset(amExample2, indexColumn="sampleId", metaDataColumn="knownIndividual")
  amdataExample3 = amDataset(amExample3, indexColumn="sampleId", metaDataColumn="knownIndividual")
  amdataExample4 = amDataset(amExample4, indexColumn="sampleId", metaDataColumn="knownIndividual")
  amdataExample5 = amDataset(amExample5, indexColumn="sampleId", ignoreColumn=c("samplingData", "gender"))

  # Here comes the loops:
  for (amds1 in c("amdataMini", "amdataExample1", "amdataExample2", "amdataExample3", "amdataExample4", "amdataExample5")) {
    #for (amds2 in c("amdataMini", "amdataExample1", "amdataExample2")) { # Must have data columns where all column names are the same
      for (mm in c(0, 1, 3, 5, 7, 9, 11, NA)) {
        for (th in c(NA, 0, 0.1, 0.3, 0.5, 0.7, 0.9, 0.95, 1)) {
          for (meth in c(1, 2)) {
            # Either alleleMismatch or matchThreshold shall be set. Not both:
            if (is.na(mm) == is.na(th)) next
            
            if (!is.na(mm)) {
              snapshot_amPairwise(amds1,  #amds2, 
                       alleleMismatch =  mm,    missingMethod =  meth)
            } else if (!is.na(th)) {
              snapshot_amPairwise(amds1, #amds2,
                       matchThreshold =  th,    missingMethod =  meth)
            } else {
              stop("Unexpected combination of mm=", mm, "and th=", th)
            }
          }
        }
      }
    #}
  }
})


test_that("Value from amPairwise() remains stable", {
  
  # data(amExample1)
  # expect_equal(!!dim(amExample1), c(20,22))
  # 
  # amdata = amDataset1_1= amDataset(amExample1, indexColumn = "sampleId", metaDataColumn = "knownIndividual")
  # expect_snapshot_value(amdata, style = "json2")
  
  # Create valid miniature input sample:    
  sample = miniExample = data.frame(
    "LOC1a"         = c(11:14),
    "LOC1b"         = c(21:24),
    "LOC2a"         = c(31:33, -99),
    "LOC2b"         = c(41:44)
  )
  
  # Remember how the pairwise is calculated for regression testing:
  {
    pw = amPairwise1 = amPairwise(amDataset(sample), matchThreshold=0.95)
    expect_snapshot_value(pw, style = "json2")
    
    expect_snapshot(
      list(
        pw1 = amPairwise(amDataset(sample), matchThreshold=0.95, missingMethod = 1),
        pw2 = amPairwise(amDataset(sample), matchThreshold=0.95, missingMethod = 2)
      )
    )
  }
  
  
  # # Detect changes in the calculation of an amPairwise
  # # whilst regression testing:
  # data("amExample2") # Good quality data set
  # amdataExample2 <- amDataset(amExample2, indexColumn="sampleId",
  #                             metaDataColumn="knownIndividual", missingCode="-99")
  # {
  #   expect_snapshot(pw21 <- amPairwise(amdataExample2, 1))
  #   expect_snapshot_value(pw21, style = "json2")
  #   
  #   expect_snapshot(pw22 <- amPairwise(amdataExample2, 2))
  #   expect_snapshot_value(pw22, style = "json2")
  # }
  
  ## The following amPairwise:es get too big for expect_snapshot_value :-( 
  # data("amExample3") # Marginal quality data set
  # amdataExample3 <- amDataset(amExample3, indexColumn="sampleId",
  #                             metaDataColumn="knownIndividual", missingCode="-99")
  # {
  #   expect_snapshot(pw31 <- amPairwise(amdataExample3, missingMethod = 1))
  #   expect_snapshot_value(pw31, style = "json2")
  # }
  # 
  # data("amExample4") # Poor quality example
  # amdataExample4 <- amDataset(amExample4, indexColumn="sampleId",
  #                             metaDataColumn="knownIndividual", missingCode="-99")
  # {
  #   expect_snapshot(pw41 <- amPairwise(amdataExample4, 1))
  #   expect_snapshot_value(pw41, style = "json2")
  # }
  # 
  # data("amExample5") # Wildlife example
  # amdataExample5 <- amDataset(amExample5, indexColumn="sampleId",
  #                             metaDataColumn="samplingData", missingCode="-99")
  # {
  #   expect_snapshot(pw51 <- amPairwise(amdataExample5, missingMethod = 1))
  #   expect_snapshot_value(pw51, style = "json2")
  # }
  
})
