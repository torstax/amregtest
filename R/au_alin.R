
#' Loads an loggs the [allelematch::amDataset]
#'
#' @param dataName  Name of the data set to load from ./data/.
#'
#' @export
#' @keywords internal
artLoadDataSet <- function(dataName) {
    # e <- new.env()
    # data(dataName, envir = e)
    # Input = e[[dataName]]

    Input = getdata(dataName)

    # data("ggSample")
    # Input = ggSample

    cat("\nDone loading Input:\n")
    cat("   dataName                  = ", dataName, "\n")
    cat("   Loaded samples to compare = ", "cols =", ncol(Input), "rows =", nrow(Input),"\n")

    return(amDataset(Input, indexColumn=1, missingCode="-99"))
}
