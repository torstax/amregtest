


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

