
test_that("Print", {

  # Exercise the three ways to print the output from 'amCluster()' with
  # input data from different amDatasets:

  # Set up the different amDataSets:
  miniExample = data.frame(
    "LOC1a"         = c(11:14),
    "LOC1b"         = c(21:24),
    "LOC2a"         = c(31:33, -99),
    "LOC2b"         = c(41:44)
  )
  data("amExample5") ; amExample5 = amExample5[c(1:20),] # Just keep the first 20 rows to save speed and disk

  objMini     = amCluster(amDataset(miniExample))
  objExample5 = amCluster(amDataset(amExample5, indexColumn="sampleId", ignoreColumn=c("samplingData", "gender")))
  objExample5b= amCluster(amDataset(amExample5, indexColumn="sampleId"))


  # Run each of the data sets through the tree ways to print the results:
  withr::local_options(width=200) # Allow longer lines for the summaries:
  for (obj in c("objMini", "objExample5", "objExample5b")) {

    # Write the name of the obj to the _snap file:
    expect_snapshot(paste("About to exercise", obj))

    # summary.amCluster should have the same output as before
    expect_snapshot(summary.amCluster(get(obj)))

    # amCSV.amCluster should have the same output as before
    tmp = tempfile(paste(obj, "_", sep=""), fileext=".csv")
    expect_snapshot(amCSV.amCluster(  get(obj), csvFile=tmp))
    expect_snapshot(format(read.csv(tmp)))
    file.remove(tmp)

    # amHTML.amCluster should have the same output as before
    tmp = tempfile(paste(obj, "_", sep=""), fileext=".html")
    expect_snapshot(amHTML.amCluster( get(obj), htmlFile=tmp))
    expect_snapshot(
      cat(
        sub("summary generated: </b><em>.+?</em>",
            "summary generated: </b><em>(date)</em>",
            gsub("(\\t| )+?(\\n|$)","\\2",
                 readLines(tmp, warn=FALSE),
                 perl=TRUE),
            perl=TRUE),
        sep="\n")
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
      amHTML.amCluster( get("objMini"), htmlFile=NULL)
    )
    expect_match(out, "Opening HTML file.+? in default browser", perl=TRUE) # Ignore ever-changing 'tempdir()'
  }
  sink()

})
