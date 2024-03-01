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
    installedVersion = toString(utils::packageVersion("amregtest"))
    cat("\n    Version of package 'amregtest' is", )
    cat("\n    Installed (and thus tested) version of package 'allelematch' is:", installedVersion)
    cat("\n")
    cat("\n    This version of 'amregtest' was used to test 'allelematch' versions 2.5.3 and 2.5.2")
    cat("\n")
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


#' Runs the regressiontest
#'
#' @description
#'
#' TODO:
#'
#'
#' @returns NA
#'
#' @seealso [artVersion] [artAssertAllelematchVersion]
#' @seealso [artSet] [artShow] [artClear]
#'
#' @export
artRun <- function() {

    return(NA)
}


#' Controls execution of the regressiontest
#'
#' @description
#' Two envionement variables control the executon of the tests
#' then the current version is deleted, the `wantedVersion` is installed and
#' R is restarted.\cr
#' \cr
#' Look at \href{https://github.com/cran/allelematch/tags}{allelematch tags} at CRAN to see available versions.
#' \cr
#' Note that the first supported version is 2.5.2. Older versions are no longer
#' tollerated modern versions of R (e.g. 4.3.2).
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
        "TRUE"=Sys.setenv(SKIP_SLOW_TESTS = "TRUE"),
        "FALSE"=Sys.unsetenv("SKIP_SLOW_TESTS"),
        stop("Unexpected value of skip_slow:", skip_slow,
             "\n    Expected one of 'TRUE', 'FALSE' or 'NA'\n")
    )
    switch(as.character(generate_html),
           "NA"=NA, # Do nothing
           "TRUE"=Sys.setenv(GENERATE_HTML_SUMMARIES = "TRUE"),
           "FALSE"=Sys.unsetenv("GENERATE_HTML_SUMMARIES"),
           stop("Unexpected value of generate_html:", generate_html,
                "\n    Expected one of 'TRUE', 'FALSE' or 'NA'\n")
    )
    artShow()
}


#' Shows the current settings
#'
#' @export
artShow <- function() {
    cat("    SKIP_SLOW_TESTS         =", Sys.getenv("SKIP_SLOW_TESTS"),"\n")
    cat("    GENERATE_HTML_SUMMARIES =", Sys.getenv("GENERATE_HTML_SUMMARIES"),"\n")
}


#' Clears all current settings
#'
#' @export
artClear <- function() {
    Sys.unsetenv("SKIP_SLOW_TESTS")
    Sys.unsetenv("GENERATE_HTML_SUMMARIES")
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

