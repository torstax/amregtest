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

    # if (isPackageStale("allelematch", verbose = verbose)) {
    #     warning("Installed version of 'allelematch' has not been loaded.\nPlease do 'library(allelematch)'", call. = FALSE)
    # }

    # # Loaded here rather than in the "Imports:" section of DESCRIPTION file
    # artRefreshAllelematch(verbose = verbose)

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

    # We want to test the last installed version of allelematch.
    # If that package has been rebuilt and re-installed from another
    # RStudio session, then we need to unload the old version from
    # this session before we can load the new version:
    #

    # if (isPackageStale("allelematch", verbose = verbose)) {
    #     stop("Installed version of 'allelematch' has not been loaded.\nPlease do 'library(allelematch)'", call. = FALSE)
    # }

    # artRefreshAllelematch(verbose = FALSE)

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
#' @param version   string. Default "2.5.5".
#'
#' @return TBD
#'
#' @description
#' Note that the CRAN version will be built from source code at installation.
#' This means that \link{artVersion} will show a "(Built HH:MM)" timestamp
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


#TODO Ensures that latest installed 'allelematch' is also loaded in this R session.
#TODO
#TODO @param verbose   logical. If TRUE (the default), prints diagnostic progress
#TODO messages to stdout
#TODO
#TODO @return TBD
#TODO
#TODO @description
#TODO Ensures that the latest installed version of 'allelematch' is loaded and
#TODO attached in this R session, regardless of version string.
#TODO Any older version is unloaded.
#TODO
#TODO This function handles the case where 'allelematch' development and 'amregtest'
#TODO testing of 'allelematch' is done in different RStudio sessions.
#TODO Development implies frequent repetitive edit-build-install cycles
#TODO without changing the 'allelematch' version. These re-installations
#TODO are not automatically detected by R in another R session, causing large
#TODO risk of testing an older version of 'allelematch' than intended.
#TODO
#TODO This function is also called from \link{artRun}, \link{artVersion},
#TODO and from the setup.R file in the tests/testthat directory.
#TODO
#TODO @examples
#TODO # Install the default official version of 'allelematch' from CRAN:
#TODO artInstallCranAllelematch()
#TODO
#TODO # Install another official version of 'allelematch' from CRAN:
#TODO artInstallCranAllelematch("2.5.3")
#TODO
#TODO @seealso \link{artVersion}, \link{artList}, \link{artRun} and \link{amregtest}
#TODO
#TODO @export
# We load 'allelematch' here rather than in the
# "Imports:" section of DESCRIPTION file to be able to
# install and load another version of 'allelematch'
# later without having to unload 'amregtest' first:
artRefreshAllelematch <- function(verbose = FALSE) {
    stopifnot(is.logical(verbose))
    # refreshPackage("allelematch", verbose = verbose)
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
                   "%Y-%m-%d")  # Was built some othre day. Use date

    # Convert to local time zone, time or date:
    paste0(action, format(ctBuildTime, format=form, tz = Sys.timezone()),")")
}


# Create a space in the R session to store temporary data for this package:
.onLoad <- function(libname, pkgname) {
    ns <- asNamespace(pkgname)
    # Skapa ett dolt minnesutrymme i ditt eget paket för denna session
    assign(".r_session_env", new.env(parent = emptyenv()), envir = ns)
}

# Internal utility function to get the time when pkg was last
# loaded into memory and attached:
existsLastLoadedTime <- function(pkg) {
    stopifnot(is.character(pkg) && length(pkg) == 1)

    senv <- asNamespace("amregtest")$.r_session_env
    valname <- paste0(pkg, "_ram_load_time")

    return(exists(valname, envir = senv, inherits = FALSE))
}

# Internal utility function to get the time when pkg was last
# loaded into memory and attached.
# R session-start is fallback for time of last load.
getLastLoadedTime <- function(pkg) {
    stopifnot(is.character(pkg) && length(pkg) == 1)

    senv <- asNamespace("amregtest")$.r_session_env
    valname <- paste0(pkg, "_ram_load_time")

    return(mget(valname, envir = senv,
                ifnotfound = Sys.time() - proc.time()["elapsed"])) # R session-start
}

# Internal utility function to set the time when pkg was last
# loaded into memory and attached:
setLastLoadedTime <- function(pkg) {
    stopifnot(is.character(pkg) && length(pkg) == 1)

    senv <- asNamespace("amregtest")$.r_session_env
    valname <- paste0(pkg, "_ram_load_time")

    assign(valname, Sys.time(), envir = senv)
}

# Internal utility function to ensure that the loaded version of pkg
# is the latest installed version of pkg, regardless of version.
refreshPackage <- function(pkg = "allelematch", verbose = TRUE) {
    stopifnot(is.character(pkg) && length(pkg) == 1)
    stopifnot(is.logical(verbose))

    # Is this the first time we are loading pkg in this R session
    # or since this package was loaded?
    if (!existsLastLoadedTime(pkg)) {
        # This is the first call to 'refresh' since amregtest was loaded
        # in this R session. Reload pkg to make to synchronize:
        if(verbose) cat("\n      First reload of '", pkg, "' after load of 'amregtest'", sep = "")
        reloadPackage(pkg, verbose = verbose)
        return()
    } else if (!pkg %in% loadedNamespaces()) {
        # Pkg has not been loaded into this R session yet.
        if(verbose) cat("\n      First load of '", pkg, "' in this R session", sep = "")
        reloadPackage(pkg, verbose = verbose)
        return()
    } else if (isPackageStale(pkg, verbose = verbose)) {
        # isPackageStale() does it's own reporting:
        reloadPackage(pkg, verbose = verbose)
    }
}


isPackageStale <- function(pkg = "allelematch", verbose = TRUE) {
    stopifnot(is.character(pkg) && length(pkg) == 1)
    stopifnot(is.logical(verbose))

    # If it's not even loaded, it can't be out of sync
    # This case should have been handled before coming to this function.
    if (!pkg %in% loadedNamespaces()) {
        warning("Package '", pkg, "' is not yet loaded into memory")
        return(FALSE)
    }

    # Find the physical installation path of the package on disk
    # This case should have been handled before coming to this function.
    pkg_path <- find.package(pkg, quiet = TRUE)
    if (length(pkg_path) == 0) {
        warning("Failed to find path to RDB file for '", pkg, "'. Cannot determine if it is stale.")
        return(FALSE)
    }

    # Find the core package database binary (updated on every install):
    rdb_file <- file.path(pkg_path, "R", paste0(pkg, ".rdb"))
    if (!file.exists(rdb_file)) {
        if (verbose)
            warning("Failed to find RDB file for '", pkg, "'. Cannot determine if it is stale.")
        return(FALSE)
    }

    # Get the time the file was last written to the disk:
    disk_mtime <- file.info(rdb_file)$mtime

    # Get the time when we last loaded pkg's namespace
    # into this R session's RAM:
    ram_loaded_time <- getLastLoadedTime(pkg)  # R session-start is fallback

    if (verbose) {
        if (disk_mtime > ram_loaded_time)
            cat("\n    Package '", pkg, "' is stale:",
                "\n      disk mtime      = ", format(disk_mtime),
                "\n      RAM loaded time = ", format(ram_loaded_time), sep ="")
        else
            cat("\n    Package '", pkg, "' is still fresh:",
                "\n      disk mtime      = ", format(disk_mtime),
                "\n      RAM loaded time = ", format(ram_loaded_time), sep ="")
    }

    return(disk_mtime > ram_loaded_time)
}


reloadPackage <- function(pkg = "allelematch", verbose = FALSE) {
    stopifnot(is.character(pkg) && length(pkg) == 1)
    stopifnot(is.logical(verbose))

    # Check upfront for loaded namespaces that import pkg,
    # since unloadNamespace() will error if any exist.
    blocking <- loadedNamespaces()[vapply(loadedNamespaces(), function(ns) {
        tryCatch(pkg %in% names(getNamespaceImports(ns)), error = function(e) FALSE)
    }, logical(1))]
    blocking <- setdiff(blocking, pkg)   # exclude pkg itself

    if (length(blocking) > 0) {
        warning(
            "Cannot unload '", pkg, "': imported by loaded namespace(s): ",
            paste(blocking, collapse = ", "),
            ". The stale version will continue to be used in this session."
        )
        return()
    }

    if (isNamespaceLoaded(pkg)) { # TODO: Risk for race conditions here

        # Detatch, unload, and remove any "package promise"
        detach(p <- paste0("package:", pkg), character.only = TRUE)
        unloadNamespace(pkg) # (Misses "promise" if called alone)

        if (isNamespaceLoaded(pkg)) {
            warning(
                "Failed to unload '", pkg,
                "'. The stale version will continue to be used in this session."
            )
            return()
        }
    }

    # The installation of pkg may be ongoing in another R session.
    # If so, make sure it has completed before trying to load it:.
    waitForStablePackageFiles(pkg, verbose = verbose)  # Wait until installer has finished writing


    # TODO vvvv Commented out
    # # At last time to load package:
    # if (verbose)
    #     cat("\n    Loading latest installed version of package '", pkg,
    #         "' into memory", sep="")
    # if(!require(pkg, quietly = TRUE, character.only=TRUE)) {
    #     stop("Failed to load package '", pkg, "'. Please check that it is installed correctly.")
    # }
    # TODO ^^^^ Commented out

    # Remember the time when we loaded pkg's namespace into this R session's RAM:
    setLastLoadedTime(pkg)
    # assign(pkg, Sys.time(), envir = .ART_pkg_load_times)

    if (verbose)
        cat("\n    Done loading latest installed version of package '", pkg,
            "' into memory", sep="")
}


# Wait until the package lazy-load DB files (.rdb and .rdx) stop growing,
# which signals that the installer in the other R session has finished writing.
# Two consecutive equal-size reads is the "write complete" condition on Windows.
waitForStablePackageFiles <- function(pkg, timeout_secs = 15, poll_secs = 0.3, verbose = FALSE) {
    stopifnot(is.character(pkg) && length(pkg) == 1)
    stopifnot(is.logical(verbose))

    pkg_path <- find.package(pkg, quiet = TRUE)
    if (length(pkg_path) == 0) return(invisible(TRUE))

    files <- file.path(pkg_path, "R", paste0(pkg, c(".rdb", ".rdx")))
    files <- files[file.exists(files)]
    if (length(files) == 0) return(invisible(TRUE))

    deadline  <- Sys.time() + timeout_secs
    prev_sizes <- rep(-1, length(files))

    while (Sys.time() < deadline) {
        Sys.sleep(poll_secs)
        cur_sizes <- vapply(files, function(f) file.info(f)$size, numeric(1))
        if (!anyNA(cur_sizes) && all(cur_sizes == prev_sizes))
            return(invisible(TRUE))   # Stable: installer has finished writing
        prev_sizes <- cur_sizes
    }

    warning("Timed out (", timeout_secs, "s) waiting for '", pkg,
            "' package files to stabilize. Load may be unreliable.")
    return(invisible(FALSE))
}

