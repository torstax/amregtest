# Deferred TEMP-leak cleanup — runs once after the entire test suite.
#
# This must live in a setup-*.R file, not a helper-*.R file.
# Helper files are sourced during load_all(), before the test session exists,
# so testthat::teardown_env() is not yet initialised at that point.
# Setup files are sourced after the session is ready.
#
# The .art_leaked collector and the test_that wrapper are in helper-temp-leaks.R.

withr::defer(
  {
    if (length(.art_leaked) > 0) {
      # if (!interactive()) graphics.off()
      #
      # is_png <- grepl("\\.png$", .art_leaked, ignore.case = TRUE)
      # keep   <- if (interactive()) .art_leaked[ is_png] else character(0)
      # to_del <- if (interactive()) .art_leaked[!is_png] else .art_leaked

      graphics.off()
      keep    <- toupper(Sys.getenv("ART_KEEP_LEAKED_FILES_IN_TEMP")) == "TRUE"
      to_keep <- if (keep) .art_leaked  else character(0)
      to_del  <- if (keep) character(0) else .art_leaked

      if (length(to_del) > 0) {
        suppressWarnings(file.remove(to_del))
        message(sprintf(
          "Cleaning up %d leaked TEMP file(s):\n  %s",
          length(to_del),
          paste(to_del, collapse = "\n  ")
        ))
      }
      if (length(to_keep) > 0) {
        message(sprintf(
          "Keeping %d file(s) for inspection:\n  %s",
          length(to_keep),
          paste(to_keep, collapse = "\n  ")
        ))
      }
    }
  },
  envir = testthat::teardown_env()
)
