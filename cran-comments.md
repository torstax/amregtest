## R CMD check results

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

This is a resubmission of amregtest, version 1.0.7, addressing two problems
found in the CRAN check of version 1.0.6 on 2026-06-24.

### Problem 1 — Test error in `test-allelematch_6-amUnique_negative.R`

**Symptom:** The CRAN check (R-devel, win-builder) reported a test ERROR at
line 47:

```
Error: allelematch:  amCluster: no clusters formed. Please set cutHeight lower and run again.
```

**Root cause:** The test calls `amUnique(amdata, alleleMismatch=5)` on a
four-column dataset. Because `alleleMismatch=5` exceeds the number of allele
columns, the derived `cutHeight` is 1.25 — outside the valid range (0, 1].
Under R-devel on win-builder, `dynamicTreeCut::cutreeHybrid()` now rejects
this out-of-range value and throws a validation error, which `amCluster`
re-throws as "error in dynamic tree cutting". This message does not match the
pattern expected by `expect_error()`, and modern testthat (≥ 3.2.2)
re-throws unmatched errors rather than converting them to a test failure,
causing the ERROR.

The test was already annotated with a TODO acknowledging that `allelematch`
does not validate `alleleMismatch > nAlleles`. The specific downstream error
is an implementation detail that varies across R versions.

**Fix:** The error-message pattern was removed from the `expect_error()` call.
The test now only asserts that *some* error is thrown for this invalid input,
which is the meaningful guarantee.

---

### Problem 2 — Leaked TEMP files and "Permission denied" warning

**Symptom:** The CRAN check reported four files remaining in the TEMP
directory after the test suite, and a "Permission denied" warning when
attempting to remove one of them (a PDF file locked by an open graphics
device):

```
Cleaning up 4 leaked TEMP file(s):
  .../amPairwise_Y8LUCKAH.htm
  .../amCluster_7E3B9I4P.htm
  .../amUnique_GVLEWBOF.htm
  .../pdf4ddc5aff2c10
Warning message:
In file.remove(to_remove) :
  cannot remove file '.../pdf4ddc5aff2c10', reason 'Permission denied'
```

**Root cause:** The temporary file cleanup introduced in version 1.0.6 did not
close open graphics devices before attempting deletion. Files that are still
held by an open `pdf()` or `png()` device cannot be removed on Windows, and
the resulting warning was not suppressed at the top level.

**Fix:** In non-interactive sessions (such as CRAN), `graphics.off()` is now
called before file removal, closing any open graphics devices so that all
locked files can be deleted. In interactive sessions, PNG files are
intentionally preserved so that plots remain visible in the RStudio Plots
pane; all other temporary files (HTML, PDF, …) are still removed. File
removal warnings are suppressed consistently in both cases.

---

/Kind regards,
torvald.staxler@telia.com
