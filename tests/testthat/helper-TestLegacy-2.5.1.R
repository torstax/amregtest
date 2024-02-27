####################################
### Setup for scripted execution ###
####################################

#' Validates the output file naming convention we use for GG tests
#'
#' @param actualCsv     The actual summary is written to a .csv file
#' @param expectedData  The expected summary is loaded from the package data
ggAssertSummaryNamesAlligned <- function(actualCsv, expectedData) {
    cat("\n")
    cat("   actualCsv      =", actualCsv, "\n")
    cat("   expectedData   =", expectedData, "\n")

    stopifnot(isTRUE(grepl("_expected$", expectedData)))
    basename = sub("_expected", "", expectedData)
    allignedActual = paste("/", basename, "_actual.csv", sep="")
    if(!isTRUE(grepl(allignedActual, actualCsv))) {
        stop("Actual and Expected names are not alligned",
             "\n    actualCsv      =", actualCsv,
             "\n    allignedActual =", allignedActual,
             "\n    expectedData   =", expectedData)
    }
}

