
# Helper for amCluster snapshot tests.
# Used by test-allelematch_4-amCluster-*.R

snapshot_amCluster <- function(ds, ...) {

  amvariant <- get("amvariant", envir = parent.frame())

  # Log the call to the snapshot file:
  argstr <- helpArgToString(...)
  cmdstr <- paste0("amCluster(", ds, ", ", argstr, ")")
  expect_snapshot(cat(cmdstr), variant = amvariant)

  sink(nullfile()) # Prevent allelematch from printing to the console.
  pw <- tryCatch(

    # Make the call to allelematch:
    # Use parent.frame() so get() finds variables defined in the calling test_that block.
    amCluster(amDatasetFocal = get(ds, envir = parent.frame()), ...),

    error = function(e) {
      e_message <- helpModernizeMsgs(e$message) # adapt to allelematch 2.6.0 message changes
      ret <- paste0(
        "\n  Error    : ", e_message,
        "\n  Test     : ", "test-allelematch_4-amCluster",
        "\n  Rejected : ", cmdstr, "\n"
      )
      if (!grepl("no clusters formed.", e_message)) {
        message("\n  ", ret, sep = "")
      }
      ret
    }
  )
  sink()

  expect_snapshot_value(pw, style = "json2", variant = amvariant)
  invisible(pw)
}

# Parameters to loop over:
#   amCluster(amDatasetFocal, runUntilSingletons=TRUE, cutHeight=0.3, missingMethod=2, consensusMethod=1, clusterMethod="complete")
# Regarding clusterMethod: "Only 'complete' acceptable." So we stick with the default.
amCluster_rus  <- c(TRUE, FALSE)          # runUntilSingletons
amCluster_ch   <- c(0.1, 0.3, 0.5, 0.7, 0.9, 0.95, 0.99)  # cutHeight
amCluster_mis  <- c(1, 2)                 # missingMethod
amCluster_cons <- c(1, 2, 3, 4)          # consensusMethod
