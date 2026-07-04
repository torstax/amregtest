# Print

    Code
      paste("About to exercise", obj)
    Output
      [1] "About to exercise objMini"

---

    Code
      summary.amUnique(get(obj), csv = tmp)

---

    Code
      format(read.csv(tmp))
    Output
        uniqueGroup rowType uniqueIndex matchIndex nUniqueGroup alleleMismatch matchThreshold cutHeight      Psib score LOC1a LOC1b LOC2a LOC2b
      1           1  UNIQUE         AAA        AAA            1              2            0.5       0.5 0.1062261    NA    11    21    31    41
      2           2  UNIQUE         AAB        AAB            1              2            0.5       0.5 0.1062261    NA    12    22    32    42
      3           3  UNIQUE         AAC        AAC            1              2            0.5       0.5 0.1062261    NA    13    23    33    43
      4           4  UNIQUE         AAD        AAD            1              2            0.5       0.5 0.3203125    NA    14    24   -99    44

---

    Code
      summary.amUnique(get(obj), html = tmp)

---

    Code
      cat(sub("summary generated: </b><em>.+?</em>", "summary generated: </b><em>(date)</em>", gsub("(\\t| )+?(\\n|$)", "\\2", readLines(tmp, warn = FALSE), perl = TRUE), perl = TRUE), sep = "\n")
    Output
      <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
      
               <html xmlns='http://www.w3.org/1999/xhtml' xml:lang='en' lang='en'><head>
      
              <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
      <title>allelematch: amUnique() output</title><style type="text/css">
      
              html {
                  height: 100%;
              }
      
              body {
                  background-color: inherit;
                  color: inherit;
                  font-family: Verdana;
                  font-size: xx-small;
                  margin: 0;
                  height: 100%;
      
              }
      
              a:active {
                  color: #CC0000;
              }
      
              a:link {
                  color: #CC0000;
              }
      
              a:visited {
                  color: #CC0000;
              }
      
              .amMismatchAllele {
                  background-color: #CC0000;
                  color: white;
                  font-weight: bold;
              }
      
              .amMissingAllele {
                  background-color: #FFCCCC;
              }
      
              .amInterpolatedAllele {
                  background-color: blue;
                  color: white;
              }
      
              .amGrid {
                  border-collapse: separate;
              }
      
              .amGridContent {
                  padding: 0;
                  border: 1px solid #7EACB1;
              }
      
      
              .amGridUpperPanel, .amGridLowerPanel {
                  padding: 3px;
                  border-left: 0;
                  border-right: 0;
                  background-color: #F4FAFB;
                  color: #2A769D;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
              .amGridUpperPanel {
                  border-top: 0px;
                  border-bottom: 1px solid;
                  border-color: #7EACB1;
              }
      
              .amGridMiddlePanel {
                  border: 0;
              }
      
              .amGridLowerPanel {
                  border-top: 1px solid;
                  border-bottom: 0px;
                  border-color: #C2D4DA;
              }
      
              .amGridUpperPanel td, .amGridLowerPanel td {
                  color: #2A769D;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
      
              .amTable {
                  border: 0;
                  border-spacing: 0;
                  border-collapse: collapse;
                  empty-cells: show;
                  width: 100%;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
              .amTableSeparate {
                  border-collapse: separate;
              }
      
              .amTable td {
                  padding: 3px;
                  border-bottom: 1px solid;
                  border-top: 0px;
                  border-left: 0px;
                  border-right: 1px solid;
                  border-color: #C2D4DA;
                  white-space:nowrap;
              }
      
      
              .amTable .amTableHeader, .amTable .amTableHeader td {
                  background-color: #B7D8DC;
                  color: #000000;
                  border-bottom: 1px solid;
                  border-right: 1px solid;
                  border-color: #7EACB1;
                  background-repeat: repeat-x;
                  vertical-align: top;
                  white-space:nowrap;
              }
      
              .amPointer {
                  cursor: pointer;
              }
      
      
              .amTableHeaderBtn {
                  width: 100%;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
              .amTableHeader .amTableHeaderBtn td {
                  background: transparent;
                  padding: 0;
                  border: 0;
                  white-space: nowrap;
              }
      
              .amTableSelectRow {
                  background-color: #FFFF66;
                  color: #000000;
              }
      
      </style></head><body><div style="margin-left:5%; margin-right:5%"><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><div style="font-size:x-small;"><table><tr><td style="width:400px;"><span style="font-size:20px;">allelematch<br>unique analysis</span><br><br></td></tr>
      <tr><td><b>
      unique N=</b><em>4</em></td></tr>
       <tr><td><b>samples N=</b><em>4</em></td></tr>
       <tr><td><b><br>loci N=</b><em>2</em></td></tr>
       <tr><td><b>locus names: </b><em>LOC1a-LOC1b, LOC2a-LOC2b</em></td></tr>
       <tr><td><b><br>missing data represented by: </b><em>-99</em></td></tr>
       <tr><td><b>clustered genotypes consensus method: </b><em>1</em></td></tr>
       <tr><td><b>Psib calculated for: </b><em>samples with no mismatches</em></td></tr>
       <tr><td><b><br>alleleMismatch (m-hat; maximum number of mismatching alleles): </b><em>2</em></td></tr>
       <tr><td><b>cutHeight (d-hat; dynamic tree cutting height): </b><em>0.5</em></td></tr>
       <tr><td><b>matchThreshold (s-hat; lowest matching score returned): </b><em>0.5</em></td></tr>
       <tr><td><b><br>unclassified (samples that were not classified) N=</b><em>0</em></td></tr>
       <tr><td><b>multipleMatch (samples that match more than one unique genotype) N=</b><em>0</em></td></tr>
       <tr><td><b><br>Note: Unique genotypes are determined based on clustering of their scores followed by a dynamic tree cutting procedure (see supplementary documentation).</b><em>  Psib appears for reference purposes and is not used to determine unique genotypes.  It is calculated using allele frequencies in the unique genotype set.</em></td></tr>
       <tr><td><b><br>summary generated: </b><em>(date)</em></td></tr>
      </table></div></div></td></tr></table><br><br>
      <table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">Unique genotypes</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#AAA">Jump</a></div></td>
      <td><div>AAA</div></td>
      <td><div>11</div></td>
      <td><div>21</div></td>
      <td><div>31</div></td>
      <td><div>41</div></td>
      <td><div>0.11</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#AAB">Jump</a></div></td>
      <td><div>AAB</div></td>
      <td><div>12</div></td>
      <td><div>22</div></td>
      <td><div>32</div></td>
      <td><div>42</div></td>
      <td><div>0.11</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#AAC">Jump</a></div></td>
      <td><div>AAC</div></td>
      <td><div>13</div></td>
      <td><div>23</div></td>
      <td><div>33</div></td>
      <td><div>43</div></td>
      <td><div>0.11</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#AAD">Jump</a></div></td>
      <td><div>AAD</div></td>
      <td><div>14</div></td>
      <td><div>24</div></td>
      <td><div>-99</div></td>
      <td><div>44</div></td>
      <td><div>0.32</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      </table></div><div class="amGridLowerPanel"><span>There were 4 unique genotypes identified using the parameters supplied.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="AAA"><span style="font-size:medium;">Unique genotype (1 of 4)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>AAA</div></td>
      <td class="amTableSelectRow"><div>11</div></td>
      <td class="amTableSelectRow"><div>21</div></td>
      <td class="amTableSelectRow"><div>31</div></td>
      <td class="amTableSelectRow"><div>41</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>AAA</div></td><td><div>11</div></td><td><div>21</div></td><td><div>31</div></td><td><div>41</div></td><td><div>0.11</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 4 samples, returning those with score>=0.5<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="AAB"><span style="font-size:medium;">Unique genotype (2 of 4)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>AAB</div></td>
      <td class="amTableSelectRow"><div>12</div></td>
      <td class="amTableSelectRow"><div>22</div></td>
      <td class="amTableSelectRow"><div>32</div></td>
      <td class="amTableSelectRow"><div>42</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>AAB</div></td><td><div>12</div></td><td><div>22</div></td><td><div>32</div></td><td><div>42</div></td><td><div>0.11</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 4 samples, returning those with score>=0.5<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="AAC"><span style="font-size:medium;">Unique genotype (3 of 4)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>AAC</div></td>
      <td class="amTableSelectRow"><div>13</div></td>
      <td class="amTableSelectRow"><div>23</div></td>
      <td class="amTableSelectRow"><div>33</div></td>
      <td class="amTableSelectRow"><div>43</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>AAC</div></td><td><div>13</div></td><td><div>23</div></td><td><div>33</div></td><td><div>43</div></td><td><div>0.11</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 4 samples, returning those with score>=0.5<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="AAD"><span style="font-size:medium;">Unique genotype (4 of 4)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>AAD</div></td>
      <td class="amTableSelectRow"><div>14</div></td>
      <td class="amTableSelectRow"><div>24</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>44</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>AAD</div></td><td><div>14</div></td><td><div>24</div></td><td><div class="amMissingAllele">-99</div></td><td><div>44</div></td><td><div>0.32</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 4 samples, returning those with score>=0.5<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><span style="font-size:x-small;">Generated by allelematch:  an R package<br></span><span style="font-size:x-small;">To reference this analysis please use citation("allelematch")<br><br></span></div></body></html>

---

    Code
      paste("About to exercise", obj)
    Output
      [1] "About to exercise objExample5"

---

    Code
      summary.amUnique(get(obj), csv = tmp)

---

    Code
      format(read.csv(tmp))
    Output
         uniqueGroup        rowType uniqueIndex matchIndex nUniqueGroup alleleMismatch matchThreshold cutHeight         Psib score LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b
      1            1         UNIQUE  1001.ON.CA 1001.ON.CA            1              6            0.7       0.3 0.0013180835    NA   382   384   230   236   -99   -99   185   185   301   301   223   223
      2            2   CHECK_UNIQUE  1002.ON.CA 1002.ON.CA            2              6            0.7       0.3 0.0041048900    NA   382   384   230   236   -99   -99   181   193   299   299   223   223
      3            2 MULTIPLE_MATCH  1002.ON.CA 1010.ON.CA            2              6            0.7       0.3           NA   0.7   382   384   230   244   -99   -99   191   193   299   299   227   227
      4            3   CHECK_UNIQUE  1003.ON.CA 1003.ON.CA            4              6            0.7       0.3 0.0007497088    NA   382   382   224   242   -99   -99   185   191   285   299   223   223
      5            3 MULTIPLE_MATCH  1003.ON.CA 1005.ON.CA            4              6            0.7       0.3 0.0007497088   1.0   382   382   224   242   -99   -99   185   191   285   299   223   223
      6            3 MULTIPLE_MATCH  1003.ON.CA 1008.ON.CA            4              6            0.7       0.3           NA   0.7   382   382   224   230   -99   -99   185   193   285   285   223   223
      7            3 MULTIPLE_MATCH  1003.ON.CA 1009.ON.CA            4              6            0.7       0.3           NA   0.7   382   382   224   230   -99   -99   185   193   285   285   223   223
      8            4         UNIQUE  1004.ON.CA 1004.ON.CA            1              6            0.7       0.3 0.0005474353    NA   382   384   232   236   -99   -99   193   193   299   301   223   223
      9            5         UNIQUE  1006.ON.CA 1006.ON.CA            2              6            0.7       0.3 0.0012399812    NA   382   384   224   230   -99   -99   181   193   285   285   223   223
      10           5          MATCH  1006.ON.CA 1007.ON.CA            2              6            0.7       0.3 0.0012399812   1.0   382   384   224   230   -99   -99   181   193   285   285   223   223
      11           6   CHECK_UNIQUE  1008.ON.CA 1008.ON.CA            4              6            0.7       0.3 0.0030669861    NA   382   382   224   230   -99   -99   185   193   285   285   223   223
      12           6 MULTIPLE_MATCH  1008.ON.CA 1009.ON.CA            4              6            0.7       0.3 0.0030669861   1.0   382   382   224   230   -99   -99   185   193   285   285   223   223
      13           6 MULTIPLE_MATCH  1008.ON.CA 1003.ON.CA            4              6            0.7       0.3           NA   0.7   382   382   224   242   -99   -99   185   191   285   299   223   223
      14           6 MULTIPLE_MATCH  1008.ON.CA 1005.ON.CA            4              6            0.7       0.3           NA   0.7   382   382   224   242   -99   -99   185   191   285   299   223   223
      15           7   CHECK_UNIQUE  1010.ON.CA 1010.ON.CA            2              6            0.7       0.3 0.0013726775    NA   382   384   230   244   -99   -99   191   193   299   299   227   227
      16           7 MULTIPLE_MATCH  1010.ON.CA 1002.ON.CA            2              6            0.7       0.3           NA   0.7   382   384   230   236   -99   -99   181   193   299   299   223   223
      17           8         UNIQUE  1011.ON.CA 1011.ON.CA            2              6            0.7       0.3 0.0019906591    NA   382   384   224   224   -99   -99   193   193   299   299   223   223
      18           8          MATCH  1011.ON.CA 1012.ON.CA            2              6            0.7       0.3 0.0019906591   1.0   382   384   224   224   -99   -99   193   193   299   299   223   223
      19           9         UNIQUE  1013.ON.CA 1013.ON.CA            1              6            0.7       0.3 0.0010644773    NA   382   384   232   232   -99   -99   193   193   299   299   213   221
      20          10         UNIQUE  1014.ON.CA 1014.ON.CA            1              6            0.7       0.3 0.0001897099    NA   384   384   232   238   -99   -99   193   199   299   301   213   213
      21          11         UNIQUE  1015.ON.CA 1015.ON.CA            1              6            0.7       0.3 0.0030557735    NA   382   382   224   232   -99   -99   193   193   299   299   223   223
      22          12         UNIQUE  1016.ON.CA 1016.ON.CA            1              6            0.7       0.3 0.0015709815    NA   382   384   224   232   -99   -99   193   193   -99   -99   213   221
      23          13         UNIQUE  1017.ON.CA 1017.ON.CA            1              6            0.7       0.3 0.0015245663    NA   382   388   230   230   -99   -99   181   185   285   299   223   223
      24          14         UNIQUE  1018.ON.CA 1018.ON.CA            1              6            0.7       0.3 0.0015453357    NA   384   384   224   230   -99   -99   185   199   285   299   223   223
      25          15         UNIQUE  1019.ON.CA 1019.ON.CA            1              6            0.7       0.3 0.0024771091    NA   382   384   224   230   159   159   193   193   299   299   223   223
      26          16         UNIQUE  1020.ON.CA 1020.ON.CA            1              6            0.7       0.3 0.0016024357    NA   382   384   224   230   155   167   185   193   299   299   223   223
         LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b
      1    192   192   118   118   296   304    166    166
      2    202   202   118   118   288   296    166    166
      3    202   204   118   118   296   296    166    166
      4    192   202   102   118   298   304    166    172
      5    192   202   102   118   298   304    166    172
      6    192   202   118   118   296   304    166    166
      7    192   202   118   118   296   304    166    166
      8    192   216   102   108   296   304    168    174
      9    198   202   114   116   288   296    166    166
      10   198   202   114   116   288   296    166    166
      11   192   202   118   118   296   304    166    166
      12   192   202   118   118   296   304    166    166
      13   192   202   102   118   298   304    166    172
      14   192   202   102   118   298   304    166    172
      15   202   204   118   118   296   296    166    166
      16   202   202   118   118   288   296    166    166
      17   210   214   106   112   288   296    166    172
      18   210   214   106   112   288   296    166    172
      19   210   210   118   118   296   306    166    172
      20   210   210   102   108   296   296    174    174
      21   210   216   106   106   296   306    166    166
      22   210   210   106   112   288   288    166    166
      23   202   202   106   118   304   304    166    166
      24   198   204   116   118   296   296    166    166
      25   202   202   106   118   298   298    166    166
      26   202   204   106   106   296   304    166    166

---

    Code
      summary.amUnique(get(obj), html = tmp)

---

    Code
      cat(sub("summary generated: </b><em>.+?</em>", "summary generated: </b><em>(date)</em>", gsub("(\\t| )+?(\\n|$)", "\\2", readLines(tmp, warn = FALSE), perl = TRUE), perl = TRUE), sep = "\n")
    Output
      <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
      
               <html xmlns='http://www.w3.org/1999/xhtml' xml:lang='en' lang='en'><head>
      
              <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
      <title>allelematch: amUnique() output</title><style type="text/css">
      
              html {
                  height: 100%;
              }
      
              body {
                  background-color: inherit;
                  color: inherit;
                  font-family: Verdana;
                  font-size: xx-small;
                  margin: 0;
                  height: 100%;
      
              }
      
              a:active {
                  color: #CC0000;
              }
      
              a:link {
                  color: #CC0000;
              }
      
              a:visited {
                  color: #CC0000;
              }
      
              .amMismatchAllele {
                  background-color: #CC0000;
                  color: white;
                  font-weight: bold;
              }
      
              .amMissingAllele {
                  background-color: #FFCCCC;
              }
      
              .amInterpolatedAllele {
                  background-color: blue;
                  color: white;
              }
      
              .amGrid {
                  border-collapse: separate;
              }
      
              .amGridContent {
                  padding: 0;
                  border: 1px solid #7EACB1;
              }
      
      
              .amGridUpperPanel, .amGridLowerPanel {
                  padding: 3px;
                  border-left: 0;
                  border-right: 0;
                  background-color: #F4FAFB;
                  color: #2A769D;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
              .amGridUpperPanel {
                  border-top: 0px;
                  border-bottom: 1px solid;
                  border-color: #7EACB1;
              }
      
              .amGridMiddlePanel {
                  border: 0;
              }
      
              .amGridLowerPanel {
                  border-top: 1px solid;
                  border-bottom: 0px;
                  border-color: #C2D4DA;
              }
      
              .amGridUpperPanel td, .amGridLowerPanel td {
                  color: #2A769D;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
      
              .amTable {
                  border: 0;
                  border-spacing: 0;
                  border-collapse: collapse;
                  empty-cells: show;
                  width: 100%;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
              .amTableSeparate {
                  border-collapse: separate;
              }
      
              .amTable td {
                  padding: 3px;
                  border-bottom: 1px solid;
                  border-top: 0px;
                  border-left: 0px;
                  border-right: 1px solid;
                  border-color: #C2D4DA;
                  white-space:nowrap;
              }
      
      
              .amTable .amTableHeader, .amTable .amTableHeader td {
                  background-color: #B7D8DC;
                  color: #000000;
                  border-bottom: 1px solid;
                  border-right: 1px solid;
                  border-color: #7EACB1;
                  background-repeat: repeat-x;
                  vertical-align: top;
                  white-space:nowrap;
              }
      
              .amPointer {
                  cursor: pointer;
              }
      
      
              .amTableHeaderBtn {
                  width: 100%;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
              .amTableHeader .amTableHeaderBtn td {
                  background: transparent;
                  padding: 0;
                  border: 0;
                  white-space: nowrap;
              }
      
              .amTableSelectRow {
                  background-color: #FFFF66;
                  color: #000000;
              }
      
      </style></head><body><div style="margin-left:5%; margin-right:5%"><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><div style="font-size:x-small;"><table><tr><td style="width:400px;"><span style="font-size:20px;">allelematch<br>unique analysis</span><br><br></td></tr>
      <tr><td><b>
      unique N=</b><em>16</em></td></tr>
       <tr><td><b>samples N=</b><em>20</em></td></tr>
       <tr><td><b><br>loci N=</b><em>10</em></td></tr>
       <tr><td><b>locus names: </b><em>LOC1a-LOC1b, LOC2a-LOC2b, LOC3a-LOC3b, LOC4a-LOC4b, LOC5a-LOC5b, LOC6a-LOC6b, LOC7a-LOC7b, LOC8a-LOC8b, LOC9a-LOC9b, LOC10a-LOC10b</em></td></tr>
       <tr><td><b><br>missing data represented by: </b><em>-99</em></td></tr>
       <tr><td><b>clustered genotypes consensus method: </b><em>1</em></td></tr>
       <tr><td><b>Psib calculated for: </b><em>samples with no mismatches</em></td></tr>
       <tr><td><b><br>alleleMismatch (m-hat; maximum number of mismatching alleles): </b><em>6</em></td></tr>
       <tr><td><b>cutHeight (d-hat; dynamic tree cutting height): </b><em>0.3</em></td></tr>
       <tr><td><b>matchThreshold (s-hat; lowest matching score returned): </b><em>0.7</em></td></tr>
       <tr><td><b><br>unclassified (samples that were not classified) N=</b><em>0</em></td></tr>
       <tr><td><b>multipleMatch (samples that match more than one unique genotype) N=</b><em>6</em></td></tr>
       <tr><td><b><br>Note: Unique genotypes are determined based on clustering of their scores followed by a dynamic tree cutting procedure (see supplementary documentation).</b><em>  Psib appears for reference purposes and is not used to determine unique genotypes.  It is calculated using allele frequencies in the unique genotype set.</em></td></tr>
       <tr><td><b><br>summary generated: </b><em>(date)</em></td></tr>
      </table></div></div></td></tr></table><br><br>
      <table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">Unique genotypes</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1001.ON.CA">Jump</a></div></td>
      <td><div>1001.ON.CA</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>230</div></td>
      <td><div>236</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>185</div></td>
      <td><div>185</div></td>
      <td><div>301</div></td>
      <td><div>301</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>192</div></td>
      <td><div>192</div></td>
      <td><div>118</div></td>
      <td><div>118</div></td>
      <td><div>296</div></td>
      <td><div>304</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.0013</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1002.ON.CA">Jump</a></div></td>
      <td><div>1002.ON.CA</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>230</div></td>
      <td><div>236</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>181</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>202</div></td>
      <td><div>202</div></td>
      <td><div>118</div></td>
      <td><div>118</div></td>
      <td><div>288</div></td>
      <td><div>296</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.0041</div></td>
      <td><div>CHECK_UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1003.ON.CA">Jump</a></div></td>
      <td><div>1003.ON.CA</div></td>
      <td><div>382</div></td>
      <td><div>382</div></td>
      <td><div>224</div></td>
      <td><div>242</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>185</div></td>
      <td><div>191</div></td>
      <td><div>285</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>192</div></td>
      <td><div>202</div></td>
      <td><div>102</div></td>
      <td><div>118</div></td>
      <td><div>298</div></td>
      <td><div>304</div></td>
      <td><div>166</div></td>
      <td><div>172</div></td>
      <td><div>0.00075</div></td>
      <td><div>CHECK_UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1004.ON.CA">Jump</a></div></td>
      <td><div>1004.ON.CA</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>232</div></td>
      <td><div>236</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>193</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>301</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>192</div></td>
      <td><div>216</div></td>
      <td><div>102</div></td>
      <td><div>108</div></td>
      <td><div>296</div></td>
      <td><div>304</div></td>
      <td><div>168</div></td>
      <td><div>174</div></td>
      <td><div>0.00055</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1006.ON.CA">Jump</a></div></td>
      <td><div>1006.ON.CA</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>224</div></td>
      <td><div>230</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>181</div></td>
      <td><div>193</div></td>
      <td><div>285</div></td>
      <td><div>285</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>198</div></td>
      <td><div>202</div></td>
      <td><div>114</div></td>
      <td><div>116</div></td>
      <td><div>288</div></td>
      <td><div>296</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.0012</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1008.ON.CA">Jump</a></div></td>
      <td><div>1008.ON.CA</div></td>
      <td><div>382</div></td>
      <td><div>382</div></td>
      <td><div>224</div></td>
      <td><div>230</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>185</div></td>
      <td><div>193</div></td>
      <td><div>285</div></td>
      <td><div>285</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>192</div></td>
      <td><div>202</div></td>
      <td><div>118</div></td>
      <td><div>118</div></td>
      <td><div>296</div></td>
      <td><div>304</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.0031</div></td>
      <td><div>CHECK_UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1010.ON.CA">Jump</a></div></td>
      <td><div>1010.ON.CA</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>230</div></td>
      <td><div>244</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>191</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>299</div></td>
      <td><div>227</div></td>
      <td><div>227</div></td>
      <td><div>202</div></td>
      <td><div>204</div></td>
      <td><div>118</div></td>
      <td><div>118</div></td>
      <td><div>296</div></td>
      <td><div>296</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.0014</div></td>
      <td><div>CHECK_UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1011.ON.CA">Jump</a></div></td>
      <td><div>1011.ON.CA</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>224</div></td>
      <td><div>224</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>193</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>210</div></td>
      <td><div>214</div></td>
      <td><div>106</div></td>
      <td><div>112</div></td>
      <td><div>288</div></td>
      <td><div>296</div></td>
      <td><div>166</div></td>
      <td><div>172</div></td>
      <td><div>0.002</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1013.ON.CA">Jump</a></div></td>
      <td><div>1013.ON.CA</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>232</div></td>
      <td><div>232</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>193</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>299</div></td>
      <td><div>213</div></td>
      <td><div>221</div></td>
      <td><div>210</div></td>
      <td><div>210</div></td>
      <td><div>118</div></td>
      <td><div>118</div></td>
      <td><div>296</div></td>
      <td><div>306</div></td>
      <td><div>166</div></td>
      <td><div>172</div></td>
      <td><div>0.0011</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1014.ON.CA">Jump</a></div></td>
      <td><div>1014.ON.CA</div></td>
      <td><div>384</div></td>
      <td><div>384</div></td>
      <td><div>232</div></td>
      <td><div>238</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>193</div></td>
      <td><div>199</div></td>
      <td><div>299</div></td>
      <td><div>301</div></td>
      <td><div>213</div></td>
      <td><div>213</div></td>
      <td><div>210</div></td>
      <td><div>210</div></td>
      <td><div>102</div></td>
      <td><div>108</div></td>
      <td><div>296</div></td>
      <td><div>296</div></td>
      <td><div>174</div></td>
      <td><div>174</div></td>
      <td><div>0.00019</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1015.ON.CA">Jump</a></div></td>
      <td><div>1015.ON.CA</div></td>
      <td><div>382</div></td>
      <td><div>382</div></td>
      <td><div>224</div></td>
      <td><div>232</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>193</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>210</div></td>
      <td><div>216</div></td>
      <td><div>106</div></td>
      <td><div>106</div></td>
      <td><div>296</div></td>
      <td><div>306</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.0031</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1016.ON.CA">Jump</a></div></td>
      <td><div>1016.ON.CA</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>224</div></td>
      <td><div>232</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>193</div></td>
      <td><div>193</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>213</div></td>
      <td><div>221</div></td>
      <td><div>210</div></td>
      <td><div>210</div></td>
      <td><div>106</div></td>
      <td><div>112</div></td>
      <td><div>288</div></td>
      <td><div>288</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.0016</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1017.ON.CA">Jump</a></div></td>
      <td><div>1017.ON.CA</div></td>
      <td><div>382</div></td>
      <td><div>388</div></td>
      <td><div>230</div></td>
      <td><div>230</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>181</div></td>
      <td><div>185</div></td>
      <td><div>285</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>202</div></td>
      <td><div>202</div></td>
      <td><div>106</div></td>
      <td><div>118</div></td>
      <td><div>304</div></td>
      <td><div>304</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.0015</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1018.ON.CA">Jump</a></div></td>
      <td><div>1018.ON.CA</div></td>
      <td><div>384</div></td>
      <td><div>384</div></td>
      <td><div>224</div></td>
      <td><div>230</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>185</div></td>
      <td><div>199</div></td>
      <td><div>285</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>198</div></td>
      <td><div>204</div></td>
      <td><div>116</div></td>
      <td><div>118</div></td>
      <td><div>296</div></td>
      <td><div>296</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.0015</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1019.ON.CA">Jump</a></div></td>
      <td><div>1019.ON.CA</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>224</div></td>
      <td><div>230</div></td>
      <td><div>159</div></td>
      <td><div>159</div></td>
      <td><div>193</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>202</div></td>
      <td><div>202</div></td>
      <td><div>106</div></td>
      <td><div>118</div></td>
      <td><div>298</div></td>
      <td><div>298</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.0025</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1020.ON.CA">Jump</a></div></td>
      <td><div>1020.ON.CA</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>224</div></td>
      <td><div>230</div></td>
      <td><div>155</div></td>
      <td><div>167</div></td>
      <td><div>185</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>202</div></td>
      <td><div>204</div></td>
      <td><div>106</div></td>
      <td><div>106</div></td>
      <td><div>296</div></td>
      <td><div>304</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.0016</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      </table></div><div class="amGridLowerPanel"><span>There were 16 unique genotypes identified using the parameters supplied.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1001.ON.CA"><span style="font-size:medium;">Unique genotype (1 of 16)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1001.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>236</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>301</div></td>
      <td class="amTableSelectRow"><div>301</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1001.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>230</div></td><td><div>236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>185</div></td><td><div>301</div></td><td><div>301</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>192</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0013</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1002.ON.CA"><span style="font-size:medium;">Unique genotype (2 of 16)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1002.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>236</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>181</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>CHECK_UNIQUE</div></td>
      </tr>
      <tr><td><div><span style="color:red; font-weight:bold;">!!!</span></div></td><td><div>1002.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>230</div></td><td><div>236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>202</div></td><td><div>118</div></td><td><div>118</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0041</div></td><td><div>1</div></td><td><div>MULTIPLE_MATCH</div></td> </tr>
      <tr><td><div><span style="color:red; font-weight:bold;">!!!</span></div></td><td><div>1010.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>230</div></td><td><div class="amMismatchAllele">244</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMismatchAllele">191</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div class="amMismatchAllele">227</div></td><td><div class="amMismatchAllele">227</div></td><td><div>202</div></td><td><div class="amMismatchAllele">204</div></td><td><div>118</div></td><td><div>118</div></td><td><div class="amMismatchAllele">296</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>&nbsp; &nbsp; ---</div></td><td><div>0.7</div></td><td><div>MULTIPLE_MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br><span style="color:red">multipleMatch samples, which match two or more unique genotypes, should be manually reviewed.  Please see supplementary documentation for more information</span><br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1003.ON.CA"><span style="font-size:medium;">Unique genotype (3 of 16)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1003.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>242</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>191</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>102</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>298</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>172</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>CHECK_UNIQUE</div></td>
      </tr>
      <tr><td><div><span style="color:red; font-weight:bold;">!!!</span></div></td><td><div>1003.ON.CA</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>242</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>191</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>102</div></td><td><div>118</div></td><td><div>298</div></td><td><div>304</div></td><td><div>166</div></td><td><div>172</div></td><td><div>0.00075</div></td><td><div>1</div></td><td><div>MULTIPLE_MATCH</div></td> </tr>
      <tr><td><div><span style="color:red; font-weight:bold;">!!!</span></div></td><td><div>1005.ON.CA</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>242</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>191</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>102</div></td><td><div>118</div></td><td><div>298</div></td><td><div>304</div></td><td><div>166</div></td><td><div>172</div></td><td><div>0.00075</div></td><td><div>1</div></td><td><div>MULTIPLE_MATCH</div></td> </tr>
      <tr><td><div><span style="color:red; font-weight:bold;">!!!</span></div></td><td><div>1008.ON.CA</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div class="amMismatchAllele">230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div class="amMismatchAllele">193</div></td><td><div>285</div></td><td><div class="amMismatchAllele">285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div class="amMismatchAllele">118</div></td><td><div>118</div></td><td><div class="amMismatchAllele">296</div></td><td><div>304</div></td><td><div>166</div></td><td><div class="amMismatchAllele">166</div></td><td><div>&nbsp; &nbsp; ---</div></td><td><div>0.7</div></td><td><div>MULTIPLE_MATCH</div></td> </tr>
      <tr><td><div><span style="color:red; font-weight:bold;">!!!</span></div></td><td><div>1009.ON.CA</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div class="amMismatchAllele">230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div class="amMismatchAllele">193</div></td><td><div>285</div></td><td><div class="amMismatchAllele">285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div class="amMismatchAllele">118</div></td><td><div>118</div></td><td><div class="amMismatchAllele">296</div></td><td><div>304</div></td><td><div>166</div></td><td><div class="amMismatchAllele">166</div></td><td><div>&nbsp; &nbsp; ---</div></td><td><div>0.7</div></td><td><div>MULTIPLE_MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br><span style="color:red">multipleMatch samples, which match two or more unique genotypes, should be manually reviewed.  Please see supplementary documentation for more information</span><br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1004.ON.CA"><span style="font-size:medium;">Unique genotype (4 of 16)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1004.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>236</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>301</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>216</div></td>
      <td class="amTableSelectRow"><div>102</div></td>
      <td class="amTableSelectRow"><div>108</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>168</div></td>
      <td class="amTableSelectRow"><div>174</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1004.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>232</div></td><td><div>236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>301</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>216</div></td><td><div>102</div></td><td><div>108</div></td><td><div>296</div></td><td><div>304</div></td><td><div>168</div></td><td><div>174</div></td><td><div>0.00055</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1006.ON.CA"><span style="font-size:medium;">Unique genotype (5 of 16)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1006.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>181</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>198</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>114</div></td>
      <td class="amTableSelectRow"><div>116</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1006.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>198</div></td><td><div>202</div></td><td><div>114</div></td><td><div>116</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0012</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      <tr><td><div></div></td><td><div>1007.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>198</div></td><td><div>202</div></td><td><div>114</div></td><td><div>116</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0012</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1008.ON.CA"><span style="font-size:medium;">Unique genotype (6 of 16)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1008.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>CHECK_UNIQUE</div></td>
      </tr>
      <tr><td><div><span style="color:red; font-weight:bold;">!!!</span></div></td><td><div>1008.ON.CA</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0031</div></td><td><div>1</div></td><td><div>MULTIPLE_MATCH</div></td> </tr>
      <tr><td><div><span style="color:red; font-weight:bold;">!!!</span></div></td><td><div>1009.ON.CA</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0031</div></td><td><div>1</div></td><td><div>MULTIPLE_MATCH</div></td> </tr>
      <tr><td><div><span style="color:red; font-weight:bold;">!!!</span></div></td><td><div>1003.ON.CA</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div class="amMismatchAllele">242</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div class="amMismatchAllele">191</div></td><td><div>285</div></td><td><div class="amMismatchAllele">299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div class="amMismatchAllele">102</div></td><td><div>118</div></td><td><div class="amMismatchAllele">298</div></td><td><div>304</div></td><td><div>166</div></td><td><div class="amMismatchAllele">172</div></td><td><div>&nbsp; &nbsp; ---</div></td><td><div>0.7</div></td><td><div>MULTIPLE_MATCH</div></td> </tr>
      <tr><td><div><span style="color:red; font-weight:bold;">!!!</span></div></td><td><div>1005.ON.CA</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div class="amMismatchAllele">242</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div class="amMismatchAllele">191</div></td><td><div>285</div></td><td><div class="amMismatchAllele">299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div class="amMismatchAllele">102</div></td><td><div>118</div></td><td><div class="amMismatchAllele">298</div></td><td><div>304</div></td><td><div>166</div></td><td><div class="amMismatchAllele">172</div></td><td><div>&nbsp; &nbsp; ---</div></td><td><div>0.7</div></td><td><div>MULTIPLE_MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br><span style="color:red">multipleMatch samples, which match two or more unique genotypes, should be manually reviewed.  Please see supplementary documentation for more information</span><br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1010.ON.CA"><span style="font-size:medium;">Unique genotype (7 of 16)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1010.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>244</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>191</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>227</div></td>
      <td class="amTableSelectRow"><div>227</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>204</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>CHECK_UNIQUE</div></td>
      </tr>
      <tr><td><div><span style="color:red; font-weight:bold;">!!!</span></div></td><td><div>1010.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>230</div></td><td><div>244</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>191</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>227</div></td><td><div>227</div></td><td><div>202</div></td><td><div>204</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0014</div></td><td><div>1</div></td><td><div>MULTIPLE_MATCH</div></td> </tr>
      <tr><td><div><span style="color:red; font-weight:bold;">!!!</span></div></td><td><div>1002.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>230</div></td><td><div class="amMismatchAllele">236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMismatchAllele">181</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div class="amMismatchAllele">223</div></td><td><div class="amMismatchAllele">223</div></td><td><div>202</div></td><td><div class="amMismatchAllele">202</div></td><td><div>118</div></td><td><div>118</div></td><td><div class="amMismatchAllele">288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>&nbsp; &nbsp; ---</div></td><td><div>0.7</div></td><td><div>MULTIPLE_MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br><span style="color:red">multipleMatch samples, which match two or more unique genotypes, should be manually reviewed.  Please see supplementary documentation for more information</span><br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1011.ON.CA"><span style="font-size:medium;">Unique genotype (8 of 16)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1011.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>214</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>112</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>172</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1011.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>224</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div>214</div></td><td><div>106</div></td><td><div>112</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>172</div></td><td><div>0.002</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      <tr><td><div></div></td><td><div>1012.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>224</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div>214</div></td><td><div>106</div></td><td><div>112</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>172</div></td><td><div>0.002</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1013.ON.CA"><span style="font-size:medium;">Unique genotype (9 of 16)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1013.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>213</div></td>
      <td class="amTableSelectRow"><div>221</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>306</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>172</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1013.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>232</div></td><td><div>232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>213</div></td><td><div>221</div></td><td><div>210</div></td><td><div>210</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>306</div></td><td><div>166</div></td><td><div>172</div></td><td><div>0.0011</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1014.ON.CA"><span style="font-size:medium;">Unique genotype (10 of 16)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1014.ON.CA</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>238</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>199</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>301</div></td>
      <td class="amTableSelectRow"><div>213</div></td>
      <td class="amTableSelectRow"><div>213</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>102</div></td>
      <td class="amTableSelectRow"><div>108</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>174</div></td>
      <td class="amTableSelectRow"><div>174</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1014.ON.CA</div></td><td><div>384</div></td><td><div>384</div></td><td><div>232</div></td><td><div>238</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>199</div></td><td><div>299</div></td><td><div>301</div></td><td><div>213</div></td><td><div>213</div></td><td><div>210</div></td><td><div>210</div></td><td><div>102</div></td><td><div>108</div></td><td><div>296</div></td><td><div>296</div></td><td><div>174</div></td><td><div>174</div></td><td><div>0.00019</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1015.ON.CA"><span style="font-size:medium;">Unique genotype (11 of 16)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1015.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>216</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>306</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1015.ON.CA</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div>216</div></td><td><div>106</div></td><td><div>106</div></td><td><div>296</div></td><td><div>306</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0031</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1016.ON.CA"><span style="font-size:medium;">Unique genotype (12 of 16)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1016.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>213</div></td>
      <td class="amTableSelectRow"><div>221</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>112</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1016.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>213</div></td><td><div>221</div></td><td><div>210</div></td><td><div>210</div></td><td><div>106</div></td><td><div>112</div></td><td><div>288</div></td><td><div>288</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0016</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1017.ON.CA"><span style="font-size:medium;">Unique genotype (13 of 16)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1017.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>388</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>181</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1017.ON.CA</div></td><td><div>382</div></td><td><div>388</div></td><td><div>230</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>185</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>202</div></td><td><div>106</div></td><td><div>118</div></td><td><div>304</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0015</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1018.ON.CA"><span style="font-size:medium;">Unique genotype (14 of 16)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1018.ON.CA</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>199</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>198</div></td>
      <td class="amTableSelectRow"><div>204</div></td>
      <td class="amTableSelectRow"><div>116</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1018.ON.CA</div></td><td><div>384</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>199</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>198</div></td><td><div>204</div></td><td><div>116</div></td><td><div>118</div></td><td><div>296</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0015</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1019.ON.CA"><span style="font-size:medium;">Unique genotype (15 of 16)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1019.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>159</div></td>
      <td class="amTableSelectRow"><div>159</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>298</div></td>
      <td class="amTableSelectRow"><div>298</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1019.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div>159</div></td><td><div>159</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>202</div></td><td><div>106</div></td><td><div>118</div></td><td><div>298</div></td><td><div>298</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0025</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1020.ON.CA"><span style="font-size:medium;">Unique genotype (16 of 16)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1020.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>155</div></td>
      <td class="amTableSelectRow"><div>167</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>204</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1020.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div>155</div></td><td><div>167</div></td><td><div>185</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>204</div></td><td><div>106</div></td><td><div>106</div></td><td><div>296</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0016</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><span style="font-size:x-small;">Generated by allelematch:  an R package<br></span><span style="font-size:x-small;">To reference this analysis please use citation("allelematch")<br><br></span></div></body></html>

---

    Code
      paste("About to exercise", obj)
    Output
      [1] "About to exercise objExample5b"

---

    Code
      summary.amUnique(get(obj), csv = tmp)

---

    Code
      format(read.csv(tmp))
    Output
         uniqueGroup rowType uniqueIndex matchIndex nUniqueGroup alleleMismatch matchThreshold cutHeight         Psib score          samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b
      1            1  UNIQUE  1001.ON.CA 1001.ON.CA            1            6.6            0.7       0.3 0.0006281640    NA SiouxLookout-Jan-2004      F   382   384   230   236   -99   -99   185   185
      2            2  UNIQUE  1002.ON.CA 1002.ON.CA            2            6.6            0.7       0.3 0.0020308781    NA SiouxLookout-Jan-2004      F   382   384   230   236   -99   -99   181   193
      3            2   MATCH  1002.ON.CA 1010.ON.CA            2            6.6            0.7       0.3           NA  0.70 SiouxLookout-Jan-2004    -99   382   384   230   244   -99   -99   191   193
      4            3  UNIQUE  1003.ON.CA 1003.ON.CA            4            6.6            0.7       0.3 0.0002960865    NA SiouxLookout-Jan-2004      M   382   382   224   242   -99   -99   185   191
      5            3   MATCH  1003.ON.CA 1005.ON.CA            4            6.6            0.7       0.3 0.0002960865  1.00 SiouxLookout-Jan-2004      M   382   382   224   242   -99   -99   185   191
      6            3   MATCH  1003.ON.CA 1008.ON.CA            4            6.6            0.7       0.3           NA  0.73 SiouxLookout-Jan-2004      M   382   382   224   230   -99   -99   185   193
      7            3   MATCH  1003.ON.CA 1009.ON.CA            4            6.6            0.7       0.3           NA  0.73 SiouxLookout-Jan-2004      M   382   382   224   230   -99   -99   185   193
      8            4  UNIQUE  1004.ON.CA 1004.ON.CA            1            6.6            0.7       0.3 0.0002771051    NA SiouxLookout-Jan-2004      M   382   384   232   236   -99   -99   193   193
      9            5  UNIQUE  1006.ON.CA 1006.ON.CA            2            6.6            0.7       0.3 0.0006468261    NA SiouxLookout-Jan-2004      F   382   384   224   230   -99   -99   181   193
      10           5   MATCH  1006.ON.CA 1007.ON.CA            2            6.6            0.7       0.3 0.0006468261  1.00 SiouxLookout-Jan-2004      F   382   384   224   230   -99   -99   181   193
      11           6  UNIQUE  1011.ON.CA 1011.ON.CA            2            6.6            0.7       0.3 0.0012850590    NA SiouxLookout-Jan-2004      F   382   384   224   224   -99   -99   193   193
      12           6   MATCH  1011.ON.CA 1012.ON.CA            2            6.6            0.7       0.3 0.0012850590  1.00 SiouxLookout-Jan-2004      F   382   384   224   224   -99   -99   193   193
      13           7  UNIQUE  1013.ON.CA 1013.ON.CA            1            6.6            0.7       0.3 0.0004877973    NA SiouxLookout-Jan-2004      M   382   384   232   232   -99   -99   193   193
      14           8  UNIQUE  1014.ON.CA 1014.ON.CA            1            6.6            0.7       0.3 0.0001279790    NA SiouxLookout-Jan-2004      F   384   384   232   238   -99   -99   193   199
      15           9  UNIQUE  1015.ON.CA 1015.ON.CA            1            6.6            0.7       0.3 0.0018921797    NA SiouxLookout-Jan-2004      F   382   382   224   232   -99   -99   193   193
      16          10  UNIQUE  1016.ON.CA 1016.ON.CA            1            6.6            0.7       0.3 0.0008297756    NA SiouxLookout-Jan-2004      M   382   384   224   232   -99   -99   193   193
      17          11  UNIQUE  1017.ON.CA 1017.ON.CA            1            6.6            0.7       0.3 0.0007306465    NA SiouxLookout-Jan-2004      F   382   388   230   230   -99   -99   181   185
      18          12  UNIQUE  1018.ON.CA 1018.ON.CA            1            6.6            0.7       0.3 0.0007612510    NA SiouxLookout-Jan-2004      F   384   384   224   230   -99   -99   185   199
      19          13  UNIQUE  1019.ON.CA 1019.ON.CA            1            6.6            0.7       0.3 0.0013470538    NA SiouxLookout-Jan-2004      F   382   384   224   230   159   159   193   193
      20          14  UNIQUE  1020.ON.CA 1020.ON.CA            1            6.6            0.7       0.3 0.0008791343    NA SiouxLookout-Jan-2004      F   382   384   224   230   155   167   185   193
         LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b
      1    301   301   223   223   192   192   118   118   296   304    166    166
      2    299   299   223   223   202   202   118   118   288   296    166    166
      3    299   299   227   227   202   204   118   118   296   296    166    166
      4    285   299   223   223   192   202   102   118   298   304    166    172
      5    285   299   223   223   192   202   102   118   298   304    166    172
      6    285   285   223   223   192   202   118   118   296   304    166    166
      7    285   285   223   223   192   202   118   118   296   304    166    166
      8    299   301   223   223   192   216   102   108   296   304    168    174
      9    285   285   223   223   198   202   114   116   288   296    166    166
      10   285   285   223   223   198   202   114   116   288   296    166    166
      11   299   299   223   223   210   214   106   112   288   296    166    172
      12   299   299   223   223   210   214   106   112   288   296    166    172
      13   299   299   213   221   210   210   118   118   296   306    166    172
      14   299   301   213   213   210   210   102   108   296   296    174    174
      15   299   299   223   223   210   216   106   106   296   306    166    166
      16   -99   -99   213   221   210   210   106   112   288   288    166    166
      17   285   299   223   223   202   202   106   118   304   304    166    166
      18   285   299   223   223   198   204   116   118   296   296    166    166
      19   299   299   223   223   202   202   106   118   298   298    166    166
      20   299   299   223   223   202   204   106   106   296   304    166    166

---

    Code
      summary.amUnique(get(obj), html = tmp)

---

    Code
      cat(sub("summary generated: </b><em>.+?</em>", "summary generated: </b><em>(date)</em>", gsub("(\\t| )+?(\\n|$)", "\\2", readLines(tmp, warn = FALSE), perl = TRUE), perl = TRUE), sep = "\n")
    Output
      <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
      
               <html xmlns='http://www.w3.org/1999/xhtml' xml:lang='en' lang='en'><head>
      
              <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
      <title>allelematch: amUnique() output</title><style type="text/css">
      
              html {
                  height: 100%;
              }
      
              body {
                  background-color: inherit;
                  color: inherit;
                  font-family: Verdana;
                  font-size: xx-small;
                  margin: 0;
                  height: 100%;
      
              }
      
              a:active {
                  color: #CC0000;
              }
      
              a:link {
                  color: #CC0000;
              }
      
              a:visited {
                  color: #CC0000;
              }
      
              .amMismatchAllele {
                  background-color: #CC0000;
                  color: white;
                  font-weight: bold;
              }
      
              .amMissingAllele {
                  background-color: #FFCCCC;
              }
      
              .amInterpolatedAllele {
                  background-color: blue;
                  color: white;
              }
      
              .amGrid {
                  border-collapse: separate;
              }
      
              .amGridContent {
                  padding: 0;
                  border: 1px solid #7EACB1;
              }
      
      
              .amGridUpperPanel, .amGridLowerPanel {
                  padding: 3px;
                  border-left: 0;
                  border-right: 0;
                  background-color: #F4FAFB;
                  color: #2A769D;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
              .amGridUpperPanel {
                  border-top: 0px;
                  border-bottom: 1px solid;
                  border-color: #7EACB1;
              }
      
              .amGridMiddlePanel {
                  border: 0;
              }
      
              .amGridLowerPanel {
                  border-top: 1px solid;
                  border-bottom: 0px;
                  border-color: #C2D4DA;
              }
      
              .amGridUpperPanel td, .amGridLowerPanel td {
                  color: #2A769D;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
      
              .amTable {
                  border: 0;
                  border-spacing: 0;
                  border-collapse: collapse;
                  empty-cells: show;
                  width: 100%;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
              .amTableSeparate {
                  border-collapse: separate;
              }
      
              .amTable td {
                  padding: 3px;
                  border-bottom: 1px solid;
                  border-top: 0px;
                  border-left: 0px;
                  border-right: 1px solid;
                  border-color: #C2D4DA;
                  white-space:nowrap;
              }
      
      
              .amTable .amTableHeader, .amTable .amTableHeader td {
                  background-color: #B7D8DC;
                  color: #000000;
                  border-bottom: 1px solid;
                  border-right: 1px solid;
                  border-color: #7EACB1;
                  background-repeat: repeat-x;
                  vertical-align: top;
                  white-space:nowrap;
              }
      
              .amPointer {
                  cursor: pointer;
              }
      
      
              .amTableHeaderBtn {
                  width: 100%;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
              .amTableHeader .amTableHeaderBtn td {
                  background: transparent;
                  padding: 0;
                  border: 0;
                  white-space: nowrap;
              }
      
              .amTableSelectRow {
                  background-color: #FFFF66;
                  color: #000000;
              }
      
      </style></head><body><div style="margin-left:5%; margin-right:5%"><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><div style="font-size:x-small;"><table><tr><td style="width:400px;"><span style="font-size:20px;">allelematch<br>unique analysis</span><br><br></td></tr>
      <tr><td><b>
      unique N=</b><em>14</em></td></tr>
       <tr><td><b>samples N=</b><em>20</em></td></tr>
       <tr><td><b><br>loci N=</b><em>11</em></td></tr>
       <tr><td><b>locus names: </b><em>samplingData-gender, LOC1a-LOC1b, LOC2a-LOC2b, LOC3a-LOC3b, LOC4a-LOC4b, LOC5a-LOC5b, LOC6a-LOC6b, LOC7a-LOC7b, LOC8a-LOC8b, LOC9a-LOC9b, LOC10a-LOC10b</em></td></tr>
       <tr><td><b><br>missing data represented by: </b><em>-99</em></td></tr>
       <tr><td><b>clustered genotypes consensus method: </b><em>1</em></td></tr>
       <tr><td><b>Psib calculated for: </b><em>samples with no mismatches</em></td></tr>
       <tr><td><b><br>alleleMismatch (m-hat; maximum number of mismatching alleles): </b><em>6.6</em></td></tr>
       <tr><td><b>cutHeight (d-hat; dynamic tree cutting height): </b><em>0.3</em></td></tr>
       <tr><td><b>matchThreshold (s-hat; lowest matching score returned): </b><em>0.7</em></td></tr>
       <tr><td><b><br>unclassified (samples that were not classified) N=</b><em>0</em></td></tr>
       <tr><td><b>multipleMatch (samples that match more than one unique genotype) N=</b><em>0</em></td></tr>
       <tr><td><b><br>Note: Unique genotypes are determined based on clustering of their scores followed by a dynamic tree cutting procedure (see supplementary documentation).</b><em>  Psib appears for reference purposes and is not used to determine unique genotypes.  It is calculated using allele frequencies in the unique genotype set.</em></td></tr>
       <tr><td><b><br>summary generated: </b><em>(date)</em></td></tr>
      </table></div></div></td></tr></table><br><br>
      <table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">Unique genotypes</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1001.ON.CA">Jump</a></div></td>
      <td><div>1001.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>F</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>230</div></td>
      <td><div>236</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>185</div></td>
      <td><div>185</div></td>
      <td><div>301</div></td>
      <td><div>301</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>192</div></td>
      <td><div>192</div></td>
      <td><div>118</div></td>
      <td><div>118</div></td>
      <td><div>296</div></td>
      <td><div>304</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.00063</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1002.ON.CA">Jump</a></div></td>
      <td><div>1002.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>F</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>230</div></td>
      <td><div>236</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>181</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>202</div></td>
      <td><div>202</div></td>
      <td><div>118</div></td>
      <td><div>118</div></td>
      <td><div>288</div></td>
      <td><div>296</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.002</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1003.ON.CA">Jump</a></div></td>
      <td><div>1003.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>M</div></td>
      <td><div>382</div></td>
      <td><div>382</div></td>
      <td><div>224</div></td>
      <td><div>242</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>185</div></td>
      <td><div>191</div></td>
      <td><div>285</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>192</div></td>
      <td><div>202</div></td>
      <td><div>102</div></td>
      <td><div>118</div></td>
      <td><div>298</div></td>
      <td><div>304</div></td>
      <td><div>166</div></td>
      <td><div>172</div></td>
      <td><div>0.0003</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1004.ON.CA">Jump</a></div></td>
      <td><div>1004.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>M</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>232</div></td>
      <td><div>236</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>193</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>301</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>192</div></td>
      <td><div>216</div></td>
      <td><div>102</div></td>
      <td><div>108</div></td>
      <td><div>296</div></td>
      <td><div>304</div></td>
      <td><div>168</div></td>
      <td><div>174</div></td>
      <td><div>0.00028</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1006.ON.CA">Jump</a></div></td>
      <td><div>1006.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>F</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>224</div></td>
      <td><div>230</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>181</div></td>
      <td><div>193</div></td>
      <td><div>285</div></td>
      <td><div>285</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>198</div></td>
      <td><div>202</div></td>
      <td><div>114</div></td>
      <td><div>116</div></td>
      <td><div>288</div></td>
      <td><div>296</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.00065</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1011.ON.CA">Jump</a></div></td>
      <td><div>1011.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>F</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>224</div></td>
      <td><div>224</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>193</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>210</div></td>
      <td><div>214</div></td>
      <td><div>106</div></td>
      <td><div>112</div></td>
      <td><div>288</div></td>
      <td><div>296</div></td>
      <td><div>166</div></td>
      <td><div>172</div></td>
      <td><div>0.0013</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1013.ON.CA">Jump</a></div></td>
      <td><div>1013.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>M</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>232</div></td>
      <td><div>232</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>193</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>299</div></td>
      <td><div>213</div></td>
      <td><div>221</div></td>
      <td><div>210</div></td>
      <td><div>210</div></td>
      <td><div>118</div></td>
      <td><div>118</div></td>
      <td><div>296</div></td>
      <td><div>306</div></td>
      <td><div>166</div></td>
      <td><div>172</div></td>
      <td><div>0.00049</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1014.ON.CA">Jump</a></div></td>
      <td><div>1014.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>F</div></td>
      <td><div>384</div></td>
      <td><div>384</div></td>
      <td><div>232</div></td>
      <td><div>238</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>193</div></td>
      <td><div>199</div></td>
      <td><div>299</div></td>
      <td><div>301</div></td>
      <td><div>213</div></td>
      <td><div>213</div></td>
      <td><div>210</div></td>
      <td><div>210</div></td>
      <td><div>102</div></td>
      <td><div>108</div></td>
      <td><div>296</div></td>
      <td><div>296</div></td>
      <td><div>174</div></td>
      <td><div>174</div></td>
      <td><div>0.00013</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1015.ON.CA">Jump</a></div></td>
      <td><div>1015.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>F</div></td>
      <td><div>382</div></td>
      <td><div>382</div></td>
      <td><div>224</div></td>
      <td><div>232</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>193</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>210</div></td>
      <td><div>216</div></td>
      <td><div>106</div></td>
      <td><div>106</div></td>
      <td><div>296</div></td>
      <td><div>306</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.0019</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1016.ON.CA">Jump</a></div></td>
      <td><div>1016.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>M</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>224</div></td>
      <td><div>232</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>193</div></td>
      <td><div>193</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>213</div></td>
      <td><div>221</div></td>
      <td><div>210</div></td>
      <td><div>210</div></td>
      <td><div>106</div></td>
      <td><div>112</div></td>
      <td><div>288</div></td>
      <td><div>288</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.00083</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1017.ON.CA">Jump</a></div></td>
      <td><div>1017.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>F</div></td>
      <td><div>382</div></td>
      <td><div>388</div></td>
      <td><div>230</div></td>
      <td><div>230</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>181</div></td>
      <td><div>185</div></td>
      <td><div>285</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>202</div></td>
      <td><div>202</div></td>
      <td><div>106</div></td>
      <td><div>118</div></td>
      <td><div>304</div></td>
      <td><div>304</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.00073</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1018.ON.CA">Jump</a></div></td>
      <td><div>1018.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>F</div></td>
      <td><div>384</div></td>
      <td><div>384</div></td>
      <td><div>224</div></td>
      <td><div>230</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>185</div></td>
      <td><div>199</div></td>
      <td><div>285</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>198</div></td>
      <td><div>204</div></td>
      <td><div>116</div></td>
      <td><div>118</div></td>
      <td><div>296</div></td>
      <td><div>296</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.00076</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1019.ON.CA">Jump</a></div></td>
      <td><div>1019.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>F</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>224</div></td>
      <td><div>230</div></td>
      <td><div>159</div></td>
      <td><div>159</div></td>
      <td><div>193</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>202</div></td>
      <td><div>202</div></td>
      <td><div>106</div></td>
      <td><div>118</div></td>
      <td><div>298</div></td>
      <td><div>298</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.0013</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1020.ON.CA">Jump</a></div></td>
      <td><div>1020.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>F</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>224</div></td>
      <td><div>230</div></td>
      <td><div>155</div></td>
      <td><div>167</div></td>
      <td><div>185</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>202</div></td>
      <td><div>204</div></td>
      <td><div>106</div></td>
      <td><div>106</div></td>
      <td><div>296</div></td>
      <td><div>304</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.00088</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      </table></div><div class="amGridLowerPanel"><span>There were 14 unique genotypes identified using the parameters supplied.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1001.ON.CA"><span style="font-size:medium;">Unique genotype (1 of 14)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1001.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>236</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>301</div></td>
      <td class="amTableSelectRow"><div>301</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1001.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>230</div></td><td><div>236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>185</div></td><td><div>301</div></td><td><div>301</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>192</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.00063</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1002.ON.CA"><span style="font-size:medium;">Unique genotype (2 of 14)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1002.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>236</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>181</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1002.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>230</div></td><td><div>236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>202</div></td><td><div>118</div></td><td><div>118</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.002</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      <tr><td><div></div></td><td><div>1010.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div class="amMissingAllele">-99</div></td><td><div>382</div></td><td><div>384</div></td><td><div>230</div></td><td><div class="amMismatchAllele">244</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMismatchAllele">191</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div class="amMismatchAllele">227</div></td><td><div class="amMismatchAllele">227</div></td><td><div>202</div></td><td><div class="amMismatchAllele">204</div></td><td><div>118</div></td><td><div>118</div></td><td><div class="amMismatchAllele">296</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>&nbsp; &nbsp; ---</div></td><td><div>0.7</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1003.ON.CA"><span style="font-size:medium;">Unique genotype (3 of 14)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1003.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>M</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>242</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>191</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>102</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>298</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>172</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1003.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>242</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>191</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>102</div></td><td><div>118</div></td><td><div>298</div></td><td><div>304</div></td><td><div>166</div></td><td><div>172</div></td><td><div>0.0003</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      <tr><td><div></div></td><td><div>1005.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>242</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>191</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>102</div></td><td><div>118</div></td><td><div>298</div></td><td><div>304</div></td><td><div>166</div></td><td><div>172</div></td><td><div>0.0003</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      <tr><td><div></div></td><td><div>1008.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div class="amMismatchAllele">230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div class="amMismatchAllele">193</div></td><td><div>285</div></td><td><div class="amMismatchAllele">285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div class="amMismatchAllele">118</div></td><td><div>118</div></td><td><div class="amMismatchAllele">296</div></td><td><div>304</div></td><td><div>166</div></td><td><div class="amMismatchAllele">166</div></td><td><div>&nbsp; &nbsp; ---</div></td><td><div>0.73</div></td><td><div>MATCH</div></td> </tr>
      <tr><td><div></div></td><td><div>1009.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div class="amMismatchAllele">230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div class="amMismatchAllele">193</div></td><td><div>285</div></td><td><div class="amMismatchAllele">285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div class="amMismatchAllele">118</div></td><td><div>118</div></td><td><div class="amMismatchAllele">296</div></td><td><div>304</div></td><td><div>166</div></td><td><div class="amMismatchAllele">166</div></td><td><div>&nbsp; &nbsp; ---</div></td><td><div>0.73</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1004.ON.CA"><span style="font-size:medium;">Unique genotype (4 of 14)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1004.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>M</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>236</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>301</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>216</div></td>
      <td class="amTableSelectRow"><div>102</div></td>
      <td class="amTableSelectRow"><div>108</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>168</div></td>
      <td class="amTableSelectRow"><div>174</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1004.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>384</div></td><td><div>232</div></td><td><div>236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>301</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>216</div></td><td><div>102</div></td><td><div>108</div></td><td><div>296</div></td><td><div>304</div></td><td><div>168</div></td><td><div>174</div></td><td><div>0.00028</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1006.ON.CA"><span style="font-size:medium;">Unique genotype (5 of 14)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1006.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>181</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>198</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>114</div></td>
      <td class="amTableSelectRow"><div>116</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1006.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>198</div></td><td><div>202</div></td><td><div>114</div></td><td><div>116</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.00065</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      <tr><td><div></div></td><td><div>1007.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>198</div></td><td><div>202</div></td><td><div>114</div></td><td><div>116</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.00065</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1011.ON.CA"><span style="font-size:medium;">Unique genotype (6 of 14)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1011.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>214</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>112</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>172</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1011.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>224</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div>214</div></td><td><div>106</div></td><td><div>112</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>172</div></td><td><div>0.0013</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      <tr><td><div></div></td><td><div>1012.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>224</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div>214</div></td><td><div>106</div></td><td><div>112</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>172</div></td><td><div>0.0013</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1013.ON.CA"><span style="font-size:medium;">Unique genotype (7 of 14)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1013.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>M</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>213</div></td>
      <td class="amTableSelectRow"><div>221</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>306</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>172</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1013.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>384</div></td><td><div>232</div></td><td><div>232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>213</div></td><td><div>221</div></td><td><div>210</div></td><td><div>210</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>306</div></td><td><div>166</div></td><td><div>172</div></td><td><div>0.00049</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1014.ON.CA"><span style="font-size:medium;">Unique genotype (8 of 14)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1014.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>238</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>199</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>301</div></td>
      <td class="amTableSelectRow"><div>213</div></td>
      <td class="amTableSelectRow"><div>213</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>102</div></td>
      <td class="amTableSelectRow"><div>108</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>174</div></td>
      <td class="amTableSelectRow"><div>174</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1014.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>384</div></td><td><div>384</div></td><td><div>232</div></td><td><div>238</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>199</div></td><td><div>299</div></td><td><div>301</div></td><td><div>213</div></td><td><div>213</div></td><td><div>210</div></td><td><div>210</div></td><td><div>102</div></td><td><div>108</div></td><td><div>296</div></td><td><div>296</div></td><td><div>174</div></td><td><div>174</div></td><td><div>0.00013</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1015.ON.CA"><span style="font-size:medium;">Unique genotype (9 of 14)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1015.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>216</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>306</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1015.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div>216</div></td><td><div>106</div></td><td><div>106</div></td><td><div>296</div></td><td><div>306</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0019</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1016.ON.CA"><span style="font-size:medium;">Unique genotype (10 of 14)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1016.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>M</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>213</div></td>
      <td class="amTableSelectRow"><div>221</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>112</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1016.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>213</div></td><td><div>221</div></td><td><div>210</div></td><td><div>210</div></td><td><div>106</div></td><td><div>112</div></td><td><div>288</div></td><td><div>288</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.00083</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1017.ON.CA"><span style="font-size:medium;">Unique genotype (11 of 14)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1017.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>388</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>181</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1017.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>388</div></td><td><div>230</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>185</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>202</div></td><td><div>106</div></td><td><div>118</div></td><td><div>304</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.00073</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1018.ON.CA"><span style="font-size:medium;">Unique genotype (12 of 14)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1018.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>199</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>198</div></td>
      <td class="amTableSelectRow"><div>204</div></td>
      <td class="amTableSelectRow"><div>116</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1018.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>384</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>199</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>198</div></td><td><div>204</div></td><td><div>116</div></td><td><div>118</div></td><td><div>296</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.00076</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1019.ON.CA"><span style="font-size:medium;">Unique genotype (13 of 14)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1019.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>159</div></td>
      <td class="amTableSelectRow"><div>159</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>298</div></td>
      <td class="amTableSelectRow"><div>298</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1019.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div>159</div></td><td><div>159</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>202</div></td><td><div>106</div></td><td><div>118</div></td><td><div>298</div></td><td><div>298</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0013</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1020.ON.CA"><span style="font-size:medium;">Unique genotype (14 of 14)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1020.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>155</div></td>
      <td class="amTableSelectRow"><div>167</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>204</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1020.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div>155</div></td><td><div>167</div></td><td><div>185</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>204</div></td><td><div>106</div></td><td><div>106</div></td><td><div>296</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.00088</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><span style="font-size:x-small;">Generated by allelematch:  an R package<br></span><span style="font-size:x-small;">To reference this analysis please use citation("allelematch")<br><br></span></div></body></html>

---

    Code
      paste("About to exercise", obj)
    Output
      [1] "About to exercise objExample5c"

---

    Code
      summary.amUnique(get(obj), csv = tmp)

---

    Code
      format(read.csv(tmp))
    Output
         uniqueGroup rowType uniqueIndex matchIndex nUniqueGroup alleleMismatch matchThreshold cutHeight         Psib score              metaData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b
      1            1  UNIQUE  1001.ON.CA 1001.ON.CA            1            6.3            0.7       0.3 0.0008193429    NA SiouxLookout-Jan-2004      F   382   384   230   236   -99   -99   185   185
      2            2  UNIQUE  1002.ON.CA 1002.ON.CA            1            6.3            0.7       0.3 0.0029188443    NA SiouxLookout-Jan-2004      F   382   384   230   236   -99   -99   181   193
      3            3  UNIQUE  1003.ON.CA 1003.ON.CA            4            6.3            0.7       0.3 0.0002605335    NA SiouxLookout-Jan-2004      M   382   382   224   242   -99   -99   185   191
      4            3   MATCH  1003.ON.CA 1005.ON.CA            4            6.3            0.7       0.3 0.0002605335  1.00 SiouxLookout-Jan-2004      M   382   382   224   242   -99   -99   185   191
      5            3   MATCH  1003.ON.CA 1008.ON.CA            4            6.3            0.7       0.3           NA  0.71 SiouxLookout-Jan-2004      M   382   382   224   230   -99   -99   185   193
      6            3   MATCH  1003.ON.CA 1009.ON.CA            4            6.3            0.7       0.3           NA  0.71 SiouxLookout-Jan-2004      M   382   382   224   230   -99   -99   185   193
      7            4  UNIQUE  1004.ON.CA 1004.ON.CA            1            6.3            0.7       0.3 0.0002319329    NA SiouxLookout-Jan-2004      M   382   384   232   236   -99   -99   193   193
      8            5  UNIQUE  1006.ON.CA 1006.ON.CA            2            6.3            0.7       0.3 0.0008031958    NA SiouxLookout-Jan-2004      F   382   384   224   230   -99   -99   181   193
      9            5   MATCH  1006.ON.CA 1007.ON.CA            2            6.3            0.7       0.3 0.0008031958  1.00 SiouxLookout-Jan-2004      F   382   384   224   230   -99   -99   181   193
      10           6  UNIQUE  1010.ON.CA 1010.ON.CA            1            6.3            0.7       0.3 0.0013584285    NA SiouxLookout-Jan-2004    -99   382   384   230   244   -99   -99   191   193
      11           7  UNIQUE  1011.ON.CA 1011.ON.CA            2            6.3            0.7       0.3 0.0015609786    NA SiouxLookout-Jan-2004      F   382   384   224   224   -99   -99   193   193
      12           7   MATCH  1011.ON.CA 1012.ON.CA            2            6.3            0.7       0.3 0.0015609786  1.00 SiouxLookout-Jan-2004      F   382   384   224   224   -99   -99   193   193
      13           8  UNIQUE  1013.ON.CA 1013.ON.CA            1            6.3            0.7       0.3 0.0004715178    NA SiouxLookout-Jan-2004      M   382   384   232   232   -99   -99   193   193
      14           9  UNIQUE  1014.ON.CA 1014.ON.CA            1            6.3            0.7       0.3 0.0001638343    NA SiouxLookout-Jan-2004      F   384   384   232   238   -99   -99   193   199
      15          10  UNIQUE  1015.ON.CA 1015.ON.CA            1            6.3            0.7       0.3 0.0023215343    NA SiouxLookout-Jan-2004      F   382   382   224   232   -99   -99   193   193
      16          11  UNIQUE  1016.ON.CA 1016.ON.CA            1            6.3            0.7       0.3 0.0006932383    NA SiouxLookout-Jan-2004      M   382   384   224   232   -99   -99   193   193
      17          12  UNIQUE  1017.ON.CA 1017.ON.CA            1            6.3            0.7       0.3 0.0009421490    NA SiouxLookout-Jan-2004      F   382   388   230   230   -99   -99   181   185
      18          13  UNIQUE  1018.ON.CA 1018.ON.CA            1            6.3            0.7       0.3 0.0010542301    NA SiouxLookout-Jan-2004      F   384   384   224   230   -99   -99   185   199
      19          14  UNIQUE  1019.ON.CA 1019.ON.CA            1            6.3            0.7       0.3 0.0017907609    NA SiouxLookout-Jan-2004      F   382   384   224   230   159   159   193   193
      20          15  UNIQUE  1020.ON.CA 1020.ON.CA            1            6.3            0.7       0.3 0.0011584678    NA SiouxLookout-Jan-2004      F   382   384   224   230   155   167   185   193
         LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b
      1    301   301   223   223   192   192   118   118   296   304    166    166
      2    299   299   223   223   202   202   118   118   288   296    166    166
      3    285   299   223   223   192   202   102   118   298   304    166    172
      4    285   299   223   223   192   202   102   118   298   304    166    172
      5    285   285   223   223   192   202   118   118   296   304    166    166
      6    285   285   223   223   192   202   118   118   296   304    166    166
      7    299   301   223   223   192   216   102   108   296   304    168    174
      8    285   285   223   223   198   202   114   116   288   296    166    166
      9    285   285   223   223   198   202   114   116   288   296    166    166
      10   299   299   227   227   202   204   118   118   296   296    166    166
      11   299   299   223   223   210   214   106   112   288   296    166    172
      12   299   299   223   223   210   214   106   112   288   296    166    172
      13   299   299   213   221   210   210   118   118   296   306    166    172
      14   299   301   213   213   210   210   102   108   296   296    174    174
      15   299   299   223   223   210   216   106   106   296   306    166    166
      16   -99   -99   213   221   210   210   106   112   288   288    166    166
      17   285   299   223   223   202   202   106   118   304   304    166    166
      18   285   299   223   223   198   204   116   118   296   296    166    166
      19   299   299   223   223   202   202   106   118   298   298    166    166
      20   299   299   223   223   202   204   106   106   296   304    166    166

---

    Code
      summary.amUnique(get(obj), html = tmp)

---

    Code
      cat(sub("summary generated: </b><em>.+?</em>", "summary generated: </b><em>(date)</em>", gsub("(\\t| )+?(\\n|$)", "\\2", readLines(tmp, warn = FALSE), perl = TRUE), perl = TRUE), sep = "\n")
    Output
      <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
      
               <html xmlns='http://www.w3.org/1999/xhtml' xml:lang='en' lang='en'><head>
      
              <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
      <title>allelematch: amUnique() output</title><style type="text/css">
      
              html {
                  height: 100%;
              }
      
              body {
                  background-color: inherit;
                  color: inherit;
                  font-family: Verdana;
                  font-size: xx-small;
                  margin: 0;
                  height: 100%;
      
              }
      
              a:active {
                  color: #CC0000;
              }
      
              a:link {
                  color: #CC0000;
              }
      
              a:visited {
                  color: #CC0000;
              }
      
              .amMismatchAllele {
                  background-color: #CC0000;
                  color: white;
                  font-weight: bold;
              }
      
              .amMissingAllele {
                  background-color: #FFCCCC;
              }
      
              .amInterpolatedAllele {
                  background-color: blue;
                  color: white;
              }
      
              .amGrid {
                  border-collapse: separate;
              }
      
              .amGridContent {
                  padding: 0;
                  border: 1px solid #7EACB1;
              }
      
      
              .amGridUpperPanel, .amGridLowerPanel {
                  padding: 3px;
                  border-left: 0;
                  border-right: 0;
                  background-color: #F4FAFB;
                  color: #2A769D;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
              .amGridUpperPanel {
                  border-top: 0px;
                  border-bottom: 1px solid;
                  border-color: #7EACB1;
              }
      
              .amGridMiddlePanel {
                  border: 0;
              }
      
              .amGridLowerPanel {
                  border-top: 1px solid;
                  border-bottom: 0px;
                  border-color: #C2D4DA;
              }
      
              .amGridUpperPanel td, .amGridLowerPanel td {
                  color: #2A769D;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
      
              .amTable {
                  border: 0;
                  border-spacing: 0;
                  border-collapse: collapse;
                  empty-cells: show;
                  width: 100%;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
              .amTableSeparate {
                  border-collapse: separate;
              }
      
              .amTable td {
                  padding: 3px;
                  border-bottom: 1px solid;
                  border-top: 0px;
                  border-left: 0px;
                  border-right: 1px solid;
                  border-color: #C2D4DA;
                  white-space:nowrap;
              }
      
      
              .amTable .amTableHeader, .amTable .amTableHeader td {
                  background-color: #B7D8DC;
                  color: #000000;
                  border-bottom: 1px solid;
                  border-right: 1px solid;
                  border-color: #7EACB1;
                  background-repeat: repeat-x;
                  vertical-align: top;
                  white-space:nowrap;
              }
      
              .amPointer {
                  cursor: pointer;
              }
      
      
              .amTableHeaderBtn {
                  width: 100%;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
              .amTableHeader .amTableHeaderBtn td {
                  background: transparent;
                  padding: 0;
                  border: 0;
                  white-space: nowrap;
              }
      
              .amTableSelectRow {
                  background-color: #FFFF66;
                  color: #000000;
              }
      
      </style></head><body><div style="margin-left:5%; margin-right:5%"><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><div style="font-size:x-small;"><table><tr><td style="width:400px;"><span style="font-size:20px;">allelematch<br>unique analysis</span><br><br></td></tr>
      <tr><td><b>
      unique N=</b><em>15</em></td></tr>
       <tr><td><b>samples N=</b><em>20</em></td></tr>
       <tr><td><b><br>loci N=</b><em>11</em></td></tr>
       <tr><td><b>locus names: </b><em>gender, LOC1a-LOC1b, LOC2a-LOC2b, LOC3a-LOC3b, LOC4a-LOC4b, LOC5a-LOC5b, LOC6a-LOC6b, LOC7a-LOC7b, LOC8a-LOC8b, LOC9a-LOC9b, LOC10a-LOC10b</em></td></tr>
       <tr><td><b><br>missing data represented by: </b><em>-99</em></td></tr>
       <tr><td><b>clustered genotypes consensus method: </b><em>1</em></td></tr>
       <tr><td><b>Psib calculated for: </b><em>samples with no mismatches</em></td></tr>
       <tr><td><b><br>alleleMismatch (m-hat; maximum number of mismatching alleles): </b><em>6.3</em></td></tr>
       <tr><td><b>cutHeight (d-hat; dynamic tree cutting height): </b><em>0.3</em></td></tr>
       <tr><td><b>matchThreshold (s-hat; lowest matching score returned): </b><em>0.7</em></td></tr>
       <tr><td><b><br>unclassified (samples that were not classified) N=</b><em>0</em></td></tr>
       <tr><td><b>multipleMatch (samples that match more than one unique genotype) N=</b><em>0</em></td></tr>
       <tr><td><b><br>Note: Unique genotypes are determined based on clustering of their scores followed by a dynamic tree cutting procedure (see supplementary documentation).</b><em>  Psib appears for reference purposes and is not used to determine unique genotypes.  It is calculated using allele frequencies in the unique genotype set.</em></td></tr>
       <tr><td><b><br>summary generated: </b><em>(date)</em></td></tr>
      </table></div></div></td></tr></table><br><br>
      <table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">Unique genotypes</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1001.ON.CA">Jump</a></div></td>
      <td><div>1001.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>F</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>230</div></td>
      <td><div>236</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>185</div></td>
      <td><div>185</div></td>
      <td><div>301</div></td>
      <td><div>301</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>192</div></td>
      <td><div>192</div></td>
      <td><div>118</div></td>
      <td><div>118</div></td>
      <td><div>296</div></td>
      <td><div>304</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.00082</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1002.ON.CA">Jump</a></div></td>
      <td><div>1002.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>F</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>230</div></td>
      <td><div>236</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>181</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>202</div></td>
      <td><div>202</div></td>
      <td><div>118</div></td>
      <td><div>118</div></td>
      <td><div>288</div></td>
      <td><div>296</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.0029</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1003.ON.CA">Jump</a></div></td>
      <td><div>1003.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>M</div></td>
      <td><div>382</div></td>
      <td><div>382</div></td>
      <td><div>224</div></td>
      <td><div>242</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>185</div></td>
      <td><div>191</div></td>
      <td><div>285</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>192</div></td>
      <td><div>202</div></td>
      <td><div>102</div></td>
      <td><div>118</div></td>
      <td><div>298</div></td>
      <td><div>304</div></td>
      <td><div>166</div></td>
      <td><div>172</div></td>
      <td><div>0.00026</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1004.ON.CA">Jump</a></div></td>
      <td><div>1004.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>M</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>232</div></td>
      <td><div>236</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>193</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>301</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>192</div></td>
      <td><div>216</div></td>
      <td><div>102</div></td>
      <td><div>108</div></td>
      <td><div>296</div></td>
      <td><div>304</div></td>
      <td><div>168</div></td>
      <td><div>174</div></td>
      <td><div>0.00023</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1006.ON.CA">Jump</a></div></td>
      <td><div>1006.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>F</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>224</div></td>
      <td><div>230</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>181</div></td>
      <td><div>193</div></td>
      <td><div>285</div></td>
      <td><div>285</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>198</div></td>
      <td><div>202</div></td>
      <td><div>114</div></td>
      <td><div>116</div></td>
      <td><div>288</div></td>
      <td><div>296</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.0008</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1010.ON.CA">Jump</a></div></td>
      <td><div>1010.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>-99</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>230</div></td>
      <td><div>244</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>191</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>299</div></td>
      <td><div>227</div></td>
      <td><div>227</div></td>
      <td><div>202</div></td>
      <td><div>204</div></td>
      <td><div>118</div></td>
      <td><div>118</div></td>
      <td><div>296</div></td>
      <td><div>296</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.0014</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1011.ON.CA">Jump</a></div></td>
      <td><div>1011.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>F</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>224</div></td>
      <td><div>224</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>193</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>210</div></td>
      <td><div>214</div></td>
      <td><div>106</div></td>
      <td><div>112</div></td>
      <td><div>288</div></td>
      <td><div>296</div></td>
      <td><div>166</div></td>
      <td><div>172</div></td>
      <td><div>0.0016</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1013.ON.CA">Jump</a></div></td>
      <td><div>1013.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>M</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>232</div></td>
      <td><div>232</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>193</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>299</div></td>
      <td><div>213</div></td>
      <td><div>221</div></td>
      <td><div>210</div></td>
      <td><div>210</div></td>
      <td><div>118</div></td>
      <td><div>118</div></td>
      <td><div>296</div></td>
      <td><div>306</div></td>
      <td><div>166</div></td>
      <td><div>172</div></td>
      <td><div>0.00047</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1014.ON.CA">Jump</a></div></td>
      <td><div>1014.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>F</div></td>
      <td><div>384</div></td>
      <td><div>384</div></td>
      <td><div>232</div></td>
      <td><div>238</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>193</div></td>
      <td><div>199</div></td>
      <td><div>299</div></td>
      <td><div>301</div></td>
      <td><div>213</div></td>
      <td><div>213</div></td>
      <td><div>210</div></td>
      <td><div>210</div></td>
      <td><div>102</div></td>
      <td><div>108</div></td>
      <td><div>296</div></td>
      <td><div>296</div></td>
      <td><div>174</div></td>
      <td><div>174</div></td>
      <td><div>0.00016</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1015.ON.CA">Jump</a></div></td>
      <td><div>1015.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>F</div></td>
      <td><div>382</div></td>
      <td><div>382</div></td>
      <td><div>224</div></td>
      <td><div>232</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>193</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>210</div></td>
      <td><div>216</div></td>
      <td><div>106</div></td>
      <td><div>106</div></td>
      <td><div>296</div></td>
      <td><div>306</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.0023</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1016.ON.CA">Jump</a></div></td>
      <td><div>1016.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>M</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>224</div></td>
      <td><div>232</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>193</div></td>
      <td><div>193</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>213</div></td>
      <td><div>221</div></td>
      <td><div>210</div></td>
      <td><div>210</div></td>
      <td><div>106</div></td>
      <td><div>112</div></td>
      <td><div>288</div></td>
      <td><div>288</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.00069</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1017.ON.CA">Jump</a></div></td>
      <td><div>1017.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>F</div></td>
      <td><div>382</div></td>
      <td><div>388</div></td>
      <td><div>230</div></td>
      <td><div>230</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>181</div></td>
      <td><div>185</div></td>
      <td><div>285</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>202</div></td>
      <td><div>202</div></td>
      <td><div>106</div></td>
      <td><div>118</div></td>
      <td><div>304</div></td>
      <td><div>304</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.00094</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1018.ON.CA">Jump</a></div></td>
      <td><div>1018.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>F</div></td>
      <td><div>384</div></td>
      <td><div>384</div></td>
      <td><div>224</div></td>
      <td><div>230</div></td>
      <td><div>-99</div></td>
      <td><div>-99</div></td>
      <td><div>185</div></td>
      <td><div>199</div></td>
      <td><div>285</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>198</div></td>
      <td><div>204</div></td>
      <td><div>116</div></td>
      <td><div>118</div></td>
      <td><div>296</div></td>
      <td><div>296</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.0011</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1019.ON.CA">Jump</a></div></td>
      <td><div>1019.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>F</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>224</div></td>
      <td><div>230</div></td>
      <td><div>159</div></td>
      <td><div>159</div></td>
      <td><div>193</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>202</div></td>
      <td><div>202</div></td>
      <td><div>106</div></td>
      <td><div>118</div></td>
      <td><div>298</div></td>
      <td><div>298</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.0018</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1020.ON.CA">Jump</a></div></td>
      <td><div>1020.ON.CA</div></td>
      <td><div>SiouxLookout-Jan-2004</div></td>
      <td><div>F</div></td>
      <td><div>382</div></td>
      <td><div>384</div></td>
      <td><div>224</div></td>
      <td><div>230</div></td>
      <td><div>155</div></td>
      <td><div>167</div></td>
      <td><div>185</div></td>
      <td><div>193</div></td>
      <td><div>299</div></td>
      <td><div>299</div></td>
      <td><div>223</div></td>
      <td><div>223</div></td>
      <td><div>202</div></td>
      <td><div>204</div></td>
      <td><div>106</div></td>
      <td><div>106</div></td>
      <td><div>296</div></td>
      <td><div>304</div></td>
      <td><div>166</div></td>
      <td><div>166</div></td>
      <td><div>0.0012</div></td>
      <td><div>UNIQUE</div></td>
      </tr>
      </table></div><div class="amGridLowerPanel"><span>There were 15 unique genotypes identified using the parameters supplied.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1001.ON.CA"><span style="font-size:medium;">Unique genotype (1 of 15)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1001.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>236</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>301</div></td>
      <td class="amTableSelectRow"><div>301</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1001.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>230</div></td><td><div>236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>185</div></td><td><div>301</div></td><td><div>301</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>192</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.00082</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1002.ON.CA"><span style="font-size:medium;">Unique genotype (2 of 15)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1002.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>236</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>181</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1002.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>230</div></td><td><div>236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>202</div></td><td><div>118</div></td><td><div>118</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0029</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1003.ON.CA"><span style="font-size:medium;">Unique genotype (3 of 15)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1003.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>M</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>242</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>191</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>102</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>298</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>172</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1003.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>242</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>191</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>102</div></td><td><div>118</div></td><td><div>298</div></td><td><div>304</div></td><td><div>166</div></td><td><div>172</div></td><td><div>0.00026</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      <tr><td><div></div></td><td><div>1005.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>242</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>191</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>102</div></td><td><div>118</div></td><td><div>298</div></td><td><div>304</div></td><td><div>166</div></td><td><div>172</div></td><td><div>0.00026</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      <tr><td><div></div></td><td><div>1008.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div class="amMismatchAllele">230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div class="amMismatchAllele">193</div></td><td><div>285</div></td><td><div class="amMismatchAllele">285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div class="amMismatchAllele">118</div></td><td><div>118</div></td><td><div class="amMismatchAllele">296</div></td><td><div>304</div></td><td><div>166</div></td><td><div class="amMismatchAllele">166</div></td><td><div>&nbsp; &nbsp; ---</div></td><td><div>0.71</div></td><td><div>MATCH</div></td> </tr>
      <tr><td><div></div></td><td><div>1009.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div class="amMismatchAllele">230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div class="amMismatchAllele">193</div></td><td><div>285</div></td><td><div class="amMismatchAllele">285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div class="amMismatchAllele">118</div></td><td><div>118</div></td><td><div class="amMismatchAllele">296</div></td><td><div>304</div></td><td><div>166</div></td><td><div class="amMismatchAllele">166</div></td><td><div>&nbsp; &nbsp; ---</div></td><td><div>0.71</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1004.ON.CA"><span style="font-size:medium;">Unique genotype (4 of 15)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1004.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>M</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>236</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>301</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>216</div></td>
      <td class="amTableSelectRow"><div>102</div></td>
      <td class="amTableSelectRow"><div>108</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>168</div></td>
      <td class="amTableSelectRow"><div>174</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1004.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>384</div></td><td><div>232</div></td><td><div>236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>301</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>216</div></td><td><div>102</div></td><td><div>108</div></td><td><div>296</div></td><td><div>304</div></td><td><div>168</div></td><td><div>174</div></td><td><div>0.00023</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1006.ON.CA"><span style="font-size:medium;">Unique genotype (5 of 15)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1006.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>181</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>198</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>114</div></td>
      <td class="amTableSelectRow"><div>116</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1006.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>198</div></td><td><div>202</div></td><td><div>114</div></td><td><div>116</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0008</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      <tr><td><div></div></td><td><div>1007.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>198</div></td><td><div>202</div></td><td><div>114</div></td><td><div>116</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0008</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1010.ON.CA"><span style="font-size:medium;">Unique genotype (6 of 15)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1010.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>244</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>191</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>227</div></td>
      <td class="amTableSelectRow"><div>227</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>204</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1010.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div class="amMissingAllele">-99</div></td><td><div>382</div></td><td><div>384</div></td><td><div>230</div></td><td><div>244</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>191</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>227</div></td><td><div>227</div></td><td><div>202</div></td><td><div>204</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0014</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1011.ON.CA"><span style="font-size:medium;">Unique genotype (7 of 15)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1011.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>214</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>112</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>172</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1011.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>224</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div>214</div></td><td><div>106</div></td><td><div>112</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>172</div></td><td><div>0.0016</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      <tr><td><div></div></td><td><div>1012.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>224</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div>214</div></td><td><div>106</div></td><td><div>112</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>172</div></td><td><div>0.0016</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1013.ON.CA"><span style="font-size:medium;">Unique genotype (8 of 15)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1013.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>M</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>213</div></td>
      <td class="amTableSelectRow"><div>221</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>306</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>172</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1013.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>384</div></td><td><div>232</div></td><td><div>232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>213</div></td><td><div>221</div></td><td><div>210</div></td><td><div>210</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>306</div></td><td><div>166</div></td><td><div>172</div></td><td><div>0.00047</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1014.ON.CA"><span style="font-size:medium;">Unique genotype (9 of 15)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1014.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>238</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>199</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>301</div></td>
      <td class="amTableSelectRow"><div>213</div></td>
      <td class="amTableSelectRow"><div>213</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>102</div></td>
      <td class="amTableSelectRow"><div>108</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>174</div></td>
      <td class="amTableSelectRow"><div>174</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1014.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>384</div></td><td><div>384</div></td><td><div>232</div></td><td><div>238</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>199</div></td><td><div>299</div></td><td><div>301</div></td><td><div>213</div></td><td><div>213</div></td><td><div>210</div></td><td><div>210</div></td><td><div>102</div></td><td><div>108</div></td><td><div>296</div></td><td><div>296</div></td><td><div>174</div></td><td><div>174</div></td><td><div>0.00016</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1015.ON.CA"><span style="font-size:medium;">Unique genotype (10 of 15)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1015.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>216</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>306</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1015.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div>216</div></td><td><div>106</div></td><td><div>106</div></td><td><div>296</div></td><td><div>306</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0023</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1016.ON.CA"><span style="font-size:medium;">Unique genotype (11 of 15)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1016.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>M</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>213</div></td>
      <td class="amTableSelectRow"><div>221</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>112</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1016.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>213</div></td><td><div>221</div></td><td><div>210</div></td><td><div>210</div></td><td><div>106</div></td><td><div>112</div></td><td><div>288</div></td><td><div>288</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.00069</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1017.ON.CA"><span style="font-size:medium;">Unique genotype (12 of 15)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1017.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>388</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>181</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1017.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>388</div></td><td><div>230</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>185</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>202</div></td><td><div>106</div></td><td><div>118</div></td><td><div>304</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.00094</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1018.ON.CA"><span style="font-size:medium;">Unique genotype (13 of 15)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1018.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>199</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>198</div></td>
      <td class="amTableSelectRow"><div>204</div></td>
      <td class="amTableSelectRow"><div>116</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1018.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>384</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>199</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>198</div></td><td><div>204</div></td><td><div>116</div></td><td><div>118</div></td><td><div>296</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0011</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1019.ON.CA"><span style="font-size:medium;">Unique genotype (14 of 15)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1019.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>159</div></td>
      <td class="amTableSelectRow"><div>159</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>298</div></td>
      <td class="amTableSelectRow"><div>298</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1019.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div>159</div></td><td><div>159</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>202</div></td><td><div>106</div></td><td><div>118</div></td><td><div>298</div></td><td><div>298</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0018</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1020.ON.CA"><span style="font-size:medium;">Unique genotype (15 of 15)</span></a></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Psib</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>1020.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>155</div></td>
      <td class="amTableSelectRow"><div>167</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>204</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div></div></td>
      <td class="amTableSelectRow"><div>UNIQUE</div></td>
      </tr>
      <tr><td><div></div></td><td><div>1020.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div>155</div></td><td><div>167</div></td><td><div>185</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>204</div></td><td><div>106</div></td><td><div>106</div></td><td><div>296</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.0012</div></td><td><div>1</div></td><td><div>MATCH</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Unique genotype compared against 20 samples, returning those with score>=0.7<br>Psib is calculated for samples that have no mismatches.  Differences among samples are due to loci with missing data.</div></td></tr></table><br><br><span style="font-size:x-small;">Generated by allelematch:  an R package<br></span><span style="font-size:x-small;">To reference this analysis please use citation("allelematch")<br><br></span></div></body></html>

