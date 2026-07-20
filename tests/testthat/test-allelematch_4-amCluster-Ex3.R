
test_that("Loop the Loop - amExample3", {

  amExample3 <- ro$amExample3[1:20, ] # Keep first 20 rows to save time and disk
  amdataExample3 <- amDataset(amExample3, indexColumn = "sampleId", metaDataColumn = "knownIndividual")

  sink(nullfile())
  for (rus  in amCluster_rus)
  for (ch   in amCluster_ch)
  for (mis  in amCluster_mis)
  for (cons in amCluster_cons) {
    snapshot_amCluster("amdataExample3",
                       runUntilSingletons = rus, cutHeight = ch,
                       missingMethod = mis,      consensusMethod = cons)
  }
})
