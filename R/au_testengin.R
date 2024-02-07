###############################################################################
### allelematch test engine ###
###############################################################################

#' Makes sure further testing uses `wantedVersion` of package allelematch
#'
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


#' Runs a set of tests on the supplied dataset
#'
#' `testDataSet` reads allelematch test input files from and writes output files
#' to the `dataSetDir`.
#'
#' @details
#' `testDataSet` is the entry point for the `regressiontest` package.
#'
#' Both input and output data files in `dataSetDir` have predefined names.
#'
#' The input files are called "input_new_samples.txt" and "input_Match_references.txt".
#' The input files are read into data frames at the start of `testDataSet`.
#' The same input data is used in all calls to the `allelematch` functions
#' to be tested.
#'
#' The output files have names that describe the called `allelematch` functions
#' and the parameters that are passed to the same functions.
#'
#' @param dataSetDir The directory that contains the data sets to be tested. (string)
#'
#' @param skippCleaningInput If FALSE, the input files are cleaned up
#' and written to a new file that adds "_clean" to the name of the original files.
#' If TRUE, this function skips reading the original files and read the cleaned
#' files directly instead. (boolean)
#'
#' @returns TODO: Change to return TRUE on success and FALSE on failure.
#'
#    Find another @ example test_legacy-2.5.1/TestLegacy-2.5.1.R
#'
#' @export
testDataSet <- function(dataSetDir = "data/", skippCleaningInput = FALSE) {

    cat("\nTesting allelematch ", toString(packageVersion("allelematch")))

    if (!skippCleaningInput) {
        auCleanInputFiles(dataSetDir)
    } else {
        # Use previously cleaned input files
    }

    # Create an amDataset from the input files:
    dataDirectory = strcat("", dataSetDir)
    inputDataSet <- auReadInput(dataSetDir, "input_new_samples.txt", "input_Match_references.txt")
    readr::problems(inputDataSet)

    # Run the tests of interest on the created amDataset:
    analyzeMatchThreshold(inputDataSet, dataDirectory)
    analyzeAleleMismatch( inputDataSet, dataDirectory)

    readr::problems()
    warnings()
}


analyzeUnique <- function(amDatasetFocal, multilocusMap=NULL, alleleMismatch=NULL, matchThreshold=NULL, cutHeight=NULL, maxMissing=NULL, doPsib="missing", outputDir, outputFile=NULL) {
    # amDatasetFocal, multilocusMap=NULL, alleleMismatch=NULL, matchThreshold=NULL, cutHeight=NULL, maxMissing=NULL, doPsib="missing"

    if(is.null(outputFile)) { outputFile=auDefaultFileName(alleleMismatch=alleleMismatch, matchThreshold=matchThreshold, cutHeight=cutHeight, maxMissing=maxMissing, doPsib=doPsib)}
    paramString=amUniqueParamString(alleleMismatch=alleleMismatch, matchThreshold=matchThreshold, cutHeight=cutHeight, maxMissing=maxMissing, doPsib=doPsib)

    cat("\nTestLegacy-2.5.1: About to call amUnique with params", paramString, "\n")
    #  B2_allelmatch_uniqueAnalysis <- amUnique(amDatasetFocal=amDatasetFocal, multilocusMap=multilocusMap, alleleMismatch=alleleMismatch, matchThreshold=matchThreshold, cutHeight=cutHeight, maxMissing=maxMissing, doPsib=doPsib, verbose=TRUE)
    startTime <- Sys.time()
    B2_allelmatch_uniqueAnalysis <- amUnique(amDatasetFocal=amDatasetFocal, multilocusMap=multilocusMap, alleleMismatch=alleleMismatch, matchThreshold=matchThreshold, cutHeight=cutHeight,         doPsib=doPsib, verbose=TRUE)
    endTime <- Sys.time()

    cat("\nTestLegacy-2.5.1: Done calling amUnique with params", paramString, "in", difftime(endTime, startTime, units = "secs" ), " sec \n")
    cat("   outputDir      = ", outputDir, "\n")
    cat("   outputFile     = ", outputFile,  "\n")
    csvFile = strcat(outputDir, outputFile)
    csvBinary = auTextOutFile(csvFile) # Use raw mode to write unix LF line breaks rather than windows CRLF
    summary.amUnique(B2_allelmatch_uniqueAnalysis, csv=csvBinary) # csv=csvFile)
    close(csvBinary)

    # Make it easier to verify that the output is still good:
    auSortCsvFile(      csvFile )
    auMakeBriefCsvFile( csvFile )
    auAssertExpected(   csvFile )

    if(IS_BRIEF_AMUNIQUE_SUPPORTED_BY_ALLELEMATCH) {
        outputFile = sub(".csv", "_brief.csv", outputFile, fixed=TRUE)
        cat("   outputFile     = ", outputFile,  "\n")
        briefFile = strcat(outputDir, outputFile)
        briefBinary = auTextOutFile(briefFile)
        summary.amUnique(B2_allelmatch_uniqueAnalysis, brief=briefBinary)
        close(briefBinary)

        auSortCsvFile(briefFile);
    }
}

analyzeMatchThreshold <- function(inputDataSet, dataDirectory, matchThreshold=0.9, maxMissing=10, outputFile=NULL) {
    analyzeUnique(inputDataSet, matchThreshold=matchThreshold, maxMissing=NULL, outputDir=dataDirectory, outputFile=outputFile)
    readr::problems()
}

analyzeAleleMismatch <- function(inputDataSet, dataDirectory, alleleMismatch=15, maxMissing=10, outputFile=NULL) {
    analyzeUnique(inputDataSet, alleleMismatch=alleleMismatch, maxMissing=NULL, outputDir=dataDirectory, outputFile=outputFile)
    readr::problems()
}

