
# amregtest

<!-- badges: start -->

<!-- badges: end -->

“`amregtest`” stands for “`allelematch` regression test”.
[`allelematch`](https://cran.r-project.org/package=allelematch) is an R
package for identifying and removing duplicate multilocus genotypes from
microsatellite data sets. `amregtest` verifies that `allelematch`
remains backwards compatible across versions.

By decoupling the regression test suite from the main `allelematch`
source code and its specific `testthat` dependencies, `amregtest` allows
you to run regression tests against *any* version of `allelematch`
without modifying the package under test.

## Installation

You can install the development version of `amregtest` from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("torstax/amregtest")
```

## Usage

``` r
library(allelematch)
library(amregtest)
```

Run the full regression test suite against your currently installed
version of `allelematch` (takes a few minutes):

``` r
artRun()
```

    ##     About to test installed version of allelematch:  <<<2.5.5>>>
    ## FAILED  WARNINGS  SKIPPED  OK      FILE
    ## ------------------------------------------------------------------------ 
    ## 0       0         0        74      test-allelematch_1-amDataset.R
    ## 0       0         0        10      test-allelematch_1-amDataset_negative.R
    ## 0       0         0        30      test-allelematch_2-amMatrix.R
    ## 0       0         0        20      test-allelematch_2-amMatrix_negative.R
    ## 0       0         0        362     test-allelematch_3-amPairwise.R
    ## 0       0         0        39      test-allelematch_3-amPairwise_negative.R
    ## 0       1         0        19      test-allelematch_3-amPairwise_print.R
    ## 0       0         0        1344    test-allelematch_4-amCluster.R
    ## 0       1         0        19      test-allelematch_4-amCluster_print.R
    ## 0       0         0        22      test-allelematch_5-amAlleleFreq.R
    ## 0       0         0        768     test-allelematch_6-amUnique.R
    ## 0       0         0        42      test-allelematch_6-amUnique_negative.R
    ## 0       1         0        21      test-allelematch_6-amUnique_print.R
    ## 0       0         0        13      test-allelematch_7-amUniqueProfile.R
    ## 0       0         0        16      test-amExample1.R
    ## 0       0         0        14      test-amExample2.R
    ## 0       0         0        14      test-amExample3.R
    ## 0       0         0        14      test-amExample4.R
    ## 0       0         0        4       test-art_api.R
    ## 0       0         0        8       test-ggData.R
    ## ------------------------------------------------------------------------ 
    ## 0       3         0        2853    TOTAL
    ##     Done testing installed version of allelematch:  <<<2.5.5>>>

To run only tests whose names match a Perl regular expression:

``` r
artRun(filter = "amExample2|amExample4")
```

    ##     About to test installed version of allelematch:  <<<2.5.5>>>
    ## FAILED  WARNINGS  SKIPPED  OK      FILE
    ## ------------------------------------------------------------------------ 
    ## 0       0         1        7       test-amExample2.R
    ## 0       0         1        9       test-amExample4.R
    ## ------------------------------------------------------------------------ 
    ## 0       0         2        16      TOTAL
    ##     Done testing installed version of allelematch:  <<<2.5.5>>>

List all available tests without running them:

``` r
artList()
```

    ## 
    ## Tests in files under "C:/Users/Torva/AppData/Local/Temp/RtmpEf1k0b/temp_libpath53f819d62beb/amregtest/tests/testthat/":
    ## 
    ## Tests by functions in allelematch:
    ##  [1] "allelematch_1-amDataset"          
    ##  [2] "allelematch_1-amDataset_negative" 
    ##  [3] "allelematch_2-amMatrix"           
    ##  [4] "allelematch_2-amMatrix_negative"  
    ##  [5] "allelematch_3-amPairwise"         
    ##  [6] "allelematch_3-amPairwise_negative"
    ##  [7] "allelematch_3-amPairwise_print"   
    ##  [8] "allelematch_4-amCluster"          
    ##  [9] "allelematch_4-amCluster_print"    
    ## [10] "allelematch_5-amAlleleFreq"       
    ## [11] "allelematch_6-amUnique"           
    ## [12] "allelematch_6-amUnique_negative"  
    ## [13] "allelematch_6-amUnique_print"     
    ## [14] "allelematch_7-amUniqueProfile"    
    ## 
    ## Reproduction of the examples in 'allelematchSuppDoc.pdf':
    ## [1] "amExample1" "amExample2" "amExample3" "amExample4"
    ## 
    ## Other:
    ## [1] "art_api" "ggData"

Check the installed versions of `allelematch` and `amregtest`:

``` r
artVersion()
```

    ## 
    ##     Version of package 'amregtest' is 1.0.10
    ##     Installed (and thus tested) version of package 'allelematch' is: 2.5.5
