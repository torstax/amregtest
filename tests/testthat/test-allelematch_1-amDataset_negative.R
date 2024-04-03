
test_that("Validation of arguments to amDataset() is working", {
  
  data(amExample1)
  expect_equal(!!dim(amExample1), c(20,22))

  # Test checks against invalid first param to amDataSet(multilocusDataset):
  expect_error(amDataset(NULL), "allelematch:  multilocusDataset must be a matrix or a data.frame")
  expect_error(amDataset("I'm a matrix, prommise!'"), "allelematch:  multilocusDataset must be a matrix or a data.frame")
  expect_error(amDataset(c("I'm", "a", "matrix", "prommise!")), "allelematch:  multilocusDataset must be a matrix or a data.frame")

  
  # Miniature input sample:    
  sample = miniExample = data.frame(
    sampleId        = c(1:4),
    knownIndividual = c("A","A","B","  B"),
    dismiss         = c("Rain", " drops", " keep", " fallin'"),
    "LOC1a"         = c(11:14),
    "LOC1b"         = c(21:24),
    "LOC2a"         = c(31:33, -88),
    "LOC2b"         = c(41:44)
  )

  expect_error(amDataset(sample, .mumboJumbo="-88"), "unused argument")  
  expect_error(amDataset(sample, mumboJumbo="-88"), "unused argument")  
  expect_error(amDataset(sample, indexColumn    = "None-existing column"), "indexColumn does not exist in multilocusDataset")
  expect_error(amDataset(sample, metaDataColumn = "None-existing column"), "metaDataColumn does not exist in multilocusDataset")
  expect_error(amDataset(sample, ignoreColumn   = "None-existing column"), "one or more ignoreColumn does not exist in multilocusDataset")
  expect_error(amDataset(sample, indexColumn = "knownIndividual"), "index column should contain a unique identifier for each sample")

  # See also currently failing tests in tdd-allelematch_1-amDataset_negative.R  
})

#' summary.amCluster() 
#'   857-885 : object$cluster
#'   
#' amUnique
#'   1099 -- 1101 : if (length(thisLocus)==1) => Gender?
#'   
#' amUniqueProfile
#'   1237 -- 1269 : Different calc of matchThreshold, cutHeight, alleleMismatch, profileType.
#'   1351 -- 1361 : Verbose
#'   
#' amHTML.* : usingTmpFile
#' 
#' amHTML.amPairwise
#'  metadata!
#'  
#' amHTML.amCluster
#'  metadata!
#'  1853 -- 1945 ## Clustered genotypes
