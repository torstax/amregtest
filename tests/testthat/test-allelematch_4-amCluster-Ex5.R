
test_that("Loop the Loop - amExample5", {

  # TODO 2.6.0: These tests reveal severe backwards incompatibilities in 2.6.0 that
  # need to be fixed in allelematch 2.6.1:
  amvariant <- ifelse(amversion == "2.6.0", "bad-2.6.0", amvariant) # TODO 2.6.0

  data("amExample5")
  amExample5    <- amExample5[1:20, ] # Keep first 20 rows to save time and disk
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
