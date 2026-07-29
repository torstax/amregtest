## R CMD check results

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

This is a new delivery 1.3.1 of amregtest that adapts to the intentional
compatibility step in the 3.0.0 delivery of allelematch.

### Problem - Backwards incompatibilities in allelematch 3.0.0

**Symptom:** Changes in testthat snapshot files.


**Root cause:** 

Backwards incompatibilities caused snapshot differences.

 1) Unintentional incompatibilities in 2.6.X now fixed in allelematch 3.0.0.
 
 2) Intentional corrections, and improvements in 3.0.0 of allelematch has caused 
    incompatibilities in snapshot files towards both 2.5.X versions and 2.6.Y 
    versions of allelematch.


**Fix:** .
 a) Snapshot variants have been added to temporarily recognize both the old 2.5.X, 2.6.Y 
    and the new 3.0.Z variants of output data from allelematch.
    
 b) A new function 'artInstallCranAllelematch(version = "3.0.0")' has been 
    introduced to facilitate testing of more than one version of allelematch.

/Kind regards,
torvald.staxler@telia.com
