
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

You can install the released version from CRAN with:

``` r
# Install remotes if you don't have it
install.packages("remotes")

# Install amregtest with tests included
remotes::install_cran(
  "amregtest", 
  type = "source", 
  INSTALL_opts = "--install-tests"
)
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

To run only tests whose names match a Perl regular expression:

``` r
artRun(filter = "amExample2|amExample4")
```

        About to test installed version of allelematch:  <<<3.0.0>>>
    ✔ | F W  S  OK | Context
    ✔ |         14 | amExample2 [4.6s]
    ✔ |         14 | amExample4 [5.8s]

    ══ Results ═══════════════════════════════════════════════
    Duration: 10.4 s

    [ FAIL 0 | WARN 0 | SKIP 0 | PASS 28 ]
        Done testing installed version of allelematch:  <<<3.0.0>>>

List all available tests without running them:

``` r
artList()
```

    ## 
    ## Tests in files under "C:/Users/Torva/AppData/Local/Temp/RtmpiKfJ30/temp_libpath9ec641c4c61/amregtest/tests/testthat/":
    ## 
    ## Tests by functions in allelematch:
    ##  [1] "allelematch_0-package"            
    ##  [2] "allelematch_1-amDataset"          
    ##  [3] "allelematch_1-amDataset_negative" 
    ##  [4] "allelematch_2-amMatrix"           
    ##  [5] "allelematch_2-amMatrix_negative"  
    ##  [6] "allelematch_3-amPairwise"         
    ##  [7] "allelematch_3-amPairwise_negative"
    ##  [8] "allelematch_3-amPairwise_print"   
    ##  [9] "allelematch_4-amCluster-amMini"   
    ## [10] "allelematch_4-amCluster-Ex1"      
    ## [11] "allelematch_4-amCluster-Ex2"      
    ## [12] "allelematch_4-amCluster-Ex3"      
    ## [13] "allelematch_4-amCluster-Ex4"      
    ## [14] "allelematch_4-amCluster-Ex5"      
    ## [15] "allelematch_4-amCluster"          
    ## [16] "allelematch_4-amCluster_print"    
    ## [17] "allelematch_5-amAlleleFreq"       
    ## [18] "allelematch_6-amUnique"           
    ## [19] "allelematch_6-amUnique_negative"  
    ## [20] "allelematch_6-amUnique_print"     
    ## [21] "allelematch_7-amUniqueProfile"    
    ## 
    ## Reproduction of the examples in 'allelematchSuppDoc.pdf':
    ## [1] "amExample1" "amExample2" "amExample3" "amExample4"
    ## 
    ## Other:
    ## [1] "ggData"

Check the installed versions of `allelematch` and `amregtest`:

``` r
artVersion()
```

    ## 
    ##     Installed version of package 'amregtest'   is: 1.3.2      (Built 21:20)
    ##     Installed version of package 'allelematch' is: 3.0.0      (Built 13:24)
