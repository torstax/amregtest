######################################
### Helper functions for the tests ###
######################################

# Turns `...` into a string of <name>=<value> pairs
helpArgToString <- function(...) {
  # form the `...` arguments into a string on the form "<name1>=<value1>, <name2>=<value2> ..."
  v = character(...length()) # Reserve space for a vector of strings

  # Paste together <name>=<value> pairs.
  # the <name> comes from `...names()[n]`. The <value> comes from `...elt(n)`
  # for(n in 1:...length()) v[n] = paste(...names()[n], format(...elt(n)), sep="=")
  for(n in 1:...length()) v[n] = paste(...names()[n], deparse(...elt(n)), sep="=")

  # Remove spurious empty pairs from the vector:
  v = v[! v == "=NULL"]

  # Return a string were the pairs are ", " -separated:
  ret = paste(v, collapse=", ")

  return(ret)
}

# Attempts to prepend the supplied file name with a directory
# where the user can find the generated .html files:
helpHtml <- function(file) {
    dir = Sys.getenv("ART_CALLERS_WD")
    if(dir == "") {
        dir = ifelse( grepl("/tests/testthat$", getwd()), "../..", ".") # testthat changes getwd() to tests/testthat/.
        dir = normalizePath(dir, winslash = "/")
    }
    # dir = sub("^(C):", "/\\1", dir, perl=TRUE, fixed=FALSE)
    dir = sub("^C:", "", dir, perl=TRUE, fixed=FALSE)
    if(!dir.exists(dir)) stop("\n    dir = '", dir, "' does not exist!\n    getwd() = '", getwd(), "' ", sep="")
    longfile = paste(dir, "/", file, sep="")
    cat("\n    Writing html to :", longfile)

    return(longfile)
}
