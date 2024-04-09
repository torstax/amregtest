
test_that("Loop the Loop", {

  # We want to run amCluster many times with many combinations of parameters
  # and we want to compare the results with previous runs. Like this:
  snapshot_amCluster <- function(ds, ...) {
    
    # Log the call to the snapshot file:
    argstr = helpArgToString(...)
    cmdstr = paste("amCluster(", ds, ", ", argstr, ")", sep="") ; expect_snapshot(cat(cmdstr))

    # Capture any errors reported by allelematch:
    pw <- tryCatch( 
      
      # Make the call to allelematch:  
      amCluster(amDatasetFocal=get(ds), ...),
      
      ## If the call fails, return the error message and
      ## the method and arguments that threw the error:
      error = function(e) {
        ret = c(paste("\n  Error    : ", e$message, "\n  Rejected : ", cmdstr, "\n"))

        # Differ between expected and unexpected errors:
        if (!grepl("no clusters formed.  Please set cutHeight lower and run again", e$message)) {
          # Some unexpected error happened. Print it to the screen for easier debugging.
          message("\n  ", ret, sep="")
        }
        
        ret # Return this message from 'tryCatch'
      }
    )
    
    # Log the result to the snapshot file:
    # expect_snapshot(summary.amCluster(pw)) # Too big. :-(
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

  # Parameters to loop over:
  #   " amCluster <- function(amDatasetFocal, runUntilSingletons=TRUE, cutHeight=0.3, missingMethod=2, consensusMethod=1, clusterMethod = "complete") {
  # Regarding clusterMethod: "Only 'complete' acceptable. This option remains for experimental reasons". So, we stick with the default.
  
  # Here comes the loops:
  for (amds in c("amdataMini", "amdataExample1", "amdataExample2", "amdataExample3", "amdataExample4", "amdataExample5")) {
    for (rus in c(TRUE, FALSE)) { # runUntilSingletons
      for (ch in c(0.1, 0.3, 0.5, 0.7, 0.9, 0.95, 0.99)) { # cutHeight. Relevant Values? Range [0..1[ ? NULL?
        for (mis in c(1, 2)) { # missingMethod
          for (cons in c(1,2,3,4)) { # consensusMethod
            snapshot_amCluster(amds, runUntilSingletons=rus, cutHeight=ch, missingMethod=mis, consensusMethod=cons)
          }
        }
      }
    }
  }
})

