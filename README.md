# amregtest

<!-- badges: start -->

<!-- badges: end -->

The goal of amregtest is used to verify backwards compatibility while developing the R package allelematch from <https://github.com/cran/allelematch>

amregtest is a set of R scripts and data files that contain test input and expected output.

## Installation

You can install the development version of amregtest from [GitHub](https://github.com/) with: 

``` r
# install.packages("devtools")
devtools::install_github("torstax/amregtest")
```

## Example

``` r
# The installed version of 'allelematch' 
# will be tested by the installed version of 'amregtest':
library(allelematch)
library(amregtest)

# The testing is done by function 'artRun()'. 
# See the help in RStudio:
?artRun
```
