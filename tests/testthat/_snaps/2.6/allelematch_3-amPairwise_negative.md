# Validation of arguments to amPairwise() is working

    Code
      print.amDataset(amdataMini1)
    Output
      allelematch
      amDataset object
      
      $index
      [1] "AAA" "AAB" "AAC" "AAD"
      
      $multilocus
           LOC1a LOC1b LOC2a LOC2b
      [1,] "11"  "21"  "31"  "41" 
      [2,] "12"  "22"  "32"  "42" 
      [3,] "13"  "23"  "33"  "43" 
      [4,] "14"  "24"  "-99" "44" 
      
      $missingCode
      [1] "-99"

---

    Code
      print.amDataset(amdataOdd2)
    Output
      allelematch
      amDataset object
      
      $index
      [1] "AAA" "AAB" "AAC" "AAD"
      
      $multilocus
           LOC1a LOC1b LOC2a LOC2b LOC3a
      [1,] "11"  "21"  "31"  "41"  "51" 
      [2,] "12"  "22"  "32"  "42"  "52" 
      [3,] "13"  "23"  "33"  "43"  "53" 
      [4,] "14"  "24"  "-99" "44"  "-99"
      
      $missingCode
      [1] "-99"

