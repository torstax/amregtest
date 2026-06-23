# Shadow test_that to detect TEMP directory leaks per test.
#
# testthat helper files are sourced into an environment that all test files
# inherit, so this definition shadows testthat::test_that for every test
# without requiring any changes to individual test files.
#
# For each test it:
#   1. Snapshots tempdir() contents before the test runs.
#   2. Delegates to the real testthat::test_that.
#   3. On exit, reports any new files but does NOT remove them yet,
#      so that HTML files etc. remain openable in a browser during the run.
#
# All leaked files are removed in one pass after the full suite finishes,
# via withr::defer() on testthat::teardown_env() — when available.
# (devtools::test() initialises teardown_env() after helpers are sourced,
# so deferred cleanup is skipped in that workflow; temp files are left for
# the OS to clean up at session end.)

# Accumulate leaked paths across all tests.
.leak_log <- new.env(parent = emptyenv())
.leak_log$files <- character(0)

# Schedule cleanup for after the full suite.
# teardown_env() is only available when running via testthat::test_package()
# (i.e. artRun()). devtools::test() uses test_local() and initialises
# teardown_env() after helpers are sourced, so we degrade gracefully: if
# teardown_env() is not ready yet, skip the deferred cleanup (temp files will
# be removed when the R session ends).
tryCatch(
  withr::defer(
    {
      to_remove <- .leak_log$files[file.exists(.leak_log$files)]
      if (length(to_remove) > 0) {
        message(sprintf("\nCleaning up %d leaked TEMP file(s):\n  %s",
                        length(to_remove),
                        paste(to_remove, collapse = "\n  ")))
        try(file.remove(to_remove), silent = TRUE)
      }
    },
    envir = testthat::teardown_env()
  ),
  error = function(e) NULL
)

test_that <- function(desc, code) {
  before <- list.files(tempdir(), recursive = TRUE, full.names = TRUE,
                       all.files = TRUE)

  on.exit({
    after  <- list.files(tempdir(), recursive = TRUE, full.names = TRUE,
                         all.files = TRUE)
    leaked <- setdiff(after, before)
    leaked <- leaked[file.exists(leaked)]   # race-condition guard
    # PNG files are graphics-device artefacts (open png() device writing to
    # a temp file). They only appear in interactive/RStudio sessions, not
    # during R CMD check on CRAN, and we intentionally leave devices open
    # so plots remain inspectable after the test.
    leaked <- leaked[!grepl("\\.png$", leaked, ignore.case = TRUE)]

    if (length(leaked) > 0) {
      warning(sprintf(
        "\nTEMP LEAK detected in test: '%s'\n  %s",
        desc,
        paste(leaked, collapse = "\n  ")
      ), call. = FALSE)
      # Accumulate for deferred removal — do NOT remove here so that
      # HTML files etc. remain openable in a browser until the suite ends.
      .leak_log$files <- c(.leak_log$files, leaked)
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
