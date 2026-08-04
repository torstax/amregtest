## R CMD check results

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

This is a new delivery 1.3.2 of amregtest that fixes an issue in the documentation 
of function 'artInstallCranAllelematch'.

# amregtest 1.3.2

## Problem - Examples in documentation took too long to execute in the CRAN tests

**Symptom:** Execution of documentation example code timed out in CRAN tests.

**Root cause:** The example code in the documentation of 'artInstallCranAllelematch' 
should not have been executed been executed.

**Solution:** Prevent the example code in the documentation of 'artInstallCranAllelematch'
from executing by including it in '\donttest{...}'.

