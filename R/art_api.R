###############################################################################
### allelematch test engine ###
###############################################################################

#' Prints package version
#'
#' @description
#' Prints version of this package ([amregtest]) and of tested version of [allelematch].\cr
#' \cr
#' The version is specified in the file DESCRIPTION, tag "Version: ".
#'
#' @examples
#' # See what version of packages 'allelematch' and 'amregtest'
#' # are currently installed:
#' artVersion()
#'
#' # List the available tests:
#' artList()
#'
#' \dontrun{
#'
#' # Run all the tests:
#' artRun()
#'
#' # Run the first of the available tests:
#' artRun(filter="allelematch_1-amDataset")
#'
#' # Run all tests that start with 'am' and 'allelematch_1-amDataset':
#' artRun(filter="^am|allelematch_1-amDataset")
#'
#' # Run the test 'amExample3' and let it generate .html files
#' # in the [getwd] directory:
#' artRun(filter='amExample3', html=TRUE)
#' }
#'
#'
#' @seealso [artList], [artRun] and [amregtest]
#' @export
artVersion <- function() {
    artVersionInner()
    cat("\n")
    cat("\n    This version of 'amregtest' was used to test 'allelematch' versions 2.5.3 and 2.5.2.")
    cat("\n    2.5.1 and earlier versions of 'allelematch' require older versions of R to work.")
    cat("\n\n")
}
artVersionInner <- function() {
    installedArtVersion = toString(utils::packageVersion("amregtest"))
    installedAmVersion  = toString(utils::packageVersion("allelematch"))

    cat("\n    Version of package 'amregtest' is", installedArtVersion)
    cat("\n    Installed (and thus tested) version of package 'allelematch' is:", installedAmVersion)
}


#' Lists available tests in `amregtest` without running them
#'
#' @description
#' Use the output to select a value for parameter `filter` to [artRun].
#' Useful when debugging.
#'
#' @examples
#' # See what version of packages 'allelematch' and 'amregtest'
#' # are currently installed:
#' artVersion()
#'
#' # List the available tests:
#' artList()
#'
#' \dontrun{
#'
#' # Run the first of the available tests:
#' artRun(filter="allelematch_1-amDataset")
#'
#' # Run all tests that start with 'am' and 'allelematch_1-amDataset':
#' artRun(filter="^am|allelematch_1-amDataset")
#' }
#'
#' @returns A vector containing all the tests names
#'
#' @seealso [artVersion] and [artRun]
#'
#' @export
artList <- function() {
    root = paste(system.file(package = "amregtest"), "tests/testthat/", sep="/")

    cat('\nTests in files under "', root, '":\n', sep="")

    all = gsub("^test-(.+?)\\.R", "\\1", grep("^test-.+?\\.R", list.files(root), value=TRUE), perl=TRUE)

    cat("\nTests by functions in allelematch:\n")
    print(grep("^allelematch", all, value=TRUE, perl=TRUE), width=50)

    cat("\nReproduction of the examples in 'allelematchSuppDoc.pdf':\n")
    print(grep("^amExample", all, value=TRUE, perl=TRUE))

    cat("\nOther:\n")
    print(grep("^allelematch|^amExample", all, value=TRUE, invert=TRUE, perl=TRUE))
    cat("\n")

    invisible(all)
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
#' @details
#' If any of the test executed with [artRun] should fail, then we want to be able
#' to run that specific test under the debugger. \cr
#' \cr
#' Set a breakpoint in `allelematch.R` and call `artRun(filter="<the test that reproduces the problem>")`\cr
#' \cr
#' Note that it is the last installed version of `allelematch` that will be executed,
#' not the last edited. In RStudio, CTRL+SHIFT+B will build and install.
#'
#'
#' @param filter    If specified, only tests with names matching this perl regular
#'                  expression will be executed. See also [artList]
#' @param html      TRUE or FALSE
#'
#' @returns NULL
#'
#' @examples
#' # See what version of packages 'allelematch' and 'amregtest'
#' # are currently installed:
#' artVersion()
#'
#' # List the available tests:
#' artList()
#'
#' \dontrun{
#'
#' # Run all the tests:
#' artRun()
#'
#' # Run the first of the available tests:
#' artRun(filter="allelematch_1-amDataset")
#'
#' # Run all tests that start with 'am' and 'allelematch_1-amDataset':
#' artRun(filter="^am|allelematch_1-amDataset")
#'
#' # Run the test 'amExample3' and let it generate .html files
#' # in the [getwd] directory:
#' artRun(filter='amExample3', html=TRUE)
#' }
#'
#' @seealso [artVersion] and [artList]
#'
#' @export
artRun <- function(filter="", html=FALSE) {
    stopifnot(is.character(filter))
    stopifnot(is.logical(html))

    localenv = c(
        ART_GENERATE_HTML = as.character(html),
        ART_CALLERS_WD = getwd() # Try to write generated html files here
    )
    withr::local_envvar(localenv)

    installedVersion = toString(utils::packageVersion("allelematch"))
    cat("    About to test installed version of allelematch:  <<<", installedVersion, ">>>\n", sep="")
    if (filter != "^$") testthat::test_package("amregtest", reporter = "Progress", filter=filter) # We can't start tests recursively, even for coverage tests
    cat("    Done testing installed version of allelematch:  <<<", installedVersion, ">>>\n", sep="")
}

