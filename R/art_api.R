###############################################################################
### allelematch test engine ###
###############################################################################

#' Returns package version
#'
#' @description
#' Returns version of this package ([amregtest]).\cr
#' \cr
#' The version is specified in the file DESCRIPTION, tag "Version: ".
#'
#' @param verbose logical. If TRUE, prints additional info to stdout, including version of [allelematch-package]
#'
#' @return The installed version of this package ([amregtest-package]) in a character vector of length one
#'
#' @examples
#' # See what version of packages 'allelematch' and 'amregtest'
#' # are currently installed:
#' artVersion()
#'
#' # List the available tests:
#' artList()
#' \donttest{
#' # Run all the tests:
#' # artRun()  # Takes several minutes
#'
#' # Run the first of the available tests:
#' artRun(filter="allelematch_1-amDataset$")
#' }
#'
#'
#' @seealso [artList], [artRun] and [amregtest]
#' @export
artVersion <- function(verbose=TRUE) {
    stopifnot(is.logical(verbose))

    installedArtVersion = toString(utils::packageVersion("amregtest"))
    installedAmVersion  = toString(utils::packageVersion("allelematch"))

    if (verbose) {
        cat("\n    Version of package 'amregtest' is", installedArtVersion)
        cat("\n    Installed (and thus tested) version of package 'allelematch' is:", installedAmVersion)
    }
    return(invisible(installedArtVersion))
}


#' Lists available tests in `amregtest` without running them
#'
#' @description
#' Use the output to select a value for parameter `filter` to [artRun].
#' Useful when debugging.
#'
#' @param verbose logical. If TRUE, prints additional info to stdout
#'
#' @return A character vector containing the names of all the tests
#'
#' @examples
#' # See what version of packages 'allelematch' and 'amregtest'
#' # are currently installed:
#' artVersion()
#'
#' # List the available tests:
#' artList()
#' \donttest{
#' # Run all the tests:
#' # artRun()  # Takes several minutes
#'
#' # Run the first of the available tests:
#' artRun(filter="allelematch_1-amDataset$")
#' }
#'
#' @seealso [artVersion] and [artRun]
#'
#' @export
artList <- function(verbose=TRUE) {
    stopifnot(is.logical(verbose))

    root = paste(system.file(package = "amregtest"), "tests/testthat/", sep="/")

    all = gsub("^test-(.+?)\\.R", "\\1", grep("^test-.+?\\.R", list.files(root), value=TRUE), perl=TRUE)

    if (verbose) {
        cat('\nTests in files under "', root, '":\n', sep="")

        cat("\nTests by functions in allelematch:\n")
        print(grep("^allelematch", all, value=TRUE, perl=TRUE), width=50)

        cat("\nReproduction of the examples in 'allelematchSuppDoc.pdf':\n")
        print(grep("^amExample", all, value=TRUE, perl=TRUE))

        cat("\nOther:\n")
        print(grep("^allelematch|^amExample", all, value=TRUE, invert=TRUE, perl=TRUE))
        cat("\n")
    }

    return(invisible(all))
}


#' Runs the regression test
#'
#' @description
#' Runs [allelematch] regression tests to make sure it is backwards compatible.\cr
#' \cr
#' The full set of tests will take a couple of minutes. \cr
#' \cr
#' Call [artList] to see the available tests with without running them.
#'
#' @return A list (invisibly) containing data about the test results as returned by [testthat::test_package]
#'
#' @details
#' If any of the test executed with [artRun] should fail, then we want to be able
#' to run that specific test under the debugger. Character vector of length one.\cr
#' \cr
#' Set a breakpoint in `allelematch.R` and call `artRun(filter="<the test that reproduces the problem>")`\cr
#' \cr
#' Note that it is the last installed version of `allelematch` that will be executed,
#' not the last edited. In RStudio, CTRL+SHIFT+B will build and install.
#'
#'
#' @param filter    If specified, only tests with names matching this perl regular
#'                  expression will be executed. Character vector of length 1. See also [artList]
#' @param verbose   logical. If TRUE, prints version of tested allelematch to stdout
#'
#' @examples
#' # See what version of packages 'allelematch' and 'amregtest'
#' # are currently installed:
#' artVersion()
#'
#' # List the available tests:
#' artList()
#' \donttest{
#' # Run all the tests:
#' # artRun()  # Takes several minutes
#'
#' # Run the first of the available tests:
#' artRun(filter="allelematch_1-amDataset$")
#' }
#'
#' @seealso [artVersion] and [artList]
#'
#' @export
artRun <- function(filter="", verbose=TRUE) {
    stopifnot(is.character(filter) && length(filter)==1)
    stopifnot(is.logical(verbose))

    installedVersion = toString(utils::packageVersion("allelematch"))
    if (verbose) cat("    About to test installed version of allelematch:  <<<", installedVersion, ">>>\n", sep="")
    reporter <- ifelse(verbose, "Progress", testthat::check_reporter())
    result = list()
    if (filter != "^$") result = testthat::test_package("amregtest", reporter=reporter , filter=filter) # We can't start tests recursively, even for coverage tests
    if (verbose) cat("    Done testing installed version of allelematch:  <<<", installedVersion, ">>>\n", sep="")
    return(invisible(result))
}

