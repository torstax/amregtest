# Shadow test_that to detect TEMP directory leaks per test.
#
# testthat helper files are sourced into an environment that all test files
# inherit, so this definition shadows testthat::test_that for every test
# without requiring any changes to individual test files.
#
# For each test it:
#   1. Snapshots tempdir() contents before the test runs.
#   2. Delegates to the real testthat::test_that.
#   3. On exit, records any new files found in tempdir() for deferred cleanup.
#
# After all tests have run, a single cleanup step fires — see setup-temp-leaks.R,
# which registers the deferred action once the test session is initialised.

# Accumulates leaked paths across all tests.
.art_leaked <- character(0)

test_that <- function(desc, code) {
  before <- list.files(tempdir(), recursive = TRUE, full.names = TRUE,
                       all.files = TRUE)

  on.exit({
    after  <- list.files(tempdir(), recursive = TRUE, full.names = TRUE,
                         all.files = TRUE)
    leaked <- setdiff(after, before)
    leaked <- leaked[file.exists(leaked)]   # race-condition guard
    if (length(leaked) > 0) {
      warning(sprintf(
        "\nTEMP LEAK detected in test: '%s'\n  %s",
        desc,
        paste(leaked, collapse = "\n  ")
      ), call. = FALSE)
      # Accumulate for deferred removal — do NOT remove here so that
      # HTML files etc. remain openable in a browser until the suite ends.
      .art_leaked <<- c(.art_leaked, leaked)
    }
  }, add = TRUE)

  # Forward the unevaluated code block to the real test_that.
  # bquote(.(x)) splices the captured expression inline so that
  # testthat::test_that's own substitute() sees the original test code.
  eval(
    bquote(testthat::test_that(.(desc), .(substitute(code)))),
    envir = parent.frame()
  )
}
