
# Helper function that prints a remark into the snapshot file:
snapshot_rem <- function(remark, ..., variant = amvariant) {
  expect_snapshot_output(cat("\n!\n! ", remark, ..., "\n!\n"), variant=variant)
}

# test_that("Installed allelematch also loaded", code = {
#   # This test covers for the use case when allelematch is repeatedly
#   # re-built and re-installed, with the same version, in one RStudio session (AM),
#   # but tested in another RStudio session (ART).
#   #
#   # The installed version on disk is then newer than the the version loaded in RAM
#   # in the ART session until it has been explicitly re-loaded in that session.
#   #
#   # This is of cource easy to forget, and then miss when testing.
#   #
#   # So, here we check against the loaded version in RAM being older than the
#   # installed version on disk.
#   #
#   pkg = "allelematch"
#   stopifnot("allelematch" %in% loadedNamespaces(),
#             "Package 'allelematch' is not loaded in RAM. Please load it (with library()) before running the tests",
#             call. = FALSE)
#
#   # Find the physical installation path of the package on disk
#   pkg_path <- find.package("allelematch", quiet = TRUE)
#   if(length(pkg_path) == 0)
#     stop("Package 'allelematch' is not installed on disk. Please install it before running the tests",
#          call. = FALSE)
#
#   # Target the core package database binary (updated on every single install)
#   rdb_file <- file.path(pkg_path, "R", paste0("allelematch", ".rdb"))
#   if (!file.exists(rdb_file))
#     stop("Package 'allelematch' is not in package database. Please install it before running the tests",
#                                        call. = FALSE)
#
#   # Get the time the file was last written to the disk
#   disk_modified_time <- file.info(rdb_file)$mtime
#
#   # Get the time this specific namespace was loaded into your session's RAM
#   ram_loaded_time <- attr(asNamespace("allelematch"), "metadata")$stamp
#
#   # If no stamp attribute exists, fallback to comparing against session start time
#   if (is.null(ram_loaded_time)) {
#     # If the file on disk is newer than when the active R session booted up
#     stopif(disk_modified_time > (Sys.time() - proc.time()["elapsed"]))
#   }
#
#   # Return TRUE if the disk copy has been modified since it was loaded into RAM
#   stopif(disk_modified_time > ram_loaded_time)
# })


test_that("3rd edition of testthat", code = {
  # If this tests fails, then call
  #   usethis::use_testthat(3)
  # to configure DESCRIPTION to use 3rd edition of 'testthat'.
  testthat::expect_gte(!!testthat::edition_get(), 3)
})

test_that("md5sum:s of allelematch::amExamples", {

    # Calculate a checksum for data stored under ./data/ in a package:
    env <- environment() # Use a local environment to avoid polluting the global environment with data sets
    md5sum <- function(name, package) {
        stopifnot(is.character(name) && is.character(package))
        utils::data(list = c(name), package=package, envir = env)[1]
        cs = digest::digest(get(name, envir = env))
        return(cs)
    }

    snapshot_rem("Verify the md5 checksums of the allelematch::amExampleX data files:")
    # 2.6.0 of allelematch introduced some cosmetic changes,
    # including changing the column name "gender" to "sex" in amExample5.
    # This changed the md5sum for that data set, so we need to check the version
    # of allelematch to know which md5sum to expect.
    #
    amversion <- packageVersion("allelematch")

    expect_identical(md5sum("amExample1", package="allelematch"), '25108ea88af5cc916ed887c82eb89840')
    expect_identical(md5sum("amExample2", package="allelematch"), 'a438a316c63bbc024c3fe0eb564c4edb')
    expect_identical(md5sum("amExample3", package="allelematch"), '242ef242fc6afd413d13f7f7739823af')
    expect_identical(md5sum("amExample4", package="allelematch"), 'd7a34f4319c15e8042fe01cdfed18bc3')
    if(amversion < "2.6.0") { # Versions 2.5.5 and earlier had a different md5sum for amExample5
      expect_identical(md5sum("amExample5", package="allelematch"), 'cce57ddcaaa4ae31902b6036a0a90f8e')
    } else {
      # Only difference is the change in one column name from "gender" to "sex":
      expect_identical(md5sum("amExample5", package="allelematch"), '5f481f6287de5d5cc05277b645ba0642')
    }

    # Load the 2.5.5 version for use in our tests where we assume "gender":
    data("amExample5", package="amregtest", envir = env) # Load the 2.5.5 version from amregtest

    expect_identical(dim(amExample1), c( 20L, 22L))
    expect_identical(dim(amExample2), c(148L, 22L))
    expect_identical(dim(amExample3), c(319L, 22L))
    expect_identical(dim(amExample4), c(307L, 22L))
    expect_identical(dim(amExample5), c(335L, 23L))
})

