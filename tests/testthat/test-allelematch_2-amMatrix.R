
test_that("Loop the Loop", {
  
  # Here we do positive regression testing to make sure that we still get 
  # the same results as previously recorded using testthat::expect_snapshot.
  #
  # The recorded results are stored in a file at tests/testthat/_snap/<name_of_this_file>.md
  #
  # We acquire large test coverage by looping over possible argument values,
  # using one for-loop for each parameter in the function we are testing.
  #
  # TODO for allelematch 2.5.3 : 
  #   - Make amMatrix return a class.
  #   - Bug on line 1253: Change "if(length(cutHeight <= 2))" to "if(length(cutHeight) <= 2)"
  #   - Bug on line 1264: Change "if(length(matchThreshold <= 2))" to "if(length(matchThreshold) <= 2)"
  #   - ?amMatrix can be misunderstood to say that one of alleleMismatch, cutHeight and matchThreashold must be present.
  
  
  # Run different data sets with different qualities through the same loops:
  miniExample = data.frame(
    "LOC1a"         = c(11:14),
    "LOC1b"         = c(21:24),
    "LOC2a"         = c(31:33, -99),
    "LOC2b"         = c(41:44),
    "LOC3a"         = c(51:53, -99),
    "LOC3b"         = c(61:64)
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
  
  
  # We want to run amMatrix many times with many combinations of parameters,
  # and we want to compare the results with previous runs. Like this:
  snapshot_amMatrix <- function(ds, ...) {
    
    # Log the call to the snapshot file:
    argstr = helpArgToString(...)
    cmdstr = paste("amMatrix(", ds, ", ", argstr, ")", sep="") ; expect_snapshot(cat(cmdstr))
    
    # Capture any errors reported by allelematch:
    ret <- tryCatch( 
      
      # Make the call to allelematch:  
      capture.output(amMatrix(get(ds), ...)),
      
      ## If the call fails, return the error message and
      ## describe the method and arguments that threw the error:
      error = function(e) {
        ret = c(paste("\n  Error    : ", e$message, "\n  Rejected : ", cmdstr, "\n"))
        
        # Differ between expected and unexpected errors:
        if (!grepl("SOME TO BE DEFINED KNOWN ERROR", e$message, perl=TRUE)) {
          # Some unexpected error happened. Print it to the screen for easier debugging.
          message("\n  ", ret, sep="")
        }
        
        ret
      }
    )
    ret = paste(ret, collapse = "\n")
    
    # Log the result to the snapshot file:
    expect_snapshot(cat(ret))
    
    return(ret)
  }
  
  # Parameters to amMatrix:
  #   amMatrix <- function(amDatasetFocal, missingMethod=2)
  #
  # Here comes the loops:
  for (amds in c("amdataMini", "amdataExample1", "amdataExample2", "amdataExample3", "amdataExample4", "amdataExample5")) {
    for (mm in c(1,2)) {
      snapshot_amMatrix(amds, missingMethod=mm)
    }
  }
})


test_that("Value from amMatrix() remains stable", {
  
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
  
  # Remember how the matrix is calculated for regression testing:
  {
    mx = amMatrix1 = amMatrix(amDataset(sample))
    expect_snapshot_value(mx, style = "json2")
    
    expect_snapshot(
      list(
        mx1 = amMatrix(amDataset(sample), missingMethod = 1),
        mx2 = amMatrix(amDataset(sample), missingMethod = 2)
      )
    )
  }
  
  
  # Detect changes in the calculation of an amMatrix
  # whilst regression testing:
  data("amExample2") # Good quality data set
  amdataExample2 <- amDataset(amExample2, indexColumn="sampleId",
                              metaDataColumn="knownIndividual", missingCode="-99")
  {
    expect_snapshot(mx21 <- amMatrix(amdataExample2, 1))
    expect_snapshot_value(mx21, style = "json2")
    
    expect_snapshot(mx22 <- amMatrix(amdataExample2, 2))
    expect_snapshot_value(mx22, style = "json2")
  }
  
  ## The following amMatrix:es get too big for expect_snapshot_value :-( 
  # data("amExample3") # Marginal quality data set
  # amdataExample3 <- amDataset(amExample3, indexColumn="sampleId",
  #                             metaDataColumn="knownIndividual", missingCode="-99")
  # {
  #   expect_snapshot(mx31 <- amMatrix(amdataExample3, missingMethod = 1))
  #   expect_snapshot_value(mx31, style = "json2")
  # }
  # 
  # data("amExample4") # Poor quality example
  # amdataExample4 <- amDataset(amExample4, indexColumn="sampleId",
  #                             metaDataColumn="knownIndividual", missingCode="-99")
  # {
  #   expect_snapshot(mx41 <- amMatrix(amdataExample4, 1))
  #   expect_snapshot_value(mx41, style = "json2")
  # }
  # 
  # data("amExample5") # Wildlife example
  # amdataExample5 <- amDataset(amExample5, indexColumn="sampleId",
  #                             metaDataColumn="samplingData", missingCode="-99")
  # {
  #   expect_snapshot(mx51 <- amMatrix(amdataExample5, missingMethod = 1))
  #   expect_snapshot_value(mx51, style = "json2")
  # }
  
})
