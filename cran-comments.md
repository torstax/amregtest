## R CMD check results

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

This is a new delivery 1.2.0 of amregtest that adapts to the actual 2.6.0 delivery 
of allelematch that introduced more backwards incompatibilities
that will not pass the tests of amregtest 1.1.0.

### Problem - Backwards incompatibilities in allelematch 2.6.0


**Symptom:** 17 tests out of 2852 failed


**Root cause:** 

Backwards incompatibilities caused snapshot errors.

 1) More white space changes and some changes in messages from allelematch.
 
 2) Phrasing of some messages from allelematch.

 3) Some changes to output data also caused testthat snapshot errors.


**Fix:** .
 1) White space sequences in messages are now compressed to single spaces 
    before checking against the expected value.
 
 2) Modified messages from allelematch are now converted from the old to the new 
    phrasing before checking against the expected value.

 3) Snapshot variants are used to temporarily recognize both the old 2.5.X variant 
    and the new 2.6.0 variant of output data.

/Kind regards,
torvald.staxler@telia.com
