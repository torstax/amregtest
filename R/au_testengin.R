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

KGBH_validateParams <- function(amDatasetFocal, paramString, outputData, expectedData, summary, overwriteExpected) {

    # Validate the input parameters:
    stopifnot(inherits(amDatasetFocal, "amDataset"))
    # stopifnot(length(find(c(expectedData))) > 0)
    stopifnot(exists(c(expectedData)))
    stopifnot(grepl("exp",expectedData, fixed = TRUE))

    if (is.null(outputData)) {
        stopifnot(dir.exists("data")) # NOTE: Here we assume that getwd() points at R root dir
        outputData=sub("_expected", "_actual", expectedData) # One format
        outputData=sub("_exp", "_act", outputData)           # Another format
        outputData=sub("exp_", "act_", outputData)           # Yet another format
        if (outputData == expectedData) outputData = strcat(outputData, "_actual") # Avoid overwriting expected
    }

    cat("\nTestLegacy-2.5.1: About to call  amUnique(amDataSetFocal,", paramString, ")\n")
    if(summary) { cat("   and summary.amUnique( csv)\n") }
#   cat("   outputFile     = ", outputFile,  "\n")
    cat("   outputData     = ", outputData,  "\n")
    cat("   expectedData   = ", expectedData, "\n")

    if (identical(FALSE, overwriteExpected)) {
        stopifnot(exists(expectedData)) # TODO: Better explanation to the screen
    } else {
        cat("\nTestLegacy-2.5.1: Requested to overwrite expectedData\n")
        cat("   Are you sure (y/N)?") # ,  "\n")
        areYouSureYouWantToOverwriteExpectedData = readLines(stdin(), n=1)
        stopifnot(areYouSureYouWantToOverwriteExpectedData == c("y"))
        if (!dir.exists("data")) {
            cat("\nTestLegacy-2.5.1: Sorry, getwd() =", getwd(), "\n")
            cat("                  does not contain a 'data' directory.\n")
            stop("You need to 'setwd()' to the current R project root to overwriteExpected.\n       And that dir needs to contain a 'data' directory.")
        }

        cat("\nTestLegacy-2.5.1: WILL OVERWRITE\n")
        cat("   expectedData   = ", expectedData, " WITH\n")
        cat("   outputData     = ", outputData,  "\n")
    }

    return(outputData)
}


#' Wrapper around [allelematch::amUnique] that adds logging
#'
#' @description
#' Generates a message string that describes the specified parameters.\cr
#' Feeds the specified parameters to [allelematch::amUnique].\cr
# ' Compares the resulting output files with the expected.
# ' If they are identical, the test passes.
# '
# '
# ' @returns TODO: Change to return TRUE on success and FALSE on failure.
# '
#    Find another @ example test_legacy-2.5.1/TestLegacy-2.5.1.R
#'
#' @export
amUniqueWrapper <- function(amDatasetFocal, ...) {

    # Validate the input parameters:
    argString=auArgToString(...)

    cat("   With params    : \"", argString, "\"\n", sep="")
    startTime <- Sys.time()

    amUniqueResult <- amUnique(amDatasetFocal=amDatasetFocal, ...)

    endTime <- Sys.time()
    cat("\nTestLegacy-2.5.1: Done calling amUnique in ", difftime(endTime, startTime, units = "secs" ), " sec\n", sep="")

    return(amUniqueResult)
}

#' Wrapper around [allelematch::summary.amUnique] that adds logging
#'
#' @description
#' Generates a message string that describes the specified parameters.\cr
#' Feeds the specified parameters to [allelematch::summary.amUnique].\cr
# ' Compares the resulting output files with the expected.
# ' If they are identical, the test passes.
# '
# '
# ' @returns TODO: Change to return TRUE on success and FALSE on failure.
# '
#    Find another @ example test_legacy-2.5.1/TestLegacy-2.5.1.R
#'
#' @export
summary_amUniqueWrapper <- function(amUniqueOutput, outputData=NULL, expectedData, summary=FALSE, overwriteExpected=FALSE) {

    # Validate the input parameters:
#    paramString=auArgToString(...)
#    outputData = validateParams(amDatasetFocal, paramString, expectedData, summary, overwriteExpected)


    cat("\nTestLegacy-2.5.1: About to call summary.amUnique with params", paramString, "\n")
    cat("   outputData     = ", outputData,  "\n")
    cat("   expectedData   = ", expectedData, "\n")

    if (!summary) { # TODO: BREAK OUT OF THIS FUNCTION!
        # Dump as a data/*.R file that is more than 10 times bigger than the analyzed .csv file:
        if (overwriteExpected) { auDumpToData(amUniqueOutput, expectedData) }
        stopifnot(identical(outputData, getdata(expectedData)))
    } else {
        # Generate a much smaller 'summary' file:
        csvFileActual   = strcat("data/", outputData,   ".csv")
        csvFileExpected = strcat("data/", expectedData, ".csv")
        csvBinary = auUnixLineBreaks(csvFileActual) # Use raw mode to write unix LF line breaks rather than windows CRLF
        startTime <- Sys.time()

        summary.amUnique(amUniqueOutput, csv=csvBinary) # csv=csvFile)

        endTime <- Sys.time()
        close(csvBinary)
        cat("\nTestLegacy-2.5.1: Done calling amUnique with params", paramString, "in", difftime(endTime, startTime, units = "secs" ), " sec \n")

        if (overwriteExpected) { file.copy(csvFileActual, csvFileExpected, overwrite = TRUE) }

        # Check that we got the expected output, two ways:
        auAssertCsvIdentical(csvFileActual, csvFileExpected)
        auAssertCsvEqualToExpectedData(csvFileActual)
    }


    if(IS_BRIEF_AMUNIQUE_SUPPORTED_BY_ALLELEMATCH) {
        outputFile = sub(".csv", "_brief.csv", outputFile, fixed=TRUE)
        cat("   outputFile     = ", outputFile,  "\n")
        briefFile = strcat(outputDir, outputFile)
        briefBinary = auUnixLineBreaks(briefFile)
        summary.amUnique(amUniqueOutput, brief=briefBinary)
        close(briefBinary)

        auSortCsvFile(briefFile);
    }
}

