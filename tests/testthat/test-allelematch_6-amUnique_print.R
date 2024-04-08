
test_that("Print", {

  # Exercise the three ways to print the output from 'amUnique()' with
  # input data from different amDatasets:

  # Set up the different amDataSets:
  miniExample = data.frame(
    "LOC1a"         = c(11:14),
    "LOC1b"         = c(21:24),
    "LOC2a"         = c(31:33, -99),
    "LOC2b"         = c(41:44)
  )
  data("amExample5") ; amExample5 = amExample5[c(1:20),] # Just keep the first 20 rows to save speed and disk

  sink(nullfile()) # Drop cat output to stdout
  objMini     = amUnique(amDataset(miniExample), matchThreshold=0.5)
  objExample5 = amUnique(amDataset(amExample5, indexColumn="sampleId", ignoreColumn=c("samplingData", "gender")), matchThreshold=0.7)
  objExample5b= amUnique(amDataset(amExample5, indexColumn="sampleId"), matchThreshold=0.7)
  objExample5c= amUnique(amDataset(amExample5, indexColumn="sampleId", metaDataColumn="samplingData"),
                         multilocusMap=c(1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11), # "gender" only has one allele in it's locus
                         matchThreshold=0.7)
  sink()

  # Run each of the data sets through the tree ways to print the results:
  withr::local_options(width=200) # Allow longer lines for the summaries:
  for (obj in c("objMini", "objExample5", "objExample5b", "objExample5c")) {

    # Write the name of the amUnique object to the _snap file:
    expect_snapshot(paste("About to exercise", obj))

    # allelematch:  Console summary is not available for "amUnique" objects.
    # Please use summary.amUnique(x, html=TRUE) or summary.amUnique(x, csv="file.csv") options.
    # expect_snapshot(summary.amUnique(get(obj)))

    # amCSV.amUnique should have the same output as before
    tmp = tempfile(paste(obj, "_", sep=""), fileext=".csv")
    expect_snapshot(summary.amUnique(  get(obj), csv=tmp))
    expect_snapshot(format(read.csv(tmp)))
    file.remove(tmp)

    # amHTML.amUnique should have the same output as before
    tmp = tempfile(paste(obj, "_", sep=""), fileext=".html")
    expect_snapshot(summary.amUnique( get(obj), html=tmp))
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
  {
    # Just test that we can get code coverage for the 'usingTmpFile' code
    # without any errors. The code that generated html from data was tested above.
    out = capture_output(
      amHTML.amUnique( get("objMini"), htmlFile=NULL)
    )
    expect_match(out, "Opening HTML file.+? in default browser", perl=TRUE) # Ignore ever-changing 'tempdir()'
  }

})
