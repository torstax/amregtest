
test_that("Loop the Loop - miniExample", {

  amvariant <- NULL # No changes compared to 2.5.0, so no need to separate snapshot files.

  miniExample <- data.frame(
    "LOC1a" = c(11:14),
    "LOC1b" = c(21:24),
    "LOC2a" = c(31:33, -99),
    "LOC2b" = c(41:44)
  )
  amdataMini <- amDataset(miniExample)

  sink(nullfile())
  for (rus  in amCluster_rus)
  for (ch   in amCluster_ch)
  for (mis  in amCluster_mis)
  for (cons in amCluster_cons) {
    snapshot_amCluster("amdataMini",
                       runUntilSingletons = rus, cutHeight = ch,
                       missingMethod = mis,      consensusMethod = cons)
  }
})
