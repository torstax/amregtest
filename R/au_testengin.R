###############################################################################
### allelematch test engine ###
###############################################################################

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
auAssertAllelematchVersion <- function(wantedVersion = c("2.5.3", "2.5.2") ) {

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
        auRestartR()
    }
    stopifnot(wantedVersion == toString(utils::packageVersion("allelematch")))
    # cat("    Tested allelematch version is", toString(packageVersion("allelematch")), "\n")
    return(wantedVersion)
}

auRestartR <- function() {
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
#' @export
amUniqueWrapper <- function(amDatasetFocal, ...) {
    # Use the same 'sort' order on all platforms:
    withr::local_collate("C")
    withr::local_language("en")
    #Sys.getlocale()

    # Log the input arguments:
    argString=auArgToString(...)

    cat("   About to call  : amUnique(amDataSetFocal, ", argString, ")\n", sep="")
    startTime <- Sys.time()

    amUniqueResult <- amUnique(amDatasetFocal=amDatasetFocal, ...)

    endTime <- Sys.time()
    cat("\nTestLegacy-2.5.1: Done calling amUnique in ", difftime(endTime, startTime, units = "secs" ), " sec\n", sep="")

    return(amUniqueResult)
}

