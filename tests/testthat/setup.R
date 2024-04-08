#library(amregtest)
require(amregtest, quietly = TRUE)

# See https://stackoverflow.com/questions/74379129/r-using-arguments-passed-to-for-named-arguments-when-arguments-are-subst
options(warnPartialMatchArgs=TRUE)

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

