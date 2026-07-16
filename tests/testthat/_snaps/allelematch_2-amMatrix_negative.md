# Validation of arguments to amMatrix() is working

    Code
      print(miniExample)
    Output
        LOC1a LOC1b LOC2a LOC2b
      1    11    21    31    41
      2    12    22    32    42
      3    13    23    33    43
      4    14    24   -99    44

---

    Code
      amdataMini <- amDataset(miniExample)

---

    Code
      print(amdataMini)
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
          "value": ["11", "12", "13", "14", "21", "22", "23", "24", "31", "32", "33", "-99", "41", "42", "43", "44"]
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
      mx0 <- amMatrix(amdataMini, 1)

---

    {
      "type": "double",
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
              "type": "character",
              "attributes": {},
              "value": ["AAA", "AAB", "AAC", "AAD"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["AAA", "AAB", "AAC", "AAD"]
            }
          ]
        },
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["amMatrix"]
        }
      },
      "value": [0, 1, 1, 0.9375, 1, 0, 1, 0.9375, 1, 1, 0, 0.9375, 0.9375, 0.9375, 0.9375, 0.125]
    }

