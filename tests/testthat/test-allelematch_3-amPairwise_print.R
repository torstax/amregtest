
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
  data("amExample5") ; amExample5 = amExample5[c(1:20),] # Just keep the first 20 rows to save speed and disk

  objMini     = amPairwise(amDataset(miniExample), alleleMismatch=0.5)
  objExample5 = amPairwise(amDataset(amExample5, indexColumn="sampleId", ignoreColumn=c("samplingData", "gender")), alleleMismatch=0.5)
  objExample5b= amPairwise(amDataset(amExample5, indexColumn="sampleId"), alleleMismatch=0.5)

  # The print output changed with regards to spaces in 2.6.0 of allelematch:
  amvariant <- as.character(packageVersion("allelematch")[1, 1:2])

  # Run each of the data sets through the tree ways to print the results:
  withr::local_options(width=200) # Allow longer lines for the summaries:
  for (obj in c("objMini", "objExample5", "objExample5b")) {

    # Write the name of the amPairwise object to the _snap file:
    expect_snapshot(paste("About to exercise", obj), variant=amvariant)

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
    expect_snapshot(
      cat(
        sub("summary generated: </b><em>.+?</em>",
            "summary generated: </b><em>(date)</em>",
            gsub("(\\t| )+?(\\n|$)","\\2",
                 readLines(tmp, warn=FALSE),
                 perl=TRUE),
            perl=TRUE),
        sep="\n"),
      variant=amvariant
    )
    file.remove(tmp)
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
