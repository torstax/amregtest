
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
  #   - Make amUniqueProfile return a class.
  #   - Bug on line 1253: Change "if(length(cutHeight <= 2))" to "if(length(cutHeight) <= 2)"
  #   - Bug on line 1264: Change "if(length(matchThreshold <= 2))" to "if(length(matchThreshold) <= 2)"
  #   - ?amUniqueProfile can be misunderstood to say that one of alleleMismatch, cutHeight and matchThreashold must be present.


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
  data("amExample2") #; amExample2 = amExample2[c(1:20),] # Just keep the first 20 rows to save speed and disk
  data("amExample3") #; amExample3 = amExample3[c(1:20),] # Just keep the first 20 rows to save speed and disk
  data("amExample4") #; amExample4 = amExample4[c(1:20),] # Just keep the first 20 rows to save speed and disk
  data("amExample5") #; amExample5 = amExample5[c(1:20),] # Just keep the first 20 rows to save speed and disk

  amdataMini     = amDataset(miniExample)
  amdataExample1 = amDataset(amExample1, indexColumn="sampleId", metaDataColumn="knownIndividual")
  amdataExample2 = amDataset(amExample2, indexColumn="sampleId", metaDataColumn="knownIndividual")
  amdataExample3 = amDataset(amExample3, indexColumn="sampleId", metaDataColumn="knownIndividual")
  amdataExample4 = amDataset(amExample4, indexColumn="sampleId", metaDataColumn="knownIndividual")
  amdataExample5 = amDataset(amExample5, indexColumn="sampleId", ignoreColumn=c("samplingData", "gender"))


  # We want to run amUniqueProfile many times with many combinations of parameters,
  # and we want to compare the results with previous runs. Like this:
  snapshot_amUniqueProfile <- function(ds, ...) {

    # Log the call to the snapshot file:
    argstr = helpArgToString(...)
    cmdstr = paste("amUniqueProfile(", ds, ", ", argstr, ")", sep="") ; expect_snapshot(cat(cmdstr))

    # Capture any errors reported by allelematch, but drop the output to stdout:
    ret <- tryCatch(

      # Make the call to allelematch:
      capture.output(amUniqueProfile(get(ds), ...)),

      ## If the call fails, return the error message and
      ## describe the method and arguments that threw the error:
      error = function(e) {
        ret = c(paste("\n  Error    : ", e$message, "\n  Rejected : ", cmdstr, "\n"))

        # Differ between expected and unexpected errors:
        if (!grepl("no clusters formed.  Please set cutHeight lower and run again", e$message, perl=TRUE)) {
          # Some unexpected error happened. Print it to the screen for easier debugging.
          message("\n  ", ret, "\n  error class = ", format(class(e)), sep="")

        }

        ret
      }
    )
    ret = paste(ret, collapse = "\n")

    # Log the result to the snapshot file:
    expect_snapshot(cat(ret))

    return(ret)
  }

  # Parameters to amUniqueProfile:
  #  amUniqueProfile <- function(
  #     amDatasetFocal, multilocusMap=NULL, alleleMismatch=NULL, matchThreshold=NULL, cutHeight=NULL,
  #     guessOptimum=TRUE, doPlot=TRUE, consensusMethod=1, verbose=TRUE)
  #
  # We simplify by dropping
  #  - multilocusMap (default is good)
  #  - alleleMismatch (Automatically cykled from [1:(number_of_loci-1)])
  #  - matchThreashold and cutHeight (calculated from alleleMismatch)
  #  - guessOptimum (Keep default=TRUE. Exercises more code)
  #  - doPlot (Keep default=TRUE. Exercises more code)
  #  - consensusMethod (Keep default=1. Assume tested for amCluster)
  #  - verbose (the default, TRUE, just generates noice)
  #
  # Parameters left to loop over:
  #  amUniqueProfile <- function(amDatasetFocal)
  #
  # Here comes the loops:
  withr::local_options(width=200) # Allow longer lines for the summaries:
  for (amds in c("amdataMini", "amdataExample1", "amdataExample2", "amdataExample3", "amdataExample4", "amdataExample5")) {
    snapshot_amUniqueProfile(amds, doPlot=FALSE, verbose=FALSE)
  }

  # One more test to doPlot. Notice that this test will fail spectacularly if the RStudio "Plots" window is too small:
  amdataExample5b = amDataset(amExample5, indexColumn="sampleId", metaDataColumn="samplingData")
  mlMap = c(1, rep(2:11, each=2))
  obj <- amUniqueProfile(
      amdataExample5b,
      multilocusMap=c(1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11), # "gender" only has one allele in it's locus
      doPlot=TRUE, verbose=FALSE)
  expect_snapshot(print(obj))

})
