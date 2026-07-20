
test_that("Loop the Loop - amExample2", {

  amExample2 <- ro$amExample2[1:20, ] # Keep first 20 rows to save time and disk
  amdataExample2 <- amDataset(amExample2, indexColumn = "sampleId", metaDataColumn = "knownIndividual")

  sink(nullfile())
  for (rus  in amCluster_rus)
  for (ch   in amCluster_ch)
  for (mis  in amCluster_mis)
  for (cons in amCluster_cons) {
    snapshot_amCluster("amdataExample2",
                       runUntilSingletons = rus, cutHeight = ch,
                       missingMethod = mis,      consensusMethod = cons)
  }
})
