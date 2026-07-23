# See how an object of class amDataset is built:

    Code
      print(miniExample)
    Output
        sampleId knownIndividual             dismiss. LOC1a LOC1b LOC2a LOC2b
      1        1               A                 Rain    11    21    31    41
      2        2               A                drops    12    22    32    42
      3        3               B                 keep    13    23    33    43
      4        4               C  fallin' on my head     14    24   -88    44

---

    Code
      miniDataset1 <- amDataset(miniExample)

---

    Code
      print.amDataset(miniDataset1)
    Output
      allelematch
      amDataset object
      
      $index
      [1] "AAA" "AAB" "AAC" "AAD"
      
      $multilocus
           sampleId knownIndividual dismiss.          LOC1a LOC1b LOC2a LOC2b
      [1,] "1"      "A"             "Rain"            "11"  "21"  "31"  "41" 
      [2,] "2"      "A"             "drops"           "12"  "22"  "32"  "42" 
      [3,] "3"      "B"             "keep"            "13"  "23"  "33"  "43" 
      [4,] "4"      "C"             "fallin'onmyhead" "14"  "24"  "-88" "44" 
      
      $missingCode
      [1] "-99"

---

    {
      "type": "list",
      "attributes": {
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["index", "multilocus", "missingCode"]
        },
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["amDataset"]
        }
      },
      "value": [
        {
          "type": "character",
          "attributes": {},
          "value": ["AAA", "AAB", "AAC", "AAD"]
        },
        {
          "type": "character",
          "attributes": {
            "dim": {
              "type": "integer",
              "attributes": {},
              "value": [4, 7]
            },
            "dimnames": {
              "type": "list",
              "attributes": {},
              "value": [
                {
                  "type": "NULL"
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["sampleId", "knownIndividual", "dismiss.", "LOC1a", "LOC1b", "LOC2a", "LOC2b"]
                }
              ]
            }
          },
          "value": ["1", "2", "3", "4", "A", "A", "B", "C", "Rain", "drops", "keep", "fallin'onmyhead", "11", "12", "13", "14", "21", "22", "23", "24", "31", "32", "33", "-88", "41", "42", "43", "44"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["-99"]
        }
      ]
    }

---

    Code
      miniDataset2 <- amDataset(miniExample, missingCode = "-88", indexColumn = "sampleId",
        metaDataColumn = "knownIndividual", ignoreColumn = "dismiss.")

---

    Code
      print.amDataset(miniDataset2)
    Output
      allelematch
      amDataset object
      
      $index
      [1] "1" "2" "3" "4"
      
      $multilocus
           LOC1a LOC1b LOC2a LOC2b
      [1,] "11"  "21"  "31"  "41" 
      [2,] "12"  "22"  "32"  "42" 
      [3,] "13"  "23"  "33"  "43" 
      [4,] "14"  "24"  "-88" "44" 
      
      $missingCode
      [1] "-88"

---

    {
      "type": "list",
      "attributes": {
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["index", "metaData", "multilocus", "missingCode"]
        },
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["amDataset"]
        }
      },
      "value": [
        {
          "type": "character",
          "attributes": {},
          "value": ["1", "2", "3", "4"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["A", "A", "B", "  C"]
        },
        {
          "type": "character",
          "attributes": {
            "dim": {
              "type": "integer",
              "attributes": {},
              "value": [4, 4]
            },
            "dimnames": {
              "type": "list",
              "attributes": {},
              "value": [
                {
                  "type": "NULL"
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["LOC1a", "LOC1b", "LOC2a", "LOC2b"]
                }
              ]
            }
          },
          "value": ["11", "12", "13", "14", "21", "22", "23", "24", "31", "32", "33", "-88", "41", "42", "43", "44"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["-88"]
        }
      ]
    }

---

    Code
      miniDataset3 <- amDataset(miniExample, missingCode = "-88", indexColumn = 1,
        metaDataColumn = 2, ignoreColumn = 3)

---

    Code
      print.amDataset(miniDataset2)
    Output
      allelematch
      amDataset object
      
      $index
      [1] "1" "2" "3" "4"
      
      $multilocus
           LOC1a LOC1b LOC2a LOC2b
      [1,] "11"  "21"  "31"  "41" 
      [2,] "12"  "22"  "32"  "42" 
      [3,] "13"  "23"  "33"  "43" 
      [4,] "14"  "24"  "-88" "44" 
      
      $missingCode
      [1] "-88"

---

    {
      "type": "list",
      "attributes": {
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["index", "metaData", "multilocus", "missingCode"]
        },
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["amDataset"]
        }
      },
      "value": [
        {
          "type": "character",
          "attributes": {},
          "value": ["1", "2", "3", "4"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["A", "A", "B", "  C"]
        },
        {
          "type": "character",
          "attributes": {
            "dim": {
              "type": "integer",
              "attributes": {},
              "value": [4, 4]
            },
            "dimnames": {
              "type": "list",
              "attributes": {},
              "value": [
                {
                  "type": "NULL"
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["LOC1a", "LOC1b", "LOC2a", "LOC2b"]
                }
              ]
            }
          },
          "value": ["11", "12", "13", "14", "21", "22", "23", "24", "31", "32", "33", "-88", "41", "42", "43", "44"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["-88"]
        }
      ]
    }

# Different data types for arg to 'missingCode' give same result

    Code
      ds1 <- amDataset(sample, missingCode = "NA")
    Output
      allelematch: NA data converted to NA

---

    structure(list(index = c("AAA", "AAB", "AAC", "AAD"), multilocus = structure(c("11", 
    "12", "13", "14", "21", "22", "23", "NA", "31", "32", "33", "NA", 
    "41", "42", "43", "NA"), dim = c(4L, 4L), dimnames = list(NULL, 
        c("LOC1a", "LOC1b", "LOC2a", "LOC2b"))), missingCode = "NA"), class = "amDataset")

---

    Code
      ds2 <- amDataset(sample, missingCode = NA)
    Output
      allelematch: NA data converted to NA

---

    structure(list(index = c("AAA", "AAB", "AAC", "AAD"), multilocus = structure(c("11", 
    "12", "13", "14", "21", "22", "23", "NA", "31", "32", "33", "NA", 
    "41", "42", "43", "NA"), dim = c(4L, 4L), dimnames = list(NULL, 
        c("LOC1a", "LOC1b", "LOC2a", "LOC2b"))), missingCode = "NA"), class = "amDataset")

