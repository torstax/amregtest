
test_that("Loop the Loop - amExample1", {

# amvariant <- NULL # No changes compared to 2.5.5, until 3.0.0

  amExample1 <- ro$amExample1
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
