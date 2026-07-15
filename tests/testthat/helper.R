######################################
### Helper functions for the tests ###
######################################
library(allelematch)

# Load the amregtest version of example data sets from this package
# into the global environment. Needs to match the tests:
data("amExample1", package = "amregtest", envir = .GlobalEnv)
data("amExample2", package = "amregtest", envir = .GlobalEnv)
data("amExample3", package = "amregtest", envir = .GlobalEnv)
data("amExample4", package = "amregtest", envir = .GlobalEnv)
data("amExample5", package = "amregtest", envir = .GlobalEnv)

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

helpModernizeMsgs <- function(msgs) {
  # Adapt cosmetic change in 2.6.0 in error messages
  # from older versions of allelematch to the new format.
  msgs <- gsub(":  ", ": ", msgs, fixed = TRUE) # Change double spaces after ":" to single space.
  msgs <- gsub(
    "no clusters formed\\.\\h+Please set cutHeight lower and run again\\.", # 2.5 style
    "no clusters formed.", # 2.6 style
    msgs, perl = TRUE
  )
  msgs <- gsub("\\h$", "",  msgs, perl = TRUE)  # Remove white space from end of line.
  return(msgs)
}

# snapshot_amPairwise()
#
# Note that the amDataset parameters are passed as variable names rather than
# by value. The variables are assumed to be available in the calling function,
# i.e. in the envir = parent.frame().
#
# We want to run amPairwise many times with many combinations of parameters
# and we want to compare the results with previous runs. Like this:
snapshot_amPairwise <- function(ds1, ds2=ds1, ...) {

  # Log the call to the snapshot file:
  argstr = helpArgToString(...)
  cmdstr = paste("amPairwise(", ds1, ", ", ds2, ", ", argstr, ")", sep="") ; expect_snapshot(cat(cmdstr))

  amds1 = get(ds1, envir = parent.frame()) ; stopifnot(inherits(amds1, "amDataset"))
  amds2 = get(ds2, envir = parent.frame()) ; stopifnot(inherits(amds1, "amDataset"))

  # Make the call:
  pw <- amPairwise(amDatasetFocal=amds1, amDatasetComparison =amds2, ...)

  # Log the result to the snapshot file:
  expect_snapshot(summary.amPairwise(pw)) # Too big. :-(
  # expect_snapshot_value(pw, style = "json2")

  return(pw)
}



# We want to run amUnique many times with many combinations of parameters,
# and we want to compare the results with previous runs. Like this:
snapshot_amUnique <- function(ds, ...) {

  # Log the call to the snapshot file:
  argstr = helpArgToString(...)
  cmdstr = paste("amUnique(", ds, ", ", argstr, ")", sep="") ; expect_snapshot(cat(cmdstr))

  # Capture any errors reported by allelematch:
  sink(nullfile()) # Block output from 'cat' within allelematch
  ret <- tryCatch(

    # Make the call to allelematch:
    amUnique(amDatasetFocal=get(ds, envir = parent.frame()), ...),

    ## If the call fails, return the error message and
    ## the method and arguments that threw the error:
    error = function(e) {
      ret = c(paste("\n  Error    : ", e$message, "\n  Rejected : ", cmdstr, "\n"))

      # Differ between expected and unexpected errors:
      if (!grepl("no clusters formed.  Please set cutHeight lower and run again|'x' must be atomic", e$message, perl=TRUE)) {
        # Some unexpected error happened. Print it to the screen for easier debugging.
        message("\n  ", ret, sep="")

      }

      ret # Return this message from 'tryCatch'
    }
  )
  sink() # Block output from 'cat' within allelematch


  # Log the result to the snapshot file:
  # expect_snapshot_value(ret, style = "json2") # Neither "json2" nor "deparse" works. :-(
  if (class(ret) == "amUnique") {
    expect_snapshot(amCSV.amUnique(ret, csvFile=stdout(), uniqueOnly=FALSE))
  } else {
    expect_snapshot(cat("\n  No amUnique object generated:", ret))
  }

  return(ret)
}


expect_summary <- function(x, includes, prefilter = "") {
  expect_match(capture_output_lines(summary(x)) |> grep(prefilter, x=_, value = TRUE), includes, fixed = TRUE)
}
