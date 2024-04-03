# Validation of arguments to amPairwise() is working

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
      print.amDataset(amdataMini1)
    Output
      allelematch
      amDataset object
          LOC1a LOC1b LOC2a LOC2b
      AAA    11    21    31    41
      AAB    12    22    32    42
      AAC    13    23    33    43
      AAD    14    24   -99    44

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
      print(oddExample2)
    Output
        LOC1a LOC1b LOC2a LOC2b LOC3a
      1    11    21    31    41    51
      2    12    22    32    42    52
      3    13    23    33    43    53
      4    14    24   -99    44   -99

---

    Code
      amdataOdd2 <- amDataset(oddExample2)

---

    Code
      print.amDataset(amdataOdd2)
    Output
      allelematch
      amDataset object
          LOC1a LOC1b LOC2a LOC2b LOC3a
      AAA    11    21    31    41    51
      AAB    12    22    32    42    52
      AAC    13    23    33    43    53
      AAD    14    24   -99    44   -99

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
              "value": [4, 5]
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
                  "value": ["LOC1a", "LOC1b", "LOC2a", "LOC2b", "LOC3a"]
                }
              ]
            }
          },
          "value": ["11", "12", "13", "14", "21", "22", "23", "24", "31", "32", "33", "-99", "41", "42", "43", "44", "51", "52", "53", "-99"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["-99"]
        }
      ]
    }

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
      pw0 <- amPairwise(amdata, alleleMismatch = 2)

---

    {
      "type": "list",
      "attributes": {
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["pairwise", "missingCode", "matchThreshold", "alleleMismatch", "missingMethod", "focalDatasetN", "comparisonDatasetN", "focalIsComparison"]
        },
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["amPairwise"]
        }
      },
      "value": [
        {
          "type": "list",
          "attributes": {},
          "value": [
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["focal", "match"]
                }
              },
              "value": [
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["index", "metaData", "multilocus", "flags"]
                    }
                  },
                  "value": [
                    {
                      "type": "character",
                      "attributes": {},
                      "value": ["AAA"]
                    },
                    {
                      "type": "NULL"
                    },
                    {
                      "type": "character",
                      "attributes": {
                        "dim": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 4]
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
                      "value": ["11", "21", "31", "41"]
                    },
                    {
                      "type": "double",
                      "attributes": {
                        "dim": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 4]
                        }
                      },
                      "value": [1, 1, 1, 1]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["index", "multilocus", "score", "flags", "perfect", "partial"]
                    }
                  },
                  "value": [
                    {
                      "type": "character",
                      "attributes": {},
                      "value": ["AAA"]
                    },
                    {
                      "type": "character",
                      "attributes": {
                        "dim": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 4]
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
                      "value": ["11", "21", "31", "41"]
                    },
                    {
                      "type": "character",
                      "attributes": {},
                      "value": ["1"]
                    },
                    {
                      "type": "double",
                      "attributes": {
                        "dim": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 4]
                        }
                      },
                      "value": [1, 1, 1, 1]
                    },
                    {
                      "type": "integer",
                      "attributes": {},
                      "value": [1]
                    },
                    {
                      "type": "integer",
                      "attributes": {},
                      "value": [0]
                    }
                  ]
                }
              ]
            },
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["focal", "match"]
                }
              },
              "value": [
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["index", "metaData", "multilocus", "flags"]
                    }
                  },
                  "value": [
                    {
                      "type": "character",
                      "attributes": {},
                      "value": ["AAB"]
                    },
                    {
                      "type": "NULL"
                    },
                    {
                      "type": "character",
                      "attributes": {
                        "dim": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 4]
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
                      "value": ["12", "22", "32", "42"]
                    },
                    {
                      "type": "double",
                      "attributes": {
                        "dim": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 4]
                        }
                      },
                      "value": [1, 1, 1, 1]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["index", "multilocus", "score", "flags", "perfect", "partial"]
                    }
                  },
                  "value": [
                    {
                      "type": "character",
                      "attributes": {},
                      "value": ["AAB"]
                    },
                    {
                      "type": "character",
                      "attributes": {
                        "dim": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 4]
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
                      "value": ["12", "22", "32", "42"]
                    },
                    {
                      "type": "character",
                      "attributes": {},
                      "value": ["1"]
                    },
                    {
                      "type": "double",
                      "attributes": {
                        "dim": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 4]
                        }
                      },
                      "value": [1, 1, 1, 1]
                    },
                    {
                      "type": "integer",
                      "attributes": {},
                      "value": [1]
                    },
                    {
                      "type": "integer",
                      "attributes": {},
                      "value": [0]
                    }
                  ]
                }
              ]
            },
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["focal", "match"]
                }
              },
              "value": [
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["index", "metaData", "multilocus", "flags"]
                    }
                  },
                  "value": [
                    {
                      "type": "character",
                      "attributes": {},
                      "value": ["AAC"]
                    },
                    {
                      "type": "NULL"
                    },
                    {
                      "type": "character",
                      "attributes": {
                        "dim": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 4]
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
                      "value": ["13", "23", "33", "43"]
                    },
                    {
                      "type": "double",
                      "attributes": {
                        "dim": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 4]
                        }
                      },
                      "value": [1, 1, 1, 1]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["index", "multilocus", "score", "flags", "perfect", "partial"]
                    }
                  },
                  "value": [
                    {
                      "type": "character",
                      "attributes": {},
                      "value": ["AAC"]
                    },
                    {
                      "type": "character",
                      "attributes": {
                        "dim": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 4]
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
                      "value": ["13", "23", "33", "43"]
                    },
                    {
                      "type": "character",
                      "attributes": {},
                      "value": ["1"]
                    },
                    {
                      "type": "double",
                      "attributes": {
                        "dim": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 4]
                        }
                      },
                      "value": [1, 1, 1, 1]
                    },
                    {
                      "type": "integer",
                      "attributes": {},
                      "value": [1]
                    },
                    {
                      "type": "integer",
                      "attributes": {},
                      "value": [0]
                    }
                  ]
                }
              ]
            },
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["focal", "match"]
                }
              },
              "value": [
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["index", "metaData", "multilocus", "flags"]
                    }
                  },
                  "value": [
                    {
                      "type": "character",
                      "attributes": {},
                      "value": ["AAD"]
                    },
                    {
                      "type": "NULL"
                    },
                    {
                      "type": "character",
                      "attributes": {
                        "dim": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 4]
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
                      "value": ["14", "24", "-99", "44"]
                    },
                    {
                      "type": "double",
                      "attributes": {
                        "dim": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 4]
                        }
                      },
                      "value": [1, 1, 2, 1]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["index", "multilocus", "score", "flags", "perfect", "partial"]
                    }
                  },
                  "value": [
                    {
                      "type": "character",
                      "attributes": {},
                      "value": ["AAD"]
                    },
                    {
                      "type": "character",
                      "attributes": {
                        "dim": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 4]
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
                      "value": ["14", "24", "-99", "44"]
                    },
                    {
                      "type": "character",
                      "attributes": {},
                      "value": ["1"]
                    },
                    {
                      "type": "double",
                      "attributes": {
                        "dim": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 4]
                        }
                      },
                      "value": [1, 1, 2, 1]
                    },
                    {
                      "type": "integer",
                      "attributes": {},
                      "value": [1]
                    },
                    {
                      "type": "integer",
                      "attributes": {},
                      "value": [0]
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["-99"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.5]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [2]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [2]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [4]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [4]
        },
        {
          "type": "logical",
          "attributes": {},
          "value": [true]
        }
      ]
    }

