###############################################################################
### allelematch test engine ###
###############################################################################

#' Returns package version
#'
#' @description
#' Displays version of this package (\link{amregtest}) and of [allelematch][allelematch::allelematch-package],
#' together with build timestamps.\cr
#' \cr
#' The version is specified in the file DESCRIPTION, tag "Version: ".
#'
#' If allelematch was installed with \link{artInstallCranAllelematch} it will show
#' a build timestamp from the installation, not from when it was published.
#'
#' @param verbose logical. If TRUE (the default), prints additional info to stdout,
#' including versions and build timestamps of 'allelematch' and 'amregtest'.
#'
#' @return The loaded version of this package (\link{amregtest-package}) in a character vector of length one
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
#' @seealso \link{artList}, \link{artRun}, \link{artInstallCranAllelematch} and \link{amregtest}
#' @export
artVersion <- function(verbose=TRUE) {
    stopifnot(is.logical(verbose))

    installedArtVersion = toString(utils::packageVersion("amregtest"))
    installedAmVersion  = toString(utils::packageVersion("allelematch"))
    vLen = max(length(installedArtVersion), length(installedAmVersion))

    if (verbose) {
        cat(sprintf("\n    Installed version of package 'amregtest'   is: %-10s %s",
            installedArtVersion,
            builtAt("amregtest")))
        cat(sprintf("\n    Installed version of package 'allelematch' is: %-10s %s",
            installedAmVersion, builtAt("allelematch")))
    }

    return(invisible(installedArtVersion))
}


#' Lists available tests in `amregtest` without running them
#'
#' @description
#' Use the output to select a value for parameter `filter` to \link{artRun}.
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
#' @seealso \link{artVersion}, \link{artRun}, \link{artInstallCranAllelematch} and \link{amregtest}
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
#' Runs regression tests on package [allelematch][allelematch::allelematch-package] to make sure it is backwards compatible.\cr
#' \cr
#' The full set of tests will take a couple of minutes. \cr
#' \cr
#' Call \link{artList} to see the available tests without running them.
#'
#' @return A list (invisibly) containing data about the test results as returned by \link[testthat]{test_package}
#'
#' @details
#' If any of the test executed with \link{artRun} should fail, then we want to be able
#' to run that specific test under the debugger.\cr
#' \cr
#' Set a breakpoint in `allelematch.R` and call `artRun(filter="<the test that reproduces the problem>")`\cr
#' \cr
#' Note that it is the last loaded version of `allelematch` that will be executed,
#' not the last edited. In RStudio, CTRL+SHIFT+B will build, install and load.
#'
#'
#' @param filter    If specified, only tests with names matching this perl regular
#'                  expression will be executed. Character vector of length 1. See also \link{artList}
#' @param verbose   logical. If TRUE (the default), prints version of tested allelematch to stdout
#' @param keep      logical. If FALSE (the default), deletes the temporary files
#'                  created by the tests. This includes .htm and .png files
#'                  for browsers and Viewer.
#'                  If TRUE, keeps the temporary files for inspection.
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
#' @seealso \link{artVersion}, \link{artList}, \link{artInstallCranAllelematch} and \link{amregtest}
#'
#' @export
artRun <- function(filter="", verbose=TRUE, keep=FALSE) {
    stopifnot(is.character(filter) && length(filter)==1)
    stopifnot(is.logical(verbose))
    stopifnot(is.logical(keep))

    reporter <- ifelse(verbose, "Progress", testthat::check_reporter())

    # Propagate the verbosity to the deferred cleanup code in helper-temp-leaks.R
    # withr ensures the effect lasts until the ENTIRE function returns
    env_value = if(verbose) "true" else "false"
    withr::local_envvar(c("ART_VERBOSE" = env_value))

    # Propagate the 'keep' parameter to the deferred cleanup code in helper-temp-leaks.R
    # withr ensures the effect lasts until the ENTIRE function returns
    env_value = if(keep) "true" else "false"
    withr::local_envvar(c("ART_KEEP_LEAKED_FILES_IN_TEMP" = env_value))

    # env_value = if(keep) "" else "TRUE"
    # withr::local_envvar(c("ALLELEMATCH_SKIP_HTML" = env_value))

    installedVersion = toString(utils::packageVersion("allelematch"))
    if (verbose) cat("    About to test installed version of allelematch:  <<<", installedVersion, ">>>\n", sep="")

    reporter <-
        if (!verbose) testthat::check_reporter() # Keep silent unless there are errors.
        else if(interactive()) "Progress"        # Nice interactive progress bar in RStudio
        else ColumnReporter$new()                # Nice columns to stdout

    result = list()
    if (filter != "^$") result = testthat::test_package("amregtest", reporter=reporter , filter=filter) # We can't start tests recursively, even for coverage tests
    if (verbose) cat("    Done testing installed version of allelematch:  <<<", installedVersion, ">>>\n", sep="")
    return(invisible(result))
}


#' Installs official version of 'allelematch' from CRAN.
#'
#' @param version   string. Default "3.0.0".
#'
#' @description
#' This is a convenience function that installs one of the
#' official version of 'allelematch' from CRAN.
#'
#' It calls [remotes::install_version()] to install the specified version.
#'
#' If executed from a RStudio Console, it then calls [rstudioapi::restartSession()]
#' to ensure that the installed version of 'allelematch' is also the loaded version
#' in the current R session.
#'
#' Note that the CRAN version will be built from source code at installation.
#' This means that \link{artVersion} will show a "(Built HH:MM)" timestamp
#' from the installation rather than from when it was published on CRAN.
#'
#' @examples
#' \donttest{
#' # Install the default official versions of 'allelematch' from CRAN:
#' artInstallCranAllelematch()
#'
#' # Install another official version of 'allelematch' from CRAN:
#' artInstallCranAllelematch("2.5.3")
#' }
#'
#' @seealso \link{artVersion}, \link{artList}, \link{artRun} and \link{amregtest}
#'
#' @export
artInstallCranAllelematch <- function(version = "3.0.0") {
    stopifnot(is.character(version) && length(version)==1)

    # detach("package:allelematch", unload=TRUE, character.only = TRUE)
    unloadNamespace("allelematch")
    remotes::install_version("allelematch", version = version, repos = "http://cran.r-project.org")

    # Are we running in a RStudio console?
    if (   requireNamespace("rstudioapi", quietly = TRUE)
           && rstudioapi::isAvailable()
           && rstudioapi::getActiveDocumentContext()$id == "#console") {

        # We _are_ running in a RStudio console.
        # Restart the session to load the new version of 'allelematch':
        rstudioapi::restartSession()
    }
}


# ----------- Internal utility functions: -------------------------------------

# Internal utility function to print the build time for a package:
builtAt <- function(pkg) {
    timestamp_str <- NULL
    if (!is.null(built <- packageDescription(pkg)$Built)) {
        # Extract the timestamp string (third semicolon-separated field)
        fields <- strsplit(built, ";")[[1]]
        if (length(fields) < 3) return("(??Bad Build date??)")

        action <- "(Built "
        timestamp_str <- trimws(fields[3])
    }

    if (is.null(timestamp_str)) return("(timestamp not found)")

    # Convert to POSIXct, assuming string is UTC unless otherwise specified
    ctBuildTime <- as.POSIXct(timestamp_str, tz = "UTC")

    # Was the build made today?
    form <- ifelse(as.Date(ctBuildTime, tz = Sys.timezone()) == Sys.Date(),
                   "%H:%M",  # Was build today. Use timestamp.
                   "%Y-%m-%d")  # Was built some other day. Use date

    # Convert to local time zone, time or date:
    paste0(action, format(ctBuildTime, format=form, tz = Sys.timezone()),")")
}


