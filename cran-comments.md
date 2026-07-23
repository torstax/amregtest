## R CMD check results

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

This is a new delivery 1.3.0 of amregtest that adapts to the comming 3.0.0 delivery 
of allelematch that introduces more backwards incompatibilities
that will not pass the tests of this version of amregtest.

### Problem - Backwards incompatibilities in allelematch 3.0.0


**Symptom:** Changes in testthat snapshot files.


**Root cause:** 

Backwards incompatibilities caused snapshot differences.

 1) Unintentional incompatibilities in 2.6.X now fixed in allelematch 3.0.0.
 
 2) Intentional corrections, improvements and updates in used packages
    in 3.0.0 of allelematchg causes incompatibilities in snapshot files
    towards both 2.5.X versioins and 2.6.Y versions of allelematch.


**Fix:** .
 a) Snapshot variants have been added to temporarily recognize both the old 2.5.X, 2.6.Y 
    and the new 3.0.Z variants of output data from allelematch.
    
 b) A new function 'artInstallCranAllelematch(version = "2.5.5")' has been 
    introduced to facilitate testing of more than one version of allelamatch.

/Kind regards,
torvald.staxler@telia.com
