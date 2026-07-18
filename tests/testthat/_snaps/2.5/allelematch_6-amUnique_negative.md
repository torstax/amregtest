# Validation of arguments to amUnique() is working

    Code
      print(miniExample1)
    Output
        LOC1a LOC1b LOC2a LOC2b
      1    11    21    31    41
      2    12    22    32    42
      3    13    23    33    43
      4    14    24   -99    44

---

    Code
      amdataMini1 <- amDataset(miniExample1)

---

    Code
      print(amdataMini1)
    Output
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
      
      attr(,"class")
      [1] "amDataset"

