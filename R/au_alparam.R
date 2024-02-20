

###############################################################################
### Based on input parameters for allelematch, construct
### log messages and unique output file names:
###############################################################################

#' Turns `...` into a string of <name>=<value> pairs
#'
#' The <name>=<value> pairs are separated by ", ".\cr\cr
#'
#' For use when logging the input to a function that takes `...` parameters.
#'
#' @param ...
#'
#' @return a string of <name>=<value> pairs
#' @export
#'
# ' @examples
amUniqueParamString <- function(...) {
    # form the `...` arguments into a string on the form "<name1>=<value1>, <name2>=<value2> ..."
    v = character(...length()) # Reserve space for a vector of strings

    # Paste together <name>=<value> pairs.
    # the <name> comes from `...names()[n]`. The <value> comes from `...elt(n)`
    for(n in 1:...length()) v[n] = paste(...names()[n], format(...elt(n)), sep="=")

    # Remove spurious empty pairs from the vector:
    v = v[! v == "=NULL"]

    # Return a string were the pairs are ", " -separated:
    # paste0(v, collapse=", ")
    paste0(v, collapse=", ")
}


#' Turns [amUniqueParamString] into a string that can be used in a filename
#'
#' @param ...
#'
#' @return a string that can be used in a data filename for use in an allelematch regressiontest.
#' @export
#'
# ' @examples
auDefaultFileName <- function(...) {

    s = amUniqueParamString(...)

    # Screen out default values parameters:
    s = sub("multilocusMap=NULL, ",   "", s)
    s = sub("alleleMismatch=NULL, ",  "", s)
    s = sub("matchThreshold=NULL, ",  "", s)
    s = sub("cutHeight=NULL, ",       "", s)
    s = sub("doPsib=missing, ",       "", s)
    s = sub("consensusMethod=1, ",    "", s)
    #s = sub("maxMissing=NULL, ",          "", s) # New param added by Torvald


    # Abbreviate the parameter names for use in output file names, GG style:
    s = sub("multilocusMap=",    "_multiloc", s)
    s = sub("alleleMismatch=",   "_aMm", s)
    s = sub("matchThreshold=",   "_mThr", s)
    s = sub("cutHeight=",        "_cHgt", s)
    s = sub("maxMissing=",       "_maxM", s)  # New param added by Torvald
    s = sub("doPsib=",           "_psib-", s)
    s = sub("consensusMethod=",  "_cnss", s)
    s = sub("verbose=TRUE",      "", s)         # Drop altogether
    s = sub("verbose=FALSE",     "", s)         # Drop altogether
    #s = gsub(", ",               "", s)         # Remove remaining empty ", "
    return(s)
}
