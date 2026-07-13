
test_that("Loop the Loop - amExample1", {

  amvariant <- NULL # No changes compared to 2.5.0, so no need to separate snapshot files.

  data("amExample1")
  amdataExample1 <- amDataset(amExample1, indexColumn = "sampleId", metaDataColumn = "knownIndividual")

  sink(nullfile())
  for (rus  in amCluster_rus)
  for (ch   in amCluster_ch)
  for (mis  in amCluster_mis)
  for (cons in amCluster_cons) {
    snapshot_amCluster("amdataExample1",
                       runUntilSingletons = rus, cutHeight = ch,
                       missingMethod = mis,      consensusMethod = cons)
  }
})
