###############################################################################
### allelematch test engine ###
###############################################################################

#' Returns package version
#'
#' @description
#' Displays version of this package ([amregtest]) and of [allelematch],
#' together with build timestamps.\cr
#' \cr
#' The version is specified in the file DESCRIPTION, tag "Version: ".
#'
#' If [allelematch] was installed with [artInstallCranAllelematch] it will show
#' a build timestamp from the installation, not from when it was published.
#'
#'
#' @param verbose logical. If TRUE (the default), prints additional info to stdout,
#' including version of [allelematch-package] and build timestamps.
#'
#' @return The loaded version of this package ([amregtest-package]) in a character vector of length one
#'
#' @examples
#' # See what version of packages 'allelematch' and 'amregtest'
#' # are currently loaded:
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
#' @seealso [artList], [artRun], [artInstallCranAllelematch] and [amregtest]
#' @export
artVersion <- function(verbose=TRUE) {
    stopifnot(is.logical(verbose))

    library(allelematch) # Loaded here rather than in the "Imports:" section of DESCRIPTION file

    loadedArtVersion = toString(utils::packageVersion("amregtest"))
    loadedAmVersion  = toString(utils::packageVersion("allelematch"))
    vLen = max(length(loadedArtVersion), length(loadedAmVersion))

    if (verbose) {
        cat(sprintf("\n    Version of package 'amregtest'   is: %-10s %s",
            loadedArtVersion,
            builtAt("amregtest")))
        cat(sprintf("\n    Version of package 'allelematch' is: %-10s %s",
            loadedAmVersion, builtAt("allelematch")))
    }
    return(invisible(loadedArtVersion))
}


# Internal utility function to print the build time for a package:
builtAt <- function(pkg) {
    # if (!is.null(descr <- packageDescription(pkg)$Packaged)) {
    #     # Extract the timestamp string (third semicolon-separated field)
    #     fields <- strsplit(descr, ";")[[1]]
    #     if (length(fields) < 1) return("(??Bad Packaged date??)")
    #
    #     action <- "(Packaged "
    #     timestamp_str <- trimws(fields[1])
    # } else
    if (!is.null(built <- packageDescription(pkg)$Built)) {
        # Extract the timestamp string (third semicolon-separated field)
        fields <- strsplit(built, ";")[[1]]
        if (length(fields) < 3) return("(??Bad Build date??)")

        action <- "(Built "
        timestamp_str <- trimws(fields[3])
    }

    # Convert to POSIXct, assuming string is UTC unless otherwise specified
    ctBuildTime <- as.POSIXct(timestamp_str, tz = "UTC")

    # Was the build made today?
    form <- ifelse(as.Date(ctBuildTime, tz = Sys.timezone()) == Sys.Date(),
                   "%H:%M",  # Was build today. Use timestamp.
                   "%Y-%m-%d")  # Was built some othre day. Use date

    # Convert to local time zone, time or date:
    paste(action, format(ctBuildTime, format=form, tz = Sys.timezone()),")", sep="")
}


#' Lists available tests in `amregtest` without running them
#'
#' @description
#' Use the output to select a value for parameter `filter` to [artRun].
#' Useful when debugging.
#'
#' @param verbose logical. If TRUE (the default), prints additional info to stdout
#'
#' @return A character vector containing the names of all the tests
#'
#' @examples
#' # See what version of packages 'allelematch' and 'amregtest'
#' # are currently loaded:
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
#' @seealso [artVersion], [artRun], [artInstallCranAllelematch] and [amregtest]
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
#' Runs regression tests on package [allelematch] to make sure it is backwards compatible.\cr
#' \cr
#' The full set of tests will take a couple of minutes. \cr
#' \cr
#' Call [artList] to see the available tests with without running them.
#'
#' @return A list (invisibly) containing data about the test results as returned by [testthat::test_package]
#'
#' @details
#' If any of the test executed with [artRun] should fail, then we want to be able
#' to run that specific test under the debugger.\cr
#' \cr
#' Set a breakpoint in `allelematch.R` and call `artRun(filter="<the test that reproduces the problem>")`\cr
#' \cr
#' Note that it is the last loaded version of `allelematch` that will be executed,
#' not the last edited. In RStudio, CTRL+SHIFT+B will build, install and load.
#'
#'
#' @param filter    If specified, only tests with names matching this perl regular
#'                  expression will be executed. Character vector of length 1. See also [artList]
#' @param verbose   logical. If TRUE (the default), prints version of tested allelematch to stdout
#'
#' @examples
#' # See what version of packages 'allelematch' and 'amregtest'
#' # are currently loaded:
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
#' @seealso [artVersion], [artList], [artInstallCranAllelematch] and [amregtest]
#'
#' @export
artRun <- function(filter="", verbose=TRUE) {
    stopifnot(is.character(filter) && length(filter)==1)
    stopifnot(is.logical(verbose))

    library(allelematch) # Loaded here rather than in the "Imports:" section of DESCRIPTION file

    loadedVersion = toString(utils::packageVersion("allelematch"))
    if (verbose) cat("    About to test loaded version of allelematch:  <<<", loadedVersion, ">>>\n", sep="")
    reporter <- ifelse(verbose, "Progress", testthat::check_reporter())
    result = list()
    if (filter != "^$") result = testthat::test_package("amregtest", reporter=reporter , filter=filter) # We can't start tests recursively, even for coverage tests
    if (verbose) cat("    Done testing loaded version of allelematch:  <<<", loadedVersion, ">>>\n", sep="")
    return(invisible(result))
}


#' Installs official version of 'allelematch' from CRAN.
#'
#' @param version. Default "2.5.4".
#'
#' @return TBD
#'
#' @description
#' Note that the CRAN version will be built from source code at installation.
#' This means that [artVersion] will show a "(Built HH:MM)" timestamp
#' from the installation rather than from when it was published on CRAN.
#'
#' @examples
#' # Install the default official version of 'allelematch' from CRAN:
#' artInstallCranAllelematch()
#'
#' # Install another official version of 'allelematch' from CRAN:
#' artInstallCranAllelematch("2.5.3")
#'
#' @seealso [artVersion], [artList], [artRun] and [amregtest]
#'
#' @export
artInstallCranAllelematch <- function(version = "2.5.4") {
    # install.packages("remotes") # Requires restarting R
    library(remotes)
    remotes::install_version("allelematch", version = version, repos = "http://cran.r-project.org")
}

