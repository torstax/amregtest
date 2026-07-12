#library(amregtest)
require(amregtest, quietly = TRUE)

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
amvariant <- ifelse(amversion < "2.6.0", "2.5", "2.6") # Hopefully no more variants. TODO: Rethink.


# NOTE that the output of [sort] is platform dependent.
# You get different results based on the locale. And [allelematch] uses [sort].
#
# The sort order also depends on the size of the data to be sorted.
# See the description of "radix" under [sort].
#
# [testthat] (and R CMD check) makes sure that the tests behave the same way
# on every platform, by setting the collation locale to "C" and the language to "en".
# See issue "locale / collation used in testthat #1181"
#  at https://github.com/r-lib/testthat/issues/1181#issuecomment-692851342

