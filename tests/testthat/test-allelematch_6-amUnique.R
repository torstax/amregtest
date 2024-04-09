
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
  #   - There is no validation of doPsib in amUnique
  #   - We get 30 errors "'x' must be atomic"! First occurence: amUnique(amdataExample2, cutHeight=0.9, doPsib=missing, consensusMethod=1) 
  #   - Print the unconditional, none-verbose messages using 'message()' rather than 'cat()'?
  #   - cutHeight is changed from 0 to 0.00001 in amUnique. Test separately.

  
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
  
  
  # We want to run amUnique many times with many combinations of parameters,
  # and we want to compare the results with previous runs. Like this:
  snapshot_amUnique <- function(ds, ...) {
    
    # Log the call to the snapshot file:
    argstr = helpArgToString(...)
    cmdstr = paste("amUnique(", ds, ", ", argstr, ")", sep="") ; expect_snapshot(cat(cmdstr))

    # Capture any errors reported by allelematch:
    sink(nullfile()) # Block output from 'cat' within allelematch
    ret <- tryCatch( 
      
      # Make the call to allelematch:  
      amUnique(amDatasetFocal=get(ds), ...),
      
      ## If the call fails, return the error message and
      ## the method and arguments that threw the error:
      error = function(e) {
        ret = c(paste("\n  Error    : ", e$message, "\n  Rejected : ", cmdstr, "\n"))

        # Differ between expected and unexpected errors:
        if (!grepl("no clusters formed.  Please set cutHeight lower and run again|'x' must be atomic", e$message, perl=TRUE)) {
          # Some unexpected error happened. Print it to the screen for easier debugging.
          message("\n  ", ret, sep="")
          
        }
        
        ret # Return this message from 'tryCatch'
      }
    )
    sink() # Block output from 'cat' within allelematch
    
    
    # Log the result to the snapshot file:
    # expect_snapshot_value(ret, style = "json2") # Neither "json2" nor "deparse" works. :-(
    if (class(ret) == "amUnique") {
      expect_snapshot(amCSV.amUnique(ret, csvFile=stdout(), uniqueOnly=FALSE))
    } else {
      expect_snapshot(cat("\n  No amUnique object generated:", ret))
    }
    
    return(ret)
  }

  # Parameters to amUnique:
  #  amUnique <- function(amDatasetFocal, multilocusMap=NULL, alleleMismatch=NULL, matchThreshold=NULL, cutHeight=NULL, doPsib="missing", consensusMethod=1, verbose=FALSE)
  #
  # We simplify by dropping 
  #  - multilocusMap (default is good) 
  #  - alleleMismatch and matchTheashold (calculated from cutHeight) and 
  #  - verbose
  #
  # Parameters left to loop over:
  #  amUnique <- function(amDatasetFocal, cutHeight=NULL, doPsib="missing", consensusMethod=1)
  #
  # Here comes the loops:
  for (amds in c("amdataMini", "amdataExample1", "amdataExample2", "amdataExample3", "amdataExample4", "amdataExample5")) {
    for (ch in c(0, 0.3, 0.5, 0.7, 0.9, 0.95, 0.99, 1)) { # cutHeight. Relevant Values? Range [0..1]
      for (psi in c("missing", "all")) { # doPsib - Method for calculating Probability of sibling
        for (cons in c(1,2,3,4)) { # consensusMethod
          snapshot_amUnique(amds, cutHeight=ch, doPsib=psi, consensusMethod=cons)
        }
      }
    }
  }
})
