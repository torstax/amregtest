
test_that("Loop the Loop", {

  # TODO 2.6.0: These tests reveal severe backwards incompatibilities in 2.6.0 that
  # need to be fixed in allelematch 2.6.1:
  amvariant <- ifelse(amversion == "2.6.0", "bad-2.6.0", amvariant) # TODO 2.6.0

  # We want to run amCluster many times with many combinations of parameters
  # and we want to compare the results with previous runs. Like this:
  sink(nullfile()) # Block output from 'cat' within allelematch

  snapshot_amCluster <- function(ds, ...) {

    # Log the call to the snapshot file:
    argstr = helpArgToString(...)
    cmdstr = paste("amCluster(", ds, ", ", argstr, ")", sep="") ; expect_snapshot(cat(cmdstr), variant = amvariant)

    sink(nullfile()) # Block output from 'cat' within allelematch
    # Capture any errors reported by allelematch:
    pw <- tryCatch(

      # Make the call to allelematch:
      amCluster(amDatasetFocal=get(ds), ...),

      ## If the call fails, return the error message and
      ## the method and arguments that threw the error:
      error = function(e) {
        e_message <- e$message
        if (amversion < "2.6.0") {
          # Adapt error messages from older versions of allelematch to the new format.
          # This is needed for the snapshot tests to pass.
#         e_message <- trimws(gsub("[ \t]+", " ", e_message)) # Work around space changes with never versions
          e_message <- gsub(":  ", # Newer versions changed "allelematch:  " to "allelematch: "
                            ": ",
                            e_message, fixed = TRUE) # Typically "allelematch:  "
          e_message <- gsub("no clusters formed. Please set cutHeight lower and run again.",
                            "no clusters formed.",
                            e_message, fixed = TRUE)
        }
        ret = c(paste("\n  Error    : ", e_message,
                      "\n  Test     : ", "test-allelematch_4-amCluster",
                      "\n  Rejected : ", cmdstr, "\n"))

        # Differ between expected and unexpected errors:
        if (!grepl("no clusters formed.", e_message)) {
          # Some unexpected error happened. Print it to the screen for easier debugging.
          message("\n  ", ret, sep="")
        }

        ret # Return this message from 'tryCatch'
      }
    )
    sink() # Block output from 'cat' within allelematch

    # In 2.6.0, allelematch stopped printing the below message from function amUnique
    # and function amUniqueProfile unless the verbose argument is set to TRUE.
    # This is a cosmetic change, but it breaks the snapshot tests.
    # We now remove it from the output to make the snapshot tests pass with both old and new versions of allelematch.
#   pw <- grep("assuming genotype columns are in pairs, representing", pw, value = TRUE, invert = TRUE)

    # Log the result to the snapshot file:
    # expect_snapshot(summary.amCluster(pw)) # Too big. :-(
    expect_snapshot_value(pw, style = "deparse", variant = amvariant)

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

