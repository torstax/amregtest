# A plain-text, one-line-per-file testthat reporter.
# Prints a header and one line per test file with columns:
# FAILED, WARNINGS, SKIPPED, OK, FILE.
# No spinner, no ANSI sequences -- suitable for knitr / non-interactive output.
#
#' @noRd
ColumnReporter <- R6::R6Class("ColumnReporter",
  inherit = testthat::Reporter,
  public = list(

    # Per-file state
    .file_name = "",
    .n_fail    = 0L,
    .n_warn    = 0L,
    .n_skip    = 0L,
    .n_ok      = 0L,

    # Overall totals (for end_reporter summary)
    .total_fail = 0L,
    .total_warn = 0L,
    .total_skip = 0L,
    .total_ok   = 0L,

    start_reporter = function() {
      cat(sprintf("%-6s  %-8s  %-7s  %-6s  %s\n",
                  "FAILED", "WARNINGS", "SKIPPED", "OK", "FILE"))
      cat(strrep("-", 72), "\n")
    },

    start_file = function(filename) {
      self$.file_name <- filename
      self$.n_fail    <- 0L
      self$.n_warn    <- 0L
      self$.n_skip    <- 0L
      self$.n_ok      <- 0L
    },

    add_result = function(context, test, result) {
      if (inherits(result, c("expectation_failure", "expectation_error"))) {
        self$.n_fail <- self$.n_fail + 1L
      } else if (inherits(result, "expectation_warning")) {
        self$.n_warn <- self$.n_warn + 1L
      } else if (inherits(result, "expectation_skip")) {
        self$.n_skip <- self$.n_skip + 1L
      } else {
        self$.n_ok <- self$.n_ok + 1L
      }
    },

    end_file = function() {
      cat(sprintf("%-6d  %-8d  %-7d  %-6d  %s\n",
                  self$.n_fail, self$.n_warn, self$.n_skip, self$.n_ok,
                  self$.file_name))

      self$.total_fail <- self$.total_fail + self$.n_fail
      self$.total_warn <- self$.total_warn + self$.n_warn
      self$.total_skip <- self$.total_skip + self$.n_skip
      self$.total_ok   <- self$.total_ok   + self$.n_ok
    },

    end_reporter = function() {
      cat(strrep("-", 72), "\n")
      cat(sprintf("%-6d  %-8d  %-7d  %-6d  %s\n",
                  self$.total_fail, self$.total_warn, self$.total_skip,
                  self$.total_ok, "TOTAL"))
    }
  )
)
