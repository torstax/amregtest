###############################################################################
### allelematch test engine ###
###############################################################################

#' Prints package version
#'
#' @description
#' Prints version of this package and of tested version of [allelematch].
#'
#' @seealso [artInstallAllelematchVersion]
#' @export
artVersion <- function() {
    installedArtVersion = toString(utils::packageVersion("amregtest"))
    installedAmVersion  = toString(utils::packageVersion("allelematch"))

    cat("\n    Version of package 'amregtest' is", installedArtVersion)
    cat("\n    Installed (and thus tested) version of package 'allelematch' is:", installedAmVersion)
    cat("\n")
    cat("\n    This version of 'amregtest' was used to test 'allelematch' versions 2.5.3 and 2.5.2")
    cat("\n    2.5.1 and earlier versions of 'allelematch' require older versions of R to work.")
    cat("\n\n")
    # return(installedVersion)
}


#' Installs the version of package `allelematch` to test
#'
#' @description
#' If the `wantedVersion` of package [allelematch] is not yet installed,
#' then the current version is deleted, the `wantedVersion` is installed and
#' R is restarted.\cr
#' \cr
#' Look at \href{https://github.com/cran/allelematch/tags}{allelematch tags} at CRAN to see available versions.
#' \cr
#' Note that the first supported version is 2.5.2. Older versions are no longer
#' tolerated modern versions of R (e.g. 4.3.2).
#'
#' TODO: Find the change and revision in R!
#'
#' @param wantedVersion a string that contains the wanted version of `allelematch`.
#' Note that the current version of R,  4.3.2, no longer accepts `allelematch` "2.5.1".
#' The first supported version is "2.5.2".
#'
#' @returns The wantedVersion on success, otherwise execution is stopped.
#'
#' @seealso [artVersion] [artAssertAllelematchVersion]
#'
#' @export
artInstallAllelematchVersion <- function(wantedVersion) {
    installedVersion = toString(utils::packageVersion("allelematch"))
    if (wantedVersion != installedVersion) {
        artAssertAllelematchVersion(wantedVersion)
    } else {
        cat("\n    Installed version is alrerady", wantedVersion)
    }
    return(wantedVersion)
}


#' Runs the regression test
#'
#' @description
#'
#' TODO:
#'
#' @param skip_slow     TRUE or FALSE
#' @param generate_html TRUE or FALSE
#'
#' @returns NA
#'
#' @seealso [artVersion] [artAssertAllelematchVersion]
#' @seealso [artSet] [artShow] [artClear]
#'
#' @export
artRun <- function(skip_slow=FALSE, generate_html=FALSE) {
    switch(as.character(skip_slow),
           "TRUE"=1,
           "FALSE"=1,
           stop("Unexpected value of skip_slow:", skip_slow,
                "\n    Expected one of 'TRUE' or 'FALSE'\n")
    )
    switch(as.character(generate_html),
           "TRUE"=1,
           "FALSE"=1,
           stop("Unexpected value of generate_html:", generate_html,
                "\n    Expected one of 'TRUE' or 'FALSE'\n")
    )
    localenv = c(
        ART_SKIP_SLOW = as.character(skip_slow),
        ART_GENERATE_HTML = as.character(generate_html),
        ART_CALLERS_WD = getwd() # Try to write generate html files here
    )
    withr::local_envvar(localenv)

    installedVersion = toString(utils::packageVersion("allelematch"))
    cat("    About to test installed version of allelematch:  <<<", installedVersion, ">>>\n", sep="")
    result = testthat::test_package("amregtest")
    cat("    Done testing installed version of allelematch:  <<<", installedVersion, ">>>\n", sep="")
    invisible(result)
}


#' Runs selected test(s) in the selected `test-*.R` file
#'
#' @description
#' Allows narrowing down to a single test in a single [testthat] file. \cr
#' \cr
#' From RStudio, set a breakpoint in one of the [allelematch] files
#' in order to activate the debugger.
#'
#' @details
#' If any of the test executed with [artRun] should fail, then we want to be able
#' to run that specific test in the debugger.
#'
#' Unfortunately it is not possible to set breakpoints in any of the `test-*.R` script files.\cr
#' This is because the breakpoints are registered in the sourced and parsed code. \cr
#' When the script is sourced again, the breakpoints are cleared. And `testthat`
#' sources the scripts as part of the execution. Also, `testthat`usually runs in
#' a separate session from RStudio, so it won't ever be able to use editor breakpoints.
#'
#' It is however possible to set breakpoints in the built and installed
#' source code of [allelematch]. And this function makes it possible
#' to run just the failing test. \cr
#' \cr
#' Please note the Traceback window that appears under the Environment window
#' when you run this function with a breakpoint set in `allelematch` code.
#'
#' This method was inspired by https://stackoverflow.com/questions/31548796/debugging-testthat-tests-in-rstudio/63717008#63717008
#' by Drew D and by [devtools::test_active_file].
#'
#' @examples
#' # From the RStudio console: Run the full set of tests
#' artRun()
#'
#' # If an error was detected, you may want to set a breakpoint and debug.
#' # Unfortunately, this is not supported by testthat. Testthat sources
#' # the test files. Whenever a file is sourced, the breakpoints in it are lost.
#' # But artDebug allows setting breakpoints in the tested software .... TBD!
#'
#' # In RStudio: Show the test-*.R file to test in the active editor window
#' # Runs all tests in the
#'
#' # TODO!
#'
#' @param match  the calls to test_that were the description matches `match` are executed
#' @param file   the `testthat` `test-*.R` script files. Default is the file in the currently active editor window in RStudio.
#'
#' @returns NA
#'
#' @seealso [artVersion] [artAssertAllelematchVersion]
#' @seealso [artSet] [artShow] [artClear]
#'
#' @export
artDebug <- function(match = ".", file = active_editor_file()) {
    # Use the same 'sort' order on all platforms:
    withr::local_collate("C")
    withr::local_language("en")
    #Sys.getlocale()

    # active_editor_file /
    # devtools::test_active_file()
    installedVersion = toString(utils::packageVersion("allelematch"))
    dir = normalizePath(dirname(file))
    cat("\n    allelmatch version  : ", installedVersion,
        "\n    Test file to be run : ", file,
        "\n    Pattern to match test_that description : '", match, "'",
        "\n", sep="")

    if(!file.exists(file))
        stop("\n    Could not find active_file!",
             "\n    active_file = '", file, "'\n")

    # find any setup and helper files in the same dir:
    setups  = sapply(list.files(path=dir, pattern = "\\bsetup.*\\.(R|r)",  full.names = TRUE), normalizePath)
    helpers = sapply(list.files(path=dir, pattern = "\\bhelper.*\\.(R|r)", full.names = TRUE), normalizePath)
    cat("    Setups  :", setups,  sep="\n      ")
    cat("    Helpers :", helpers, sep="\n      ")

    # Source all the found setup and helper files to make the functions in them available:
    sapply(setups, source)
    sapply(helpers, source)

    # Define a new function that executes the matching tests using a re-defined 'test_that' function
    testf_trace <- function(active_file, match) {
        env <- new.env()

        # Re-define the 'test_that function to only execute the tests where
        # the description matches 'match':
        test_that <- function(desc, code) {
            if (length(grep(match, desc)) > 0) {
                cat("    Matching test :", desc, "\n")
                eval(substitute(code), env)
            } else {
                # cat("NOT Matching:", desc, "\n")
            }
        }
        env$test_that <- test_that

        # Execute the matching tests without starting a separate session:
        source(active_file, env)
    }

    # Execute the matching tests without starting a separate session:
    result = testf_trace(file, match)

    cat("\n    Done debugging installed version of allelematch:  <<<", installedVersion, ">>>\n", sep="")

    invisible(result)
}

#' Internal utility file for above
#'
active_editor_file <- function() {
    normalizePath(rstudioapi::getSourceEditorContext()$path)
}

artHtml <- function(file) {
    dir = Sys.getenv("ART_CALLERS_WD")
    if(dir == "") {
        dir = ifelse( grepl("/tests/testthat$", getwd()), "../..", ".") # testthat changes getwd() to tests/testthat/.
        dir = normalizePath(dir, winslash = "/")
    }
    # dir = sub("^(C):", "/\\1", dir, perl=TRUE, fixed=FALSE)
    dir = sub("^C:", "", dir, perl=TRUE, fixed=FALSE)
    # dir = "\"/c/Users/Torva/repo/regressiontest\""
    if(!dir.exists(dir)) stop("\n    dir = '", dir, "' does not exist!\n    getwd() = '", getwd(), "' ", sep="")
    longfile = paste(dir, "/", file, sep="")
    cat("\n    Writing html to :", longfile)

    # return("/c/Users/Torva/repo/regressiontest/hej.html")

    return(longfile)
}

#' Controls execution of the regression test
#'
#' @description
#' Two environment variables control the execution of the tests
#' then the current version is deleted, the `wantedVersion` is installed and
#' R is restarted.\cr
#' \cr
#' Look at \href{https://github.com/cran/allelematch/tags}{allelematch tags} at CRAN to see available versions.
#' \cr
#' Note that the first supported version is 2.5.2. Older versions are no longer
#' tolerated modern versions of R (e.g. 4.3.2).
#'
#' TODO: Find the change and revision in R!
#'
#' @param skip_slow     TRUE or FALSE
#' @param generate_html TRUE or FALSE
#'
#' @seealso [artShow] [artClear]
#'
#' @export
artSet <- function(skip_slow=NA, generate_html=NA) {
    switch(as.character(skip_slow),
        "NA"=NA, # Do nothing
        "TRUE"=Sys.setenv(ART_SKIP_SLOW = "TRUE"),
        "FALSE"=Sys.unsetenv("ART_SKIP_SLOW"),
        stop("Unexpected value of skip_slow:", skip_slow,
             "\n    Expected one of 'TRUE', 'FALSE' or 'NA'\n")
    )
    switch(as.character(generate_html),
           "NA"=NA, # Do nothing
           "TRUE"=Sys.setenv(ART_GENERATE_HTML = "TRUE"),
           "FALSE"=Sys.unsetenv("ART_GENERATE_HTML"),
           stop("Unexpected value of generate_html:", generate_html,
                "\n    Expected one of 'TRUE', 'FALSE' or 'NA'\n")
    )
    artShow()
}


#' Shows the current settings
#'
#' @export
artShow <- function() {
    cat("    ART_SKIP_SLOW         =", Sys.getenv("ART_SKIP_SLOW"),"\n")
    cat("    ART_GENERATE_HTML =", Sys.getenv("ART_GENERATE_HTML"),"\n")
}


#' Clears all current settings
#'
#' @export
artClear <- function() {
    Sys.unsetenv("ART_SKIP_SLOW")
    Sys.unsetenv("ART_GENERATE_HTML")
    artShow()
}


#' Makes sure further testing uses `wantedVersion` of package allelematch
#'
#' @description
#' If the `wantedVersion` of package `allelematch` is not yet installed,
#' then the current version is deleted, the wantedVersion is installed and
#' R is restarted.
#'
#' @param wantedVersion a string that contains the wanted version of allelematch.
#' Note that the current version of R,  4.3.2, no longer accepts allelematch "2.5.1".
#' The first supported version is "2.5.2".
#'
#' @returns The wantedVersion on success, otherwise execution is stopped.
#'
#' @export
artAssertAllelematchVersion <- function(wantedVersion = c("2.5.3", "2.5.2") ) {

    installedVersion = toString(utils::packageVersion("allelematch"))
    if (wantedVersion != installedVersion) {
        cat("\nAbout to install wantedVersion of allelematch,", wantedVersion, " - Current version is", installedVersion,
            "\n\n    PLEASE RESTART PROGRAM MANUALLY after R session has beeen restarted ...\n\n")
        if("allelematch" %in% (.packages())){
            # A package can be installed without being attached (with library(package))
            # If it isn't attached, 'detatch()' will cause the program to abort below:
            base::detach("package:allelematch", unload=TRUE)
        }
        remotes::install_version("allelematch", version = wantedVersion, repos="https://cran.rstudio.com//")
        artRestartR()
    }
    stopifnot(wantedVersion == toString(utils::packageVersion("allelematch")))
    # cat("    Tested allelematch version is", toString(packageVersion("allelematch")), "\n")
    return(wantedVersion)
}


artRestartR <- function() {
    Sys.sleep(3)
    if (rstudioapi::isAvailable()) {
        # We are running under RStudio.
        # We could call .rs.restartR(). But that causes hard-to-get-rid-of
        # warnings when we run RStudio's Build->Check:
        #    no visible global function definition for '.rs.restartR'
        # So, we use this instead:
        dummy <- rstudioapi::restartSession()
    } else {
        base::system("R") # Start next session
        base::quit("no")  # Quit the current session
    }
    Sys.sleep(3)
    stop()
}


#' Wrapper around [allelematch::amUnique]
#'
#' @description
#' Sets the locale to "C" and the language to "en" to ensure that
#' [sort] works the same way on all platforms. \cr
#' Generates a message string that describes the specified parameters.\cr
#' Feeds the specified parameters to [allelematch::amUnique].\cr
#' Measures the execution time.
#'
#' @param   amDatasetFocal A dataset from [allelematch::amDataset]. Is passed on to [allelematch::amUnique] as is.
#' @param   ... Logged and passed on to [allelematch::amUnique] as is.
#'
#' @returns The result from [allelematch::amUnique]
# '
#    Find another @ example test_legacy-2.5.1/TestLegacy-2.5.1.R
#'
#  ' @export
amUniqueWrapper <- function(amDatasetFocal, ...) {
    # Use the same 'sort' order on all platforms:
    withr::local_collate("C")
    withr::local_language("en")
    #Sys.getlocale()

    # Log the input arguments:
    argString=artArgToString(...)

    cat("   About to call  : amUnique(amDataSetFocal, ", argString, ")\n", sep="")
    startTime <- Sys.time()

    amUniqueResult <- amUnique(amDatasetFocal=amDatasetFocal, ...)

    endTime <- Sys.time()
    cat("\nTestLegacy-2.5.1: Done calling amUnique in ", difftime(endTime, startTime, units = "secs" ), " sec\n", sep="")

    return(amUniqueResult)
}

