
test_that("Loop the Loop - amExample5", {

  amExample5 <- ro$amExample5[1:20, ] # Keep first 20 rows to save time and disk
  amdataExample5 <- amDataset(amExample5, indexColumn = "sampleId", ignoreColumn = c("samplingData", "gender"))

  sink(nullfile())
  for (rus  in amCluster_rus)
  for (ch   in amCluster_ch)
  for (mis  in amCluster_mis)
  for (cons in amCluster_cons) {
    snapshot_amCluster("amdataExample5",
                       runUntilSingletons = rus, cutHeight = ch,
                       missingMethod = mis,      consensusMethod = cons)
  }
})
