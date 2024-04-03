
test_that("Loop the Loop", {
  
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
  
  # multilocusMaps:
  mlm1 = c("LOC1",  "LOC1",  "LOC2", "LOC2", "LOC3", "LOC3", "LOC4", "LOC4", "LOC5", "LOC5", "LOC6", "LOC6", "LOC7", "LOC7", "LOC8", "LOC8", "LOC9", "LOC9", "LOC10", "LOC10")
  mlm2 = c("LOC10", "LOC10", "LOC9", "LOC9", "LOC8", "LOC8", "LOC7", "LOC7", "LOC6", "LOC6", "LOC5", "LOC5", "LOC4", "LOC4", "LOC3", "LOC3", "LOC2", "LOC2", "LOC1",  "LOC1")
  
  
  # We want to run amAlleleFreq many times with many combinations of parameters
  # and we want to compare the results with previous runs. Like this:
  snapshot_amAlleleFreq <- function(ds, multilocusMap=NULL) {
    
    # Log the call to the snapshot file:
    { 
      argstr = ifelse(is.null(multilocusMap), "", paste(", multilocusMap=c(", paste(multilocusMap, collapse=", "), ")", sep=""))
      cmdstr = paste("amAlleleFreq(", ds, argstr, ")", sep="")
      expect_snapshot(cat(cmdstr))
    }

    # Capture any errors reported by allelematch:
    sink(nullfile()) # Block output from 'cat' within allelematch
    af <- tryCatch( 
      
      # Make the call to allelematch:  
      amAlleleFreq(amDatasetFocal=get(ds), multilocusMap=multilocusMap),
      
      ## If the call fails, return the error message and
      ## the method and arguments that threw the error:
      error = function(e) {
        ret = c(paste("\n  Error    : ", e$message, "\n  Rejected : ", cmdstr, "\n"))
        message("\n  ", ret, sep="") # Print the message to the screen for easier debugging
        ret # Return this message from 'tryCatch'
      }
      #, message = function(m) {}
    )
    sink() # Block output from 'cat' within allelematch
    
    # Log the result to the snapshot file:
    # expect_snapshot(summary.amAlleleFreq(af)) # Too big. :-(
    expect_snapshot_value(af, style = "deparse")
    
    if(class(af) == "amAlleleFreq") { 
      expect_snapshot(print.amAlleleFreq(af)) 
    } else {
      expect_snapshot(cat(af))
    }

    return(af)
  }
  
  # Parameters to loop over:
  #   " amAlleleFreq <- function(amDatasetFocal, , multilocusMap=NULL) {
  # Regarding clusterMethod: "Only 'complete' acceptable. This option remains for experimental reasons". So, we stick with the default.
  
  # Here comes the loops:
  af0 = snapshot_amAlleleFreq("amdataMini")
  af1 = snapshot_amAlleleFreq("amdataMini", multilocusMap=c(1,1,2,2))
  expect_identical(af1, af0)

  for (amds in c("amdataExample1", "amdataExample2", "amdataExample3", "amdataExample4", "amdataExample5")) {
    af0 = snapshot_amAlleleFreq(amds)
  }
})
