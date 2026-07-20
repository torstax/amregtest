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
#' If allelematch was installed with [artInstallCranAllelematch] it will show
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

    # Loaded here rather than in the "Imports:" section of DESCRIPTION file
    refreshPackage("allelematch")

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
#' @return A list (invisibly) containing data about the test results as returned by [testthat::test_package]
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

    # We want to test the last installed version of allelematch.
    # If that package has been rebuilt and re-installed from another
    # RStudio session, then we need to unload the old version from
    # this session before we can load the new version:
    refreshPackage("allelematch")

    # # We load 'allelematch' here rather than in the
    # # "Imports:" section of DESCRIPTION file to be able to
    # # install and load another version of 'allelematch'
    # # later without having to unload 'amregtest' first:
    # if (!requireNamespace("allelematch", quietly = TRUE))     {
    #     stop("Package 'allelematch' is not available.")
    # }
    # withr::local_package("allelematch") # Attach 'allelematch' for the duration of this function call.

    reporter <- ifelse(verbose, "Progress", testthat::check_reporter())

    # Propagate the verbosity to the deferred cleanup code in helper-temp-leaks.R
    # withr ensures the effect lasts until the ENTIRE function returns
    env_value = if(verbose) "true" else "false"
    withr::local_envvar(c("ART_VERBOSE" = env_value))

    # Propagate the 'keep' parameter to the deferred cleanup code in helper-temp-leaks.R
    # withr ensures the effect lasts until the ENTIRE function returns
    env_value = if(keep) "true" else "false"
    withr::local_envvar(c("ART_KEEP_LEAKED_FILES_IN_TEMP" = env_value))

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
#' @param version   string. Default "2.5.5".
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
#' @seealso \link{artVersion}, \link{artList}, \link{artRun} and \link{amregtest}
#'
#' @export
artInstallCranAllelematch <- function(version = "2.5.5") {
    unloadNamespace("allelematch")
    remotes::install_version("allelematch", version = version, repos = "http://cran.r-project.org")

    # Loaded here rather than in the "Imports:" section of DESCRIPTION file
    # to avoid that 'amregtest' prevents 'allelematch' from being repeatedly
    # unloaded, replaced, re-installed, and re-loaded in the same RStudio session:
    requireNamespace("allelematch")
}




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
                   "%Y-%m-%d")  # Was built some othre day. Use date

    # Convert to local time zone, time or date:
    paste(action, format(ctBuildTime, format=form, tz = Sys.timezone()),")", sep="")
}


# We want to test the last installed version of allelematch.
# If that package has been rebuilt and re-installed from another
# RStudio session, then we need to unload the old version from
# this session before we can load the new version:
refreshPackage <- function(pkg = "allelematch") {
    if (isPackageStale(pkg)) {
        message("Unloading stale version of package '", pkg, "' from memory")
        unloadNamespace(pkg) # Will abort with stop if the unload fails.
    }

    # Package may never have been loaded, or unloaded above because it was stale.
    # (re-)load regardless, so that the tests will run against the
    # last installed version:
    if (!pkg %in% loadedNamespaces()) {
        # We load 'allelematch' here rather than in the
        # "Imports:" section of DESCRIPTION file to be able to
        # install and load another version of 'allelematch'
        # later without having to unload 'amregtest' first:
        requireNamespace("allelematch")
    }
}

isPackageStale <- function(pkg = "allelematch") {
    # If it's not even loaded, it can't be out of sync
    if (!pkg %in% loadedNamespaces()) return(FALSE)

    # Find the physical installation path of the package on disk
    pkg_path <- find.package(pkg, quiet = TRUE)
    if (length(pkg_path) == 0) return(FALSE)

    # Target the core package database binary (updated on every single install)
    rdb_file <- file.path(pkg_path, "R", paste0(pkg, ".rdb"))
    if (!file.exists(rdb_file)) return(FALSE)

    # Get the time the file was last written to the disk
    disk_modified_time <- file.info(rdb_file)$mtime

    # Get the time this specific namespace was loaded into your session's RAM
    ram_loaded_time <- attr(asNamespace(pkg), "metadata")$stamp

    # If no stamp attribute exists, fallback to comparing against session start time
    if (is.null(ram_loaded_time)) {
        # If the file on disk is newer than when the active R session booted up
        return(disk_modified_time > (Sys.time() - proc.time()["elapsed"]))
    }

    # Return TRUE if the disk copy has been modified since it was loaded into RAM
    return(disk_modified_time > ram_loaded_time)
}

