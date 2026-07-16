
test_that("Print", {

  # Exercise the three ways to print the output from 'amPairwise()' with
  # input data from different amDatasets:

  # Set up the different amDataSets:
  miniExample = data.frame(
    "LOC1a"         = c(11:14),
    "LOC1b"         = c(21:24),
    "LOC2a"         = c(31:33, -99),
    "LOC2b"         = c(41:44)
  )
  amExample5 <- ro$amExample5[1:20, ] # Just keep the first 20 rows to save speed and disk

  objMini     = amPairwise(amDataset(miniExample), alleleMismatch=0.5)
  objExample5 = amPairwise(amDataset(amExample5, indexColumn="sampleId", ignoreColumn=c("samplingData", "gender")), alleleMismatch=0.5)
  objExample5b= amPairwise(amDataset(amExample5, indexColumn="sampleId"), alleleMismatch=0.5)

  # Run each of the data sets through the tree ways to print the results:
  withr::local_options(width=200) # Allow longer lines for the summaries:
  for (obj in c("objMini", "objExample5", "objExample5b")) {

    # Write the name of the amPairwise object to the _snap file:
    expect_snapshot_output(cat("About to exercise", obj), variant=amvariant)

    # summary.amPairwise should have the same output as before
    expect_snapshot(summary.amPairwise(get(obj)), variant=amvariant)

    # amCSV.amPairwise should have the same output as before
    tmp = tempfile(paste(obj, "_", sep=""), fileext=".csv")
    expect_snapshot(amCSV.amPairwise(  get(obj), csvFile=tmp), variant=amvariant)
    expect_snapshot(format(read.csv(tmp)), variant=amvariant)
    file.remove(tmp)

    # amHTML.amPairwise should have the same output as before
    tmp = tempfile(paste(obj, "_", sep=""), fileext=".html")
    expect_snapshot(amHTML.amPairwise( get(obj), htmlFile=tmp),
                    variant=amvariant)
    snapshot_scrubHtmlFile(tmp, variant=amvariant)
  }

  # Test usingTmpFile:
  withr::local_envvar(.new=list(TMP = tempdir()), action="replace")
  sink(nullfile())
  {
    # Just test that we can get code coverage for the 'usingTmpFile' code
    # without any errors. The code that generated html from data was tested above.
    out = capture_output(
      amHTML.amPairwise( get("objMini"), htmlFile=NULL)
    )
    expect_match(out, "Opening HTML file.+? in default browser", perl=TRUE) # Ignore ever-changing 'tempdir()'
  }
  sink()

})
