
test_that("We are running the 3rd edition of testthat", code = {
  # If this tests fails, then call
  #   usethis::use_testthat(3)
  # to configure DESCRIPTION to use 3rd edition of 'testthat'.
  testthat::expect_gte(!!testthat::edition_get(), 3)
})

test_that("amExamples have not changed in allelematch", {

    # Calculate a checksum for data stored under ./data/ in a package:
    md5sum <- function(name, package) {
        stopifnot(is.character(name) && is.character(package))
        utils::data(list = c(name), package=package)[1]
        cs = digest::digest(get(name))
        return(cs)
    }

    expect_identical(md5sum("amExample1", package="allelematch"), '25108ea88af5cc916ed887c82eb89840')
    expect_identical(md5sum("amExample2", package="allelematch"), 'a438a316c63bbc024c3fe0eb564c4edb')
    expect_identical(md5sum("amExample3", package="allelematch"), '242ef242fc6afd413d13f7f7739823af')
    expect_identical(md5sum("amExample4", package="allelematch"), 'd7a34f4319c15e8042fe01cdfed18bc3')
    expect_identical(md5sum("amExample5", package="allelematch"), 'cce57ddcaaa4ae31902b6036a0a90f8e')

    expect_identical(dim(amExample1), c( 20L, 22L))
    expect_identical(dim(amExample2), c(148L, 22L))
    expect_identical(dim(amExample3), c(319L, 22L))
    expect_identical(dim(amExample4), c(307L, 22L))
    expect_identical(dim(amExample5), c(335L, 23L))
})

test_that("See how an object of class amDataset is built:", {

  # Miniature input sample:
  miniExample = data.frame(
    sampleId        = c(1:4),
    knownIndividual = c("A","A","B","  C"),
    "dismiss "      = c("Rain", " drops", " keep", " fallin' on my head "),
    "LOC1a"         = c(11:14),
    "LOC1b"         = c(21:24),
    "LOC2a"         = c(31:33, -88),
    "LOC2b"         = c(41:44)
  )
  {
    example = miniExample
    expect_identical(!!dim(example), c(4L,7L)) # Four rows, 7 columns
    # Column names:
    # Note that space (" ") has been changed to period (".") after dismiss:
    expect_identical(!!names(example),     c("sampleId","knownIndividual","dismiss.","LOC1a","LOC1b","LOC2a","LOC2b"))
    expect_identical(!!names(example[1,]), c("sampleId","knownIndividual","dismiss.","LOC1a","LOC1b","LOC2a","LOC2b"))
    # Column content (sampleId):
    expect_identical(!!example$sampleId, c(1L, 2L, 3L, 4L))
    expect_identical(!!example[, 1],     c(1L, 2L, 3L, 4L))
    # Row content:
    expect_identical(!!as.vector(as.character(example[1, ])), c(1,"A","Rain","11","21","31","41"))
    expect_identical(!!as.vector(example[1, ]),
                     list(sampleId = 1L, knownIndividual = "A", "dismiss." = "Rain",
                          LOC1a = 11L, LOC1b = 21L, LOC2a = 31, LOC2b = 41L))
    expect_identical(!!example[1, ],
                     as.data.frame(list(sampleId = 1L, knownIndividual = "A", "dismiss." = "Rain",
                          LOC1a = 11L, LOC1b = 21L, LOC2a = 31, LOC2b = 41L)))

    expect_snapshot(print(miniExample))
  }

  # Make amDataset with all optional parameters defaulted:
  expect_snapshot(miniDataset1 <- amDataset(miniExample))
  expect_snapshot(print.amDataset(miniDataset1))
  {
    amDataset = miniDataset1
    expect_identical(!!class(amDataset), "amDataset")
    expect_identical(!!names(amDataset), c("index", "multilocus", "missingCode"))
    expect_identical(!!dim(amDataset$multilocus), c(4L,7L)) # Same as miniExample
    expect_identical(!!is.matrix(amDataset$multilocus), TRUE)

    # Column names stay the same:
    expect_identical(!!names(amDataset[["multilocus"]][1, ]), c("sampleId","knownIndividual","dismiss.", # NB: "knownIndividual" and "dismiss" columns still left
                                                            "LOC1a","LOC1b","LOC2a","LOC2b"))

    # Column contents:
    # Note that the spaces have been stripped for columns expected to be multilocus data:
    expect_identical(!!amDataset[["multilocus"]][, "dismiss."], c("Rain","drops","keep","fallin'onmyhead")) # NB: spaces stripped

    # Data columns are converted from integer to character:
    expect_identical(!!amDataset[["multilocus"]][, "LOC1a"],    c("11", "12", "13", "14"))

    # Defaulted data:
    expect_identical(!!amDataset$index, c("AAA","AAB","AAC", "AAD")) # Auto-generated individual IDs
    expect_identical(!!amDataset$metaData, NULL)
    expect_identical(!!amDataset$missingCode, "-99")
    expect_identical(!!amDataset$metadataColumn, NULL)

    expect_snapshot_value(amDataset, style = "json2") # Stored under ./tests/testthat/_snaps/allelematch.md
  }

  # Make amDataset with all optional parameters set:
  expect_snapshot(miniDataset2 <- amDataset(miniExample, missingCode="-88", indexColumn="sampleId", metaDataColumn="knownIndividual", ignoreColumn="dismiss."))
  expect_snapshot(print.amDataset(miniDataset2))
  {
    amDataset = miniDataset2
    expect_identical(!!class(amDataset), "amDataset")
    expect_identical(!!names(amDataset), c("index", "metaData", "multilocus", "missingCode"))
    expect_identical(!!dim(amDataset$multilocus), c(4L,4L)) # Three columns from miniExample dropped

    # Check that "knownIndividual" and "dismiss" columns have been dropped:
    expect_identical(!!is.matrix(amDataset$multilocus),       TRUE)
    expect_identical(!!rownames(amDataset$multilocus),        NULL)
    expect_identical(!!colnames(amDataset$multilocus),        c("LOC1a","LOC1b","LOC2a","LOC2b"))
    expect_identical(!!names(amDataset[["multilocus"]][1, ]), c("LOC1a","LOC1b","LOC2a","LOC2b"))
    expect_identical(!!amDataset[["multilocus"]][, "LOC2b"],  c("41", "42", "43", "44")) # NB: Integers converted to character
    expect_identical(!!amDataset$multilocus[, "LOC2b"],       c("41", "42", "43", "44")) # NB: Integers converted to character
    expect_identical(!!amDataset$index, c("1","2","3","4")) # NB: Integers converted to character
    expect_identical(!!amDataset$metaData, c("A","A","B","  C")) # Spaces not stripped from metadata
    expect_identical(!!amDataset$missingCode, "-88")

    expect_snapshot_value(amDataset, style = "json2")
  }

  # Make amDataset with all column parameters set as integers rather than characters:
  expect_snapshot(miniDataset3 <- amDataset(miniExample, missingCode="-88", indexColumn=1, metaDataColumn=2, ignoreColumn=3))
  expect_snapshot(print.amDataset(miniDataset2))
  {
    # TODO : Catch none-character values for missingCode!!
    amDataset = miniDataset3
    expect_identical(amDataset, miniDataset2)

    expect_snapshot_value(amDataset, style = "json2")
  }
})


test_that("Different data types for arg to 'missingCode' give same result", {

  # Create valid miniature input sample that contains both NA and "NA":
  sample = miniExample = data.frame(
    "LOC1a"         = c(11:14),
    "LOC1b"         = c(21:23, NA),             # NA integer
    "LOC2a"         = c("31", "32", "33",  NA), # NA character
    "LOC2b"         = c("41", "42", "43", "NA") # string constant "NA"
  )

  # Make sure we still keep the difference between NA and "NA",
  # even though it isn't visible with 'print()':
  {
    expect_true( is.na(sample$LOC1b[4])) # NA integer
    expect_true( is.na(sample$LOC2a[4])) # NA character
    expect_false(is.na(sample$LOC2b[4])) # String constant "NA"
    expect_identical(sum(is.na(sample)), 2L)

    expect_type( sample$LOC1b[4], "integer")
    expect_type( sample$LOC2a[4], "character")
    expect_type( sample$LOC2b[4], "character")

    expect_identical(sample$LOC2b[4], c("NA"))
  }

  # Make sure that both missingCode and data are stored as character:
  expect_snapshot(ds1 <- amDataset(sample, missingCode = "NA"))
  {
    ds = ds1
    expect_identical(ds$missingCode, "NA")
    expect_type(ds$multilocus, "character")
    expect_identical(sum(unlist(ds$multilocus) == "NA"), 3L) # All 3 NA values now as strings
    expect_snapshot_value(ds, style = "deparse") # style "json2" de-serializes "NA" to NA
  }

  # Make sure arg missingCode = NA is converted to $missingCode="NA"
  expect_snapshot(ds2 <- amDataset(sample, missingCode = NA))
  {
    ds = ds2
    expect_snapshot_value(ds, style = "deparse")  # style "json2" de-serializes "NA" to NA
    expect_identical(ds$missingCode, "NA")
    expect_type(ds$multilocus, "character")
    expect_identical(sum(is.na(ds$multilocus)), 0L)
    expect_identical(sum(unlist(ds$multilocus) == "NA"), 3L) # All 3 NA values now as strings
    expect_identical(sum(is.na(ds)), 0L) # Not sure what this does, exactly
  }

  expect_identical(ds1, ds2)
})

