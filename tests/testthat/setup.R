##############################################################################
### Setup of data, environment and infrastructure for the tests.
###
### Sourced once, right after helper.R is sourced, before any test files are run.
##############################################################################

#
#
# See https://stackoverflow.com/questions/74379129/r-using-arguments-passed-to-for-named-arguments-when-arguments-are-subst
options(warnPartialMatchArgs=TRUE)

# 2.6.0 of allelematch introduced some cosmetic changes
# in the output to the console
# This impacted a lot of snapshot tests.
# We therefore use the first two numbers in the version of allelematch
# as a variant in the snapshot tests that were impacted by the cosmetic changes.
# There were also some severe backwards incompatibilities revealed by some tests.
# These tests will be given the variant "2.6.0.bad" locally at the top of the test file
# to indicate that they are known to fail with allelematch 2.6.0.
amversion <- packageVersion("allelematch")   # e.g. "2.5.5" or "2.6.0"
amvariant <- as.character(amversion[1, 1:2]) # e.g. "2.5" or "2.6" : TODO: Rethink.
# amvariant <- ifelse(amversion < "2.6.0", "2.5", "2.6") # Hopefully no more variants. TODO: Rethink.
# amvariant <- if(amversion < "2.6.0") "2.5" else if (amversion == "2.6.0") "2.6.0" else "2.6"
# amvariant <- ifelse(amversion == "2.6.0", "2.6.0", amvariant) # Hopefully no more variants. TODO: Rethink.

# 2.6.0 was a highly backwards- and forwards-incompatible version of allelematch.
# We therefore keep the snapshot files for 2.6.0 separate.
# Hopefully future versions will be more compatible between patch
# versions, i.e. those that step the third number in the version.
if (amversion == "2.6.0") { amvariant <- "bad-2.6.0" }


# Load the amregtest version of example data sets into a locked, read-only
# environment `ro`. Tests reference ro$amExample1 etc., or take a local copy.
# Locking prevents any bare data("amExampleN") call in a test from silently
# overwriting the shared data with the allelematch version.
ro <- new.env(parent = emptyenv())
data("amExample1", package = "amregtest", envir = ro)
data("amExample2", package = "amregtest", envir = ro)
data("amExample3", package = "amregtest", envir = ro)
data("amExample4", package = "amregtest", envir = ro)
data("amExample5", package = "amregtest", envir = ro)
#data("ggSample",  package = "amregtest", envir = ro) # Only load this if you need it. It is a very large data set.
lockEnvironment(ro, bindings = TRUE)


# TODO: NOTE that the output of [sort] is platform dependent.
# You get different results based on the locale. And [allelematch] uses [sort].
#
# The sort order also depends on the size of the data to be sorted.
# See the description of "radix" under [sort].
#
# [testthat] (and R CMD check) makes sure that the tests behave the same way
# on every platform, by setting the collation locale to "C" and the language to "en".
# See issue "locale / collation used in testthat #1181"
#  at https://github.com/r-lib/testthat/issues/1181#issuecomment-692851342

