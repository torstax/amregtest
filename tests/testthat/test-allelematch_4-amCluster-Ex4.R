
test_that("Loop the Loop - amExample4", {

  amExample4 <- ro$amExample4[1:20, ] # Keep first 20 rows to save time and disk
  amdataExample4 <- amDataset(amExample4, indexColumn = "sampleId", metaDataColumn = "knownIndividual")

  sink(nullfile())
  for (rus  in amCluster_rus)
  for (ch   in amCluster_ch)
  for (mis  in amCluster_mis)
  for (cons in amCluster_cons) {
    snapshot_amCluster("amdataExample4",
                       runUntilSingletons = rus, cutHeight = ch,
                       missingMethod = mis,      consensusMethod = cons)
  }
})
