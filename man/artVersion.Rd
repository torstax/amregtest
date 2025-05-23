% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/art_api.R
\name{artVersion}
\alias{artVersion}
\title{Returns package version}
\usage{
artVersion(verbose = TRUE)
}
\arguments{
\item{verbose}{logical. If TRUE (the default), prints additional info to stdout, including version of \link{allelematch-package}}
}
\value{
The installed version of this package (\link{amregtest-package}) in a character vector of length one
}
\description{
Returns version of this package (\link{amregtest}).\cr
\cr
The version is specified in the file DESCRIPTION, tag "Version: ".
}
\examples{
# See what version of packages 'allelematch' and 'amregtest'
# are currently installed:
artVersion()

# List the available tests:
artList()
\donttest{
# Run all the tests:
# artRun()  # Takes several minutes

# Run the first of the available tests:
artRun(filter="allelematch_1-amDataset$")
}


}
\seealso{
\link{artList}, \link{artRun} and \link{amregtest}
}
