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

    # On non-Windows, allelematch's amHTML.* functions build paths with a
    # Windows-style "\" separator, e.g. paste(tempdir(), "\\", "amXXX.htm").
    # Unix path parsing splits only on "/", so the file lands in
    # dirname(tempdir()) with a name like "RtmpXXX\amXXX.htm" — one level
    # above tempdir() and invisible to the scan above.  Catch those here.
    if (.Platform$OS.type != "windows") {
      escaped_htm <- list.files(
        dirname(tempdir()),
        pattern = paste0("^", basename(tempdir()), "\\\\am.*\\.htm$"),
        full.names = TRUE
      )
      leaked <- c(leaked, escaped_htm)
    }
    leaked <- leaked[file.exists(leaked)]   # race-condition guard
    keep_files <- toupper(Sys.getenv("ART_KEEP_LEAKED_FILES_IN_TEMP")) == "TRUE"
    verbose    <- toupper(Sys.getenv("ART_VERBOSE")) == "TRUE"

    if (length(leaked) > 0) {
      if (!keep_files) {
        if (verbose)
          message(sprintf(
            "Cleaning up %d leaked TEMP file(s):\n  %s",
            length(leaked),
            paste(leaked, collapse = "\n  ")
          ))
        graphics.off()
        suppressWarnings(file.remove(leaked))
      } else { # Keep files for inspection:
        # Accumulate for deferred removal — do NOT remove here so that
        # HTML files etc. remain openable in a browser until the suite ends.
        .art_leaked <<- c(.art_leaked, leaked)  # Accumulate for deferred removal

        if (verbose)
          message(sprintf(
            "Keeping %d leaked TEMP file(s) for inspection:\n  %s",
            length(leaked),
            paste(leaked, collapse = "\n  ")
          ))
      }
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
