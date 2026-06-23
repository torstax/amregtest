## R CMD check results

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

This is a resubmission of amregtest, version 1.0.6, addressing the CRAN check
NOTE on reported on 2026-06-10.

### Reason for release

This release has been done to handle the following problem 
detected by CRAN on 2026-06-10 and 
reported by Kurt.Hornik@wu.ac.at on 10/06/2026 13:40.

From https://cran.r-project.org/web/checks/check_results_amregtest.html :

Check Details
Version: 1.0.5
Check: for detritus in the temp directory
Result: NOTE 
  Found the following files/directories:
    ‘Rtmp7TCwOh\amCluster_JEMY985S.htm’
    ‘Rtmp7TCwOh\amPairwise_YV69OSJF.htm’
    ‘Rtmp7TCwOh\amUnique_BZ8WHMYN.htm’
Flavor: r-devel-linux-x86_64-fedora-clang

Version: 1.0.5
Check: for detritus in the temp directory
Result: NOTE 
  Found the following files/directories:
    ‘RtmpqsSyFX\amCluster_NC034US9.htm’
    ‘RtmpqsSyFX\amPairwise_NA0OV69X.htm’
    ‘RtmpqsSyFX\amUnique_WKVSDZ1U.htm’
Flavor: r-devel-linux-x86_64-fedora-gcc


### New in this release

amregtest has fixed the problem by adding functionality to detect and report detritus files 
that are leaked to TEMP during a test. 

The leaked .htm files were written by package allelematch during testing and are now 
cleaned up after the full test suite completes.

/Kind regards,
torvald.staxler@telia.com

