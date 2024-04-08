# Print

    Code
      paste("About to exercise", obj)
    Output
      [1] "About to exercise objMini"

---

    Code
      summary.amCluster(get(obj))
    Output
      allelematch
      amCluster object
      
      Focal dataset N=4
      Unique genotypes (total): 4
      Unique genotypes (by cluster consensus): 0
      Unique genotypes (singletons): 4
      
      Missing data represented by: -99
      Missing data matching method: 2
      Clustered genotypes consensus method: 1
      Hierarchical clustering method: complete
      Dynamic tree cutting height (cutHeight): 0.3
      
      Run until only singletons: TRUE
      Runs: 1
      
      Score flags:
      *101 Allele does not match
      +101 Allele is missing
      [101] Allele is interpolated in consensus from non-missing cluster members (consensusMethod = 2, 4 only)
      
      (Singleton 1 of 4)
                       LOC1a LOC1b LOC2a LOC2b score
      SINGLETON  AAA      11    21    31    41      
      CLOSEST    AAD     *14   *24  +-99   *44  0.12
      
      
      (Singleton 2 of 4)
                       LOC1a LOC1b LOC2a LOC2b score
      SINGLETON  AAB      12    22    32    42      
      CLOSEST    AAD     *14   *24  +-99   *44  0.12
      
      
      (Singleton 3 of 4)
                       LOC1a LOC1b LOC2a LOC2b score
      SINGLETON  AAC      13    23    33    43      
      CLOSEST    AAD     *14   *24  +-99   *44  0.12
      
      
      (Singleton 4 of 4)
                       LOC1a LOC1b LOC2a LOC2b score
      SINGLETON  AAD      14    24  +-99    44      
      CLOSEST    AAA     *11   *21   +31   *41  0.12
      
      
      (Singletons END)
      
      
      (Unique genotypes)
                       LOC1a LOC1b LOC2a LOC2b
      SINGLETON  AAA      11    21    31    41
      SINGLETON  AAB      12    22    32    42
      SINGLETON  AAC      13    23    33    43
      SINGLETON  AAD      14    24   -99    44

---

    Code
      amCSV.amCluster(get(obj), csvFile = tmp)

---

    Code
      format(read.csv(tmp))
    Output
        index LOC1a LOC1b LOC2a LOC2b
      1   AAA    11    21    31    41
      2   AAB    12    22    32    42
      3   AAC    13    23    33    43
      4   AAD    14    24   -99    44

---

    Code
      amHTML.amCluster(get(obj), htmlFile = tmp)

---

    Code
      cat(sub("summary generated: </b><em>.+?</em>", "summary generated: </b><em>(date)</em>", gsub("(\\t| )+?(\\n|$)", "\\2", readLines(tmp, warn = FALSE), perl = TRUE), perl = TRUE), sep = "\n")
    Output
      <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
      
               <html xmlns='http://www.w3.org/1999/xhtml' xml:lang='en' lang='en'><head>
      
              <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
      <title>allelematch: amCluster() output</title><style type="text/css">
      
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
      
      </style></head><body><div style="margin-left:5%; margin-right:5%"><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><div style="font-size:x-small;"><table><tr><td style="width:400px;"><span style="font-size:20px;">allelematch<br>cluster analysis</span><br><br></td></tr>
      <tr><td><b>
      Focal dataset N=</b><em>4</em></td></tr>
       <tr><td><b>unique N=</b><em>4</em></td></tr>
       <tr><td><b>unique (consensus) N=</b><em>0</em></td></tr>
       <tr><td><b>unique (singletons) N=</b><em>4</em></td></tr>
       <tr><td><b>missing data represented by: </b><em>-99</em></td></tr>
       <tr><td><b>missing data matching method: </b><em>2</em></td></tr>
       <tr><td><b>clustered genotypes consensus method: </b><em>1</em></td></tr>
       <tr><td><b>hierarchical clustering method: </b><em>complete</em></td></tr>
       <tr><td><b>cutHeight (d-hat; dynamic tree cutting height): </b><em>0.3</em></td></tr>
       <tr><td><b>run until only singletons: </b><em>TRUE</em></td></tr>
       <tr><td><b>runs: </b><em>1</em></td></tr>
       <tr><td><b>summary generated: </b><em>(date)</em></td></tr>
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#AAA">Jump</a></div></td>
      <td><div><a name="back_AAA">AAA</a></div></td>
      <td><div>11</div></td>
      <td><div>21</div></td>
      <td><div>31</div></td>
      <td><div>41</div></td>
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#AAB">Jump</a></div></td>
      <td><div><a name="back_AAB">AAB</a></div></td>
      <td><div>12</div></td>
      <td><div>22</div></td>
      <td><div>32</div></td>
      <td><div>42</div></td>
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#AAC">Jump</a></div></td>
      <td><div><a name="back_AAC">AAC</a></div></td>
      <td><div>13</div></td>
      <td><div>23</div></td>
      <td><div>33</div></td>
      <td><div>43</div></td>
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#AAD">Jump</a></div></td>
      <td><div><a name="back_AAD">AAD</a></div></td>
      <td><div>14</div></td>
      <td><div>24</div></td>
      <td><div>-99</div></td>
      <td><div>44</div></td>
      <td><div>SINGLETON</div></td>
      </tr>
      </table></div><div class="amGridLowerPanel"><span>There were 4 unique genotypes identified using the parameters supplied.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="AAA"><span style="font-size:medium;">(Singleton 1 of 4)</span></a><br><a href="#back_AAA">Jump up</a><br></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>AAA</div></td><td class="amTableSelectRow"><div>11</div></td><td class="amTableSelectRow"><div>21</div></td><td class="amTableSelectRow"><div>31</div></td><td class="amTableSelectRow"><div>41</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>AAD</div></td><td><div class="amMismatchAllele">14</div></td><td><div class="amMismatchAllele">24</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMismatchAllele">44</div></td><td><div>0.12</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="AAB"><span style="font-size:medium;">(Singleton 2 of 4)</span></a><br><a href="#back_AAB">Jump up</a><br></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>AAB</div></td><td class="amTableSelectRow"><div>12</div></td><td class="amTableSelectRow"><div>22</div></td><td class="amTableSelectRow"><div>32</div></td><td class="amTableSelectRow"><div>42</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>AAD</div></td><td><div class="amMismatchAllele">14</div></td><td><div class="amMismatchAllele">24</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMismatchAllele">44</div></td><td><div>0.12</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="AAC"><span style="font-size:medium;">(Singleton 3 of 4)</span></a><br><a href="#back_AAC">Jump up</a><br></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>AAC</div></td><td class="amTableSelectRow"><div>13</div></td><td class="amTableSelectRow"><div>23</div></td><td class="amTableSelectRow"><div>33</div></td><td class="amTableSelectRow"><div>43</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>AAD</div></td><td><div class="amMismatchAllele">14</div></td><td><div class="amMismatchAllele">24</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMismatchAllele">44</div></td><td><div>0.12</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="AAD"><span style="font-size:medium;">(Singleton 4 of 4)</span></a><br><a href="#back_AAD">Jump up</a><br></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>AAD</div></td><td class="amTableSelectRow"><div>14</div></td><td class="amTableSelectRow"><div>24</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>44</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>AAA</div></td><td><div class="amMismatchAllele">11</div></td><td><div class="amMismatchAllele">21</div></td><td><div class="amMissingAllele">31</div></td><td><div class="amMismatchAllele">41</div></td><td><div>0.12</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><span style="font-size:x-small;">Generated by allelematch:  an R package<br></span><span style="font-size:x-small;">To reference this analysis please use citation("allelematch")<br><br></span></div></body></html>

---

    Code
      paste("About to exercise", obj)
    Output
      [1] "About to exercise objExample5"

---

    Code
      summary.amCluster(get(obj))
    Output
      allelematch
      amCluster object
      
      Focal dataset N=20
      Unique genotypes (total): 16
      Unique genotypes (by cluster consensus): 0
      Unique genotypes (singletons): 16
      
      Missing data represented by: -99
      Missing data matching method: 2
      Clustered genotypes consensus method: 1
      Hierarchical clustering method: complete
      Dynamic tree cutting height (cutHeight): 0.3
      
      Run until only singletons: TRUE
      Runs: 2
      
      Score flags:
      *101 Allele does not match
      +101 Allele is missing
      [101] Allele is interpolated in consensus from non-missing cluster members (consensusMethod = 2, 4 only)
      
      (Singleton 1 of 16)
                              LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1002.ON.CA     382   384   230   236  +-99  +-99   181   193   299   299   223   223   202   202   118   118   288   296    166    166      
      CLOSEST    1010.ON.CA     382   384   230  *244  +-99  +-99  *191   193   299   299  *227  *227   202  *204   118   118  *296   296    166    166   0.7
      
      
      (Singleton 2 of 16)
                              LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1003.ON.CA     382   382   224   242  +-99  +-99   185   191   285   299   223   223   192   202   102   118   298   304    166    172      
      CLOSEST    1008.ON.CA     382   382   224  *230  +-99  +-99   185  *193   285  *285   223   223   192   202  *118   118  *296   304    166   *166   0.7
      
      
      (Singleton 3 of 16)
                              LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1008.ON.CA     382   382   224   230  +-99  +-99   185   193   285   285   223   223   192   202   118   118   296   304    166    166      
      CLOSEST    1003.ON.CA     382   382   224  *242  +-99  +-99   185  *191   285  *299   223   223   192   202  *102   118  *298   304    166   *172   0.7
      
      
      (Singleton 4 of 16)
                              LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1010.ON.CA     382   384   230   244  +-99  +-99   191   193   299   299   227   227   202   204   118   118   296   296    166    166      
      CLOSEST    1002.ON.CA     382   384   230  *236  +-99  +-99  *181   193   299   299  *223  *223   202  *202   118   118  *288   296    166    166   0.7
      
      
      (Singleton 5 of 16)
                              LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1001.ON.CA     382   384   230   236  +-99  +-99   185   185   301   301   223   223   192   192   118   118   296   304    166    166      
      CLOSEST    1008.ON.CA     382  *382  *224  *230  +-99  +-99   185  *193  *285  *285   223   223   192  *202   118   118   296   304    166    166  0.65
      
      
      (Singleton 6 of 16)
                              LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1006.ON.CA     382   384   224   230  +-99  +-99   181   193   285   285   223   223   198   202   114   116   288   296    166    166      
      CLOSEST    1002.ON.CA     382   384  *230  *236  +-99  +-99   181   193  *299  *299   223   223  *202   202  *118  *118   288   296    166    166  0.65
      
      
      (Singleton 7 of 16)
                              LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1011.ON.CA     382   384   224   224  +-99  +-99   193   193   299   299   223   223   210   214   106   112   288   296    166    172      
      CLOSEST    1015.ON.CA     382  *382   224  *232  +-99  +-99   193   193   299   299   223   223   210  *216   106  *106  *296  *306    166   *166  0.65
      
      
      (Singleton 8 of 16)
                              LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1013.ON.CA     382   384   232   232  +-99  +-99   193   193   299   299   213   221   210   210   118   118   296   306    166    172      
      CLOSEST    1016.ON.CA     382   384  *224   232  +-99  +-99   193   193  +-99  +-99   213   221   210   210  *106  *112  *288  *288    166   *166  0.65
      
      
      (Singleton 9 of 16)
                              LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1015.ON.CA     382   382   224   232  +-99  +-99   193   193   299   299   223   223   210   216   106   106   296   306    166    166      
      CLOSEST    1011.ON.CA     382  *384   224  *224  +-99  +-99   193   193   299   299   223   223   210  *214   106  *112  *288  *296    166   *172  0.65
      
      
      (Singleton 10 of 16)
                              LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1016.ON.CA     382   384   224   232  +-99  +-99   193   193  +-99  +-99   213   221   210   210   106   112   288   288    166    166      
      CLOSEST    1011.ON.CA     382   384   224  *224  +-99  +-99   193   193  +299  +299  *223  *223   210  *214   106   112   288  *296    166   *172  0.65
      
      
      (Singleton 11 of 16)
                              LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1017.ON.CA     382   388   230   230  +-99  +-99   181   185   285   299   223   223   202   202   106   118   304   304    166    166      
      CLOSEST    1002.ON.CA     382  *384   230  *236  +-99  +-99   181  *193  *299   299   223   223   202   202  *118   118  *288  *296    166    166  0.65
      
      
      (Singleton 12 of 16)
                              LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1019.ON.CA     382   384   224   230   159   159   193   193   299   299   223   223   202   202   106   118   298   298    166    166      
      CLOSEST    1002.ON.CA     382   384  *230  *236  +-99  +-99  *181   193   299   299   223   223   202   202  *118   118  *288  *296    166    166  0.65
      
      
      (Singleton 13 of 16)
                              LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1020.ON.CA     382   384   224   230   155   167   185   193   299   299   223   223   202   204   106   106   296   304    166    166      
      CLOSEST    1015.ON.CA     382  *382   224  *232  +-99  +-99  *193   193   299   299   223   223  *210  *216   106   106   296  *306    166    166  0.65
      
      
      (Singleton 14 of 16)
                              LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1018.ON.CA     384   384   224   230  +-99  +-99   185   199   285   299   223   223   198   204   116   118   296   296    166    166      
      CLOSEST    1006.ON.CA    *382   384   224   230  +-99  +-99  *181  *193   285  *285   223   223   198  *202  *114  *116  *288   296    166    166   0.6
      
      
      (Singleton 15 of 16)
                              LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1004.ON.CA     382   384   232   236  +-99  +-99   193   193   299   301   223   223   192   216   102   108   296   304    168    174      
      CLOSEST    1001.ON.CA     382   384  *230   236  +-99  +-99  *185  *185  *301   301   223   223   192  *192  *118  *118   296   304   *166   *166  0.55
      
      
      (Singleton 16 of 16)
                              LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1014.ON.CA     384   384   232   238  +-99  +-99   193   199   299   301   213   213   210   210   102   108   296   296    174    174      
      CLOSEST    1004.ON.CA    *382   384   232  *236  +-99  +-99   193  *193   299   301  *223  *223  *192  *216   102   108   296  *304   *168    174  0.55
      
      
      (Singletons END)
      
      
      (Unique genotypes)
                              LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b
      SINGLETON  1001.ON.CA     382   384   230   236   -99   -99   185   185   301   301   223   223   192   192   118   118   296   304    166    166
      SINGLETON  1002.ON.CA     382   384   230   236   -99   -99   181   193   299   299   223   223   202   202   118   118   288   296    166    166
      SINGLETON  1003.ON.CA     382   382   224   242   -99   -99   185   191   285   299   223   223   192   202   102   118   298   304    166    172
      SINGLETON  1004.ON.CA     382   384   232   236   -99   -99   193   193   299   301   223   223   192   216   102   108   296   304    168    174
      SINGLETON  1006.ON.CA     382   384   224   230   -99   -99   181   193   285   285   223   223   198   202   114   116   288   296    166    166
      SINGLETON  1008.ON.CA     382   382   224   230   -99   -99   185   193   285   285   223   223   192   202   118   118   296   304    166    166
      SINGLETON  1010.ON.CA     382   384   230   244   -99   -99   191   193   299   299   227   227   202   204   118   118   296   296    166    166
      SINGLETON  1011.ON.CA     382   384   224   224   -99   -99   193   193   299   299   223   223   210   214   106   112   288   296    166    172
      SINGLETON  1013.ON.CA     382   384   232   232   -99   -99   193   193   299   299   213   221   210   210   118   118   296   306    166    172
      SINGLETON  1014.ON.CA     384   384   232   238   -99   -99   193   199   299   301   213   213   210   210   102   108   296   296    174    174
      SINGLETON  1015.ON.CA     382   382   224   232   -99   -99   193   193   299   299   223   223   210   216   106   106   296   306    166    166
      SINGLETON  1016.ON.CA     382   384   224   232   -99   -99   193   193   -99   -99   213   221   210   210   106   112   288   288    166    166
      SINGLETON  1017.ON.CA     382   388   230   230   -99   -99   181   185   285   299   223   223   202   202   106   118   304   304    166    166
      SINGLETON  1018.ON.CA     384   384   224   230   -99   -99   185   199   285   299   223   223   198   204   116   118   296   296    166    166
      SINGLETON  1019.ON.CA     382   384   224   230   159   159   193   193   299   299   223   223   202   202   106   118   298   298    166    166
      SINGLETON  1020.ON.CA     382   384   224   230   155   167   185   193   299   299   223   223   202   204   106   106   296   304    166    166

---

    Code
      amCSV.amCluster(get(obj), csvFile = tmp)

---

    Code
      format(read.csv(tmp))
    Output
              index LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b
      1  1001.ON.CA   382   384   230   236   -99   -99   185   185   301   301   223   223   192   192   118   118   296   304    166    166
      2  1002.ON.CA   382   384   230   236   -99   -99   181   193   299   299   223   223   202   202   118   118   288   296    166    166
      3  1003.ON.CA   382   382   224   242   -99   -99   185   191   285   299   223   223   192   202   102   118   298   304    166    172
      4  1004.ON.CA   382   384   232   236   -99   -99   193   193   299   301   223   223   192   216   102   108   296   304    168    174
      5  1006.ON.CA   382   384   224   230   -99   -99   181   193   285   285   223   223   198   202   114   116   288   296    166    166
      6  1008.ON.CA   382   382   224   230   -99   -99   185   193   285   285   223   223   192   202   118   118   296   304    166    166
      7  1010.ON.CA   382   384   230   244   -99   -99   191   193   299   299   227   227   202   204   118   118   296   296    166    166
      8  1011.ON.CA   382   384   224   224   -99   -99   193   193   299   299   223   223   210   214   106   112   288   296    166    172
      9  1013.ON.CA   382   384   232   232   -99   -99   193   193   299   299   213   221   210   210   118   118   296   306    166    172
      10 1014.ON.CA   384   384   232   238   -99   -99   193   199   299   301   213   213   210   210   102   108   296   296    174    174
      11 1015.ON.CA   382   382   224   232   -99   -99   193   193   299   299   223   223   210   216   106   106   296   306    166    166
      12 1016.ON.CA   382   384   224   232   -99   -99   193   193   -99   -99   213   221   210   210   106   112   288   288    166    166
      13 1017.ON.CA   382   388   230   230   -99   -99   181   185   285   299   223   223   202   202   106   118   304   304    166    166
      14 1018.ON.CA   384   384   224   230   -99   -99   185   199   285   299   223   223   198   204   116   118   296   296    166    166
      15 1019.ON.CA   382   384   224   230   159   159   193   193   299   299   223   223   202   202   106   118   298   298    166    166
      16 1020.ON.CA   382   384   224   230   155   167   185   193   299   299   223   223   202   204   106   106   296   304    166    166

---

    Code
      amHTML.amCluster(get(obj), htmlFile = tmp)

---

    Code
      cat(sub("summary generated: </b><em>.+?</em>", "summary generated: </b><em>(date)</em>", gsub("(\\t| )+?(\\n|$)", "\\2", readLines(tmp, warn = FALSE), perl = TRUE), perl = TRUE), sep = "\n")
    Output
      <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
      
               <html xmlns='http://www.w3.org/1999/xhtml' xml:lang='en' lang='en'><head>
      
              <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
      <title>allelematch: amCluster() output</title><style type="text/css">
      
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
      
      </style></head><body><div style="margin-left:5%; margin-right:5%"><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><div style="font-size:x-small;"><table><tr><td style="width:400px;"><span style="font-size:20px;">allelematch<br>cluster analysis</span><br><br></td></tr>
      <tr><td><b>
      Focal dataset N=</b><em>20</em></td></tr>
       <tr><td><b>unique N=</b><em>16</em></td></tr>
       <tr><td><b>unique (consensus) N=</b><em>0</em></td></tr>
       <tr><td><b>unique (singletons) N=</b><em>16</em></td></tr>
       <tr><td><b>missing data represented by: </b><em>-99</em></td></tr>
       <tr><td><b>missing data matching method: </b><em>2</em></td></tr>
       <tr><td><b>clustered genotypes consensus method: </b><em>1</em></td></tr>
       <tr><td><b>hierarchical clustering method: </b><em>complete</em></td></tr>
       <tr><td><b>cutHeight (d-hat; dynamic tree cutting height): </b><em>0.3</em></td></tr>
       <tr><td><b>run until only singletons: </b><em>TRUE</em></td></tr>
       <tr><td><b>runs: </b><em>2</em></td></tr>
       <tr><td><b>summary generated: </b><em>(date)</em></td></tr>
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1001.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1001.ON.CA">1001.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1002.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1002.ON.CA">1002.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1003.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1003.ON.CA">1003.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1004.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1004.ON.CA">1004.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1006.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1006.ON.CA">1006.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1008.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1008.ON.CA">1008.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1010.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1010.ON.CA">1010.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1011.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1011.ON.CA">1011.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1013.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1013.ON.CA">1013.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1014.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1014.ON.CA">1014.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1015.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1015.ON.CA">1015.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1016.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1016.ON.CA">1016.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1017.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1017.ON.CA">1017.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1018.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1018.ON.CA">1018.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1019.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1019.ON.CA">1019.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1020.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1020.ON.CA">1020.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      </table></div><div class="amGridLowerPanel"><span>There were 16 unique genotypes identified using the parameters supplied.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1002.ON.CA"><span style="font-size:medium;">(Singleton 1 of 16)</span></a><br><a href="#back_1002.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1002.ON.CA</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>230</div></td><td class="amTableSelectRow"><div>236</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>181</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>202</div></td><td class="amTableSelectRow"><div>202</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>288</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1010.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>230</div></td><td><div class="amMismatchAllele">244</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMismatchAllele">191</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div class="amMismatchAllele">227</div></td><td><div class="amMismatchAllele">227</div></td><td><div>202</div></td><td><div class="amMismatchAllele">204</div></td><td><div>118</div></td><td><div>118</div></td><td><div class="amMismatchAllele">296</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.7</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1003.ON.CA"><span style="font-size:medium;">(Singleton 2 of 16)</span></a><br><a href="#back_1003.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1003.ON.CA</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>224</div></td><td class="amTableSelectRow"><div>242</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>185</div></td><td class="amTableSelectRow"><div>191</div></td><td class="amTableSelectRow"><div>285</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>192</div></td><td class="amTableSelectRow"><div>202</div></td><td class="amTableSelectRow"><div>102</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>298</div></td><td class="amTableSelectRow"><div>304</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>172</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1008.ON.CA</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div class="amMismatchAllele">230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div class="amMismatchAllele">193</div></td><td><div>285</div></td><td><div class="amMismatchAllele">285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div class="amMismatchAllele">118</div></td><td><div>118</div></td><td><div class="amMismatchAllele">296</div></td><td><div>304</div></td><td><div>166</div></td><td><div class="amMismatchAllele">166</div></td><td><div>0.7</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1008.ON.CA"><span style="font-size:medium;">(Singleton 3 of 16)</span></a><br><a href="#back_1008.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1008.ON.CA</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>224</div></td><td class="amTableSelectRow"><div>230</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>185</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>285</div></td><td class="amTableSelectRow"><div>285</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>192</div></td><td class="amTableSelectRow"><div>202</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>304</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1003.ON.CA</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div class="amMismatchAllele">242</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div class="amMismatchAllele">191</div></td><td><div>285</div></td><td><div class="amMismatchAllele">299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div class="amMismatchAllele">102</div></td><td><div>118</div></td><td><div class="amMismatchAllele">298</div></td><td><div>304</div></td><td><div>166</div></td><td><div class="amMismatchAllele">172</div></td><td><div>0.7</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1010.ON.CA"><span style="font-size:medium;">(Singleton 4 of 16)</span></a><br><a href="#back_1010.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1010.ON.CA</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>230</div></td><td class="amTableSelectRow"><div>244</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>191</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>227</div></td><td class="amTableSelectRow"><div>227</div></td><td class="amTableSelectRow"><div>202</div></td><td class="amTableSelectRow"><div>204</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1002.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>230</div></td><td><div class="amMismatchAllele">236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMismatchAllele">181</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div class="amMismatchAllele">223</div></td><td><div class="amMismatchAllele">223</div></td><td><div>202</div></td><td><div class="amMismatchAllele">202</div></td><td><div>118</div></td><td><div>118</div></td><td><div class="amMismatchAllele">288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.7</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1001.ON.CA"><span style="font-size:medium;">(Singleton 5 of 16)</span></a><br><a href="#back_1001.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1001.ON.CA</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>230</div></td><td class="amTableSelectRow"><div>236</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>185</div></td><td class="amTableSelectRow"><div>185</div></td><td class="amTableSelectRow"><div>301</div></td><td class="amTableSelectRow"><div>301</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>192</div></td><td class="amTableSelectRow"><div>192</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>304</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1008.ON.CA</div></td><td><div>382</div></td><td><div class="amMismatchAllele">382</div></td><td><div class="amMismatchAllele">224</div></td><td><div class="amMismatchAllele">230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div class="amMismatchAllele">193</div></td><td><div class="amMismatchAllele">285</div></td><td><div class="amMismatchAllele">285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div class="amMismatchAllele">202</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.65</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1006.ON.CA"><span style="font-size:medium;">(Singleton 6 of 16)</span></a><br><a href="#back_1006.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1006.ON.CA</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>224</div></td><td class="amTableSelectRow"><div>230</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>181</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>285</div></td><td class="amTableSelectRow"><div>285</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>198</div></td><td class="amTableSelectRow"><div>202</div></td><td class="amTableSelectRow"><div>114</div></td><td class="amTableSelectRow"><div>116</div></td><td class="amTableSelectRow"><div>288</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1002.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div class="amMismatchAllele">230</div></td><td><div class="amMismatchAllele">236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div class="amMismatchAllele">299</div></td><td><div class="amMismatchAllele">299</div></td><td><div>223</div></td><td><div>223</div></td><td><div class="amMismatchAllele">202</div></td><td><div>202</div></td><td><div class="amMismatchAllele">118</div></td><td><div class="amMismatchAllele">118</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.65</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1011.ON.CA"><span style="font-size:medium;">(Singleton 7 of 16)</span></a><br><a href="#back_1011.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1011.ON.CA</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>224</div></td><td class="amTableSelectRow"><div>224</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>210</div></td><td class="amTableSelectRow"><div>214</div></td><td class="amTableSelectRow"><div>106</div></td><td class="amTableSelectRow"><div>112</div></td><td class="amTableSelectRow"><div>288</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>172</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1015.ON.CA</div></td><td><div>382</div></td><td><div class="amMismatchAllele">382</div></td><td><div>224</div></td><td><div class="amMismatchAllele">232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div class="amMismatchAllele">216</div></td><td><div>106</div></td><td><div class="amMismatchAllele">106</div></td><td><div class="amMismatchAllele">296</div></td><td><div class="amMismatchAllele">306</div></td><td><div>166</div></td><td><div class="amMismatchAllele">166</div></td><td><div>0.65</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1013.ON.CA"><span style="font-size:medium;">(Singleton 8 of 16)</span></a><br><a href="#back_1013.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1013.ON.CA</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>232</div></td><td class="amTableSelectRow"><div>232</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>213</div></td><td class="amTableSelectRow"><div>221</div></td><td class="amTableSelectRow"><div>210</div></td><td class="amTableSelectRow"><div>210</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>306</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>172</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1016.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div class="amMismatchAllele">224</div></td><td><div>232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>213</div></td><td><div>221</div></td><td><div>210</div></td><td><div>210</div></td><td><div class="amMismatchAllele">106</div></td><td><div class="amMismatchAllele">112</div></td><td><div class="amMismatchAllele">288</div></td><td><div class="amMismatchAllele">288</div></td><td><div>166</div></td><td><div class="amMismatchAllele">166</div></td><td><div>0.65</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1015.ON.CA"><span style="font-size:medium;">(Singleton 9 of 16)</span></a><br><a href="#back_1015.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1015.ON.CA</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>224</div></td><td class="amTableSelectRow"><div>232</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>210</div></td><td class="amTableSelectRow"><div>216</div></td><td class="amTableSelectRow"><div>106</div></td><td class="amTableSelectRow"><div>106</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>306</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1011.ON.CA</div></td><td><div>382</div></td><td><div class="amMismatchAllele">384</div></td><td><div>224</div></td><td><div class="amMismatchAllele">224</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div class="amMismatchAllele">214</div></td><td><div>106</div></td><td><div class="amMismatchAllele">112</div></td><td><div class="amMismatchAllele">288</div></td><td><div class="amMismatchAllele">296</div></td><td><div>166</div></td><td><div class="amMismatchAllele">172</div></td><td><div>0.65</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1016.ON.CA"><span style="font-size:medium;">(Singleton 10 of 16)</span></a><br><a href="#back_1016.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1016.ON.CA</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>224</div></td><td class="amTableSelectRow"><div>232</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>213</div></td><td class="amTableSelectRow"><div>221</div></td><td class="amTableSelectRow"><div>210</div></td><td class="amTableSelectRow"><div>210</div></td><td class="amTableSelectRow"><div>106</div></td><td class="amTableSelectRow"><div>112</div></td><td class="amTableSelectRow"><div>288</div></td><td class="amTableSelectRow"><div>288</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1011.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div class="amMismatchAllele">224</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div class="amMissingAllele">299</div></td><td><div class="amMissingAllele">299</div></td><td><div class="amMismatchAllele">223</div></td><td><div class="amMismatchAllele">223</div></td><td><div>210</div></td><td><div class="amMismatchAllele">214</div></td><td><div>106</div></td><td><div>112</div></td><td><div>288</div></td><td><div class="amMismatchAllele">296</div></td><td><div>166</div></td><td><div class="amMismatchAllele">172</div></td><td><div>0.65</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1017.ON.CA"><span style="font-size:medium;">(Singleton 11 of 16)</span></a><br><a href="#back_1017.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1017.ON.CA</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>388</div></td><td class="amTableSelectRow"><div>230</div></td><td class="amTableSelectRow"><div>230</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>181</div></td><td class="amTableSelectRow"><div>185</div></td><td class="amTableSelectRow"><div>285</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>202</div></td><td class="amTableSelectRow"><div>202</div></td><td class="amTableSelectRow"><div>106</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>304</div></td><td class="amTableSelectRow"><div>304</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1002.ON.CA</div></td><td><div>382</div></td><td><div class="amMismatchAllele">384</div></td><td><div>230</div></td><td><div class="amMismatchAllele">236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div class="amMismatchAllele">193</div></td><td><div class="amMismatchAllele">299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>202</div></td><td><div class="amMismatchAllele">118</div></td><td><div>118</div></td><td><div class="amMismatchAllele">288</div></td><td><div class="amMismatchAllele">296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.65</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1019.ON.CA"><span style="font-size:medium;">(Singleton 12 of 16)</span></a><br><a href="#back_1019.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1019.ON.CA</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>224</div></td><td class="amTableSelectRow"><div>230</div></td><td class="amTableSelectRow"><div>159</div></td><td class="amTableSelectRow"><div>159</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>202</div></td><td class="amTableSelectRow"><div>202</div></td><td class="amTableSelectRow"><div>106</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>298</div></td><td class="amTableSelectRow"><div>298</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1002.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div class="amMismatchAllele">230</div></td><td><div class="amMismatchAllele">236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMismatchAllele">181</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>202</div></td><td><div class="amMismatchAllele">118</div></td><td><div>118</div></td><td><div class="amMismatchAllele">288</div></td><td><div class="amMismatchAllele">296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.65</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1020.ON.CA"><span style="font-size:medium;">(Singleton 13 of 16)</span></a><br><a href="#back_1020.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1020.ON.CA</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>224</div></td><td class="amTableSelectRow"><div>230</div></td><td class="amTableSelectRow"><div>155</div></td><td class="amTableSelectRow"><div>167</div></td><td class="amTableSelectRow"><div>185</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>202</div></td><td class="amTableSelectRow"><div>204</div></td><td class="amTableSelectRow"><div>106</div></td><td class="amTableSelectRow"><div>106</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>304</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1015.ON.CA</div></td><td><div>382</div></td><td><div class="amMismatchAllele">382</div></td><td><div>224</div></td><td><div class="amMismatchAllele">232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMismatchAllele">193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div class="amMismatchAllele">210</div></td><td><div class="amMismatchAllele">216</div></td><td><div>106</div></td><td><div>106</div></td><td><div>296</div></td><td><div class="amMismatchAllele">306</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.65</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1018.ON.CA"><span style="font-size:medium;">(Singleton 14 of 16)</span></a><br><a href="#back_1018.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1018.ON.CA</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>224</div></td><td class="amTableSelectRow"><div>230</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>185</div></td><td class="amTableSelectRow"><div>199</div></td><td class="amTableSelectRow"><div>285</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>198</div></td><td class="amTableSelectRow"><div>204</div></td><td class="amTableSelectRow"><div>116</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1006.ON.CA</div></td><td><div class="amMismatchAllele">382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMismatchAllele">181</div></td><td><div class="amMismatchAllele">193</div></td><td><div>285</div></td><td><div class="amMismatchAllele">285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>198</div></td><td><div class="amMismatchAllele">202</div></td><td><div class="amMismatchAllele">114</div></td><td><div class="amMismatchAllele">116</div></td><td><div class="amMismatchAllele">288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.6</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1004.ON.CA"><span style="font-size:medium;">(Singleton 15 of 16)</span></a><br><a href="#back_1004.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1004.ON.CA</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>232</div></td><td class="amTableSelectRow"><div>236</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>301</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>192</div></td><td class="amTableSelectRow"><div>216</div></td><td class="amTableSelectRow"><div>102</div></td><td class="amTableSelectRow"><div>108</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>304</div></td><td class="amTableSelectRow"><div>168</div></td><td class="amTableSelectRow"><div>174</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1001.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div class="amMismatchAllele">230</div></td><td><div>236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMismatchAllele">185</div></td><td><div class="amMismatchAllele">185</div></td><td><div class="amMismatchAllele">301</div></td><td><div>301</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div class="amMismatchAllele">192</div></td><td><div class="amMismatchAllele">118</div></td><td><div class="amMismatchAllele">118</div></td><td><div>296</div></td><td><div>304</div></td><td><div class="amMismatchAllele">166</div></td><td><div class="amMismatchAllele">166</div></td><td><div>0.55</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1014.ON.CA"><span style="font-size:medium;">(Singleton 16 of 16)</span></a><br><a href="#back_1014.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1014.ON.CA</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>232</div></td><td class="amTableSelectRow"><div>238</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>199</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>301</div></td><td class="amTableSelectRow"><div>213</div></td><td class="amTableSelectRow"><div>213</div></td><td class="amTableSelectRow"><div>210</div></td><td class="amTableSelectRow"><div>210</div></td><td class="amTableSelectRow"><div>102</div></td><td class="amTableSelectRow"><div>108</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>174</div></td><td class="amTableSelectRow"><div>174</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1004.ON.CA</div></td><td><div class="amMismatchAllele">382</div></td><td><div>384</div></td><td><div>232</div></td><td><div class="amMismatchAllele">236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div class="amMismatchAllele">193</div></td><td><div>299</div></td><td><div>301</div></td><td><div class="amMismatchAllele">223</div></td><td><div class="amMismatchAllele">223</div></td><td><div class="amMismatchAllele">192</div></td><td><div class="amMismatchAllele">216</div></td><td><div>102</div></td><td><div>108</div></td><td><div>296</div></td><td><div class="amMismatchAllele">304</div></td><td><div class="amMismatchAllele">168</div></td><td><div>174</div></td><td><div>0.55</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><span style="font-size:x-small;">Generated by allelematch:  an R package<br></span><span style="font-size:x-small;">To reference this analysis please use citation("allelematch")<br><br></span></div></body></html>

---

    Code
      paste("About to exercise", obj)
    Output
      [1] "About to exercise objExample5b"

---

    Code
      summary.amCluster(get(obj))
    Output
      allelematch
      amCluster object
      
      Focal dataset N=20
      Unique genotypes (total): 14
      Unique genotypes (by cluster consensus): 0
      Unique genotypes (singletons): 14
      
      Missing data represented by: -99
      Missing data matching method: 2
      Clustered genotypes consensus method: 1
      Hierarchical clustering method: complete
      Dynamic tree cutting height (cutHeight): 0.3
      
      Run until only singletons: TRUE
      Runs: 4
      
      Score flags:
      *101 Allele does not match
      +101 Allele is missing
      [101] Allele is interpolated in consensus from non-missing cluster members (consensusMethod = 2, 4 only)
      
      (Singleton 1 of 14)
                                       samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1002.ON.CA   SiouxLookout-Jan-2004      F   382   384   230   236  +-99  +-99   181   193   299   299   223   223   202   202   118   118   288   296    166    166      
      CLOSEST    1006.ON.CA   SiouxLookout-Jan-2004      F   382   384  *224  *230  +-99  +-99   181   193  *285  *285   223   223  *198   202  *114  *116   288   296    166    166  0.68
      
      
      (Singleton 2 of 14)
                                       samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1006.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   230  +-99  +-99   181   193   285   285   223   223   198   202   114   116   288   296    166    166      
      CLOSEST    1002.ON.CA   SiouxLookout-Jan-2004      F   382   384  *230  *236  +-99  +-99   181   193  *299  *299   223   223  *202   202  *118  *118   288   296    166    166  0.68
      
      
      (Singleton 3 of 14)
                                       samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1011.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   224  +-99  +-99   193   193   299   299   223   223   210   214   106   112   288   296    166    172      
      CLOSEST    1015.ON.CA   SiouxLookout-Jan-2004      F   382  *382   224  *232  +-99  +-99   193   193   299   299   223   223   210  *216   106  *106  *296  *306    166   *166  0.68
      
      
      (Singleton 4 of 14)
                                       samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1013.ON.CA   SiouxLookout-Jan-2004      M   382   384   232   232  +-99  +-99   193   193   299   299   213   221   210   210   118   118   296   306    166    172      
      CLOSEST    1016.ON.CA   SiouxLookout-Jan-2004      M   382   384  *224   232  +-99  +-99   193   193  +-99  +-99   213   221   210   210  *106  *112  *288  *288    166   *166  0.68
      
      
      (Singleton 5 of 14)
                                       samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1015.ON.CA   SiouxLookout-Jan-2004      F   382   382   224   232  +-99  +-99   193   193   299   299   223   223   210   216   106   106   296   306    166    166      
      CLOSEST    1011.ON.CA   SiouxLookout-Jan-2004      F   382  *384   224  *224  +-99  +-99   193   193   299   299   223   223   210  *214   106  *112  *288  *296    166   *172  0.68
      
      
      (Singleton 6 of 14)
                                       samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1016.ON.CA   SiouxLookout-Jan-2004      M   382   384   224   232  +-99  +-99   193   193  +-99  +-99   213   221   210   210   106   112   288   288    166    166      
      CLOSEST    1013.ON.CA   SiouxLookout-Jan-2004      M   382   384  *232   232  +-99  +-99   193   193  +299  +299   213   221   210   210  *118  *118  *296  *306    166   *172  0.68
      
      
      (Singleton 7 of 14)
                                       samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1017.ON.CA   SiouxLookout-Jan-2004      F   382   388   230   230  +-99  +-99   181   185   285   299   223   223   202   202   106   118   304   304    166    166      
      CLOSEST    1002.ON.CA   SiouxLookout-Jan-2004      F   382  *384   230  *236  +-99  +-99   181  *193  *299   299   223   223   202   202  *118   118  *288  *296    166    166  0.68
      
      
      (Singleton 8 of 14)
                                       samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1019.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   230   159   159   193   193   299   299   223   223   202   202   106   118   298   298    166    166      
      CLOSEST    1002.ON.CA   SiouxLookout-Jan-2004      F   382   384  *230  *236  +-99  +-99  *181   193   299   299   223   223   202   202  *118   118  *288  *296    166    166  0.68
      
      
      (Singleton 9 of 14)
                                       samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1020.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   230   155   167   185   193   299   299   223   223   202   204   106   106   296   304    166    166      
      CLOSEST    1015.ON.CA   SiouxLookout-Jan-2004      F   382  *382   224  *232  +-99  +-99  *193   193   299   299   223   223  *210  *216   106   106   296  *306    166    166  0.68
      
      
      (Singleton 10 of 14)
                                       samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1001.ON.CA   SiouxLookout-Jan-2004      F   382   384   230   236  +-99  +-99   185   185   301   301   223   223   192   192   118   118   296   304    166    166      
      CLOSEST    1002.ON.CA   SiouxLookout-Jan-2004      F   382   384   230   236  +-99  +-99  *181  *193  *299  *299   223   223  *202  *202   118   118  *288  *296    166    166  0.64
      
      
      (Singleton 11 of 14)
                                       samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1018.ON.CA   SiouxLookout-Jan-2004      F   384   384   224   230  +-99  +-99   185   199   285   299   223   223   198   204   116   118   296   296    166    166      
      CLOSEST    1006.ON.CA   SiouxLookout-Jan-2004      F  *382   384   224   230  +-99  +-99  *181  *193   285  *285   223   223   198  *202  *114  *116  *288   296    166    166  0.64
      
      
      (Singleton 12 of 14)
                                       samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1003.ON.CA   SiouxLookout-Jan-2004      M   382   382   224   242  +-99  +-99   185   191   285   299   223   223   192   202   102   118   298   304    166    172      
      CLOSEST    1017.ON.CA   SiouxLookout-Jan-2004     *F   382  *388  *230  *230  +-99  +-99  *181  *185   285   299   223   223  *202   202  *106   118  *304   304    166   *166  0.55
      
      
      (Singleton 13 of 14)
                                       samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1004.ON.CA   SiouxLookout-Jan-2004      M   382   384   232   236  +-99  +-99   193   193   299   301   223   223   192   216   102   108   296   304    168    174      
      CLOSEST    1001.ON.CA   SiouxLookout-Jan-2004     *F   382   384  *230   236  +-99  +-99  *185  *185  *301   301   223   223   192  *192  *118  *118   296   304   *166   *166  0.55
      
      
      (Singleton 14 of 14)
                                       samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      SINGLETON  1014.ON.CA   SiouxLookout-Jan-2004      F   384   384   232   238  +-99  +-99   193   199   299   301   213   213   210   210   102   108   296   296    174    174      
      CLOSEST    1004.ON.CA   SiouxLookout-Jan-2004     *M  *382   384   232  *236  +-99  +-99   193  *193   299   301  *223  *223  *192  *216   102   108   296  *304   *168    174  0.55
      
      
      (Singletons END)
      
      
      (Unique genotypes)
                                       samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b
      SINGLETON  1001.ON.CA   SiouxLookout-Jan-2004      F   382   384   230   236   -99   -99   185   185   301   301   223   223   192   192   118   118   296   304    166    166
      SINGLETON  1002.ON.CA   SiouxLookout-Jan-2004      F   382   384   230   236   -99   -99   181   193   299   299   223   223   202   202   118   118   288   296    166    166
      SINGLETON  1003.ON.CA   SiouxLookout-Jan-2004      M   382   382   224   242   -99   -99   185   191   285   299   223   223   192   202   102   118   298   304    166    172
      SINGLETON  1004.ON.CA   SiouxLookout-Jan-2004      M   382   384   232   236   -99   -99   193   193   299   301   223   223   192   216   102   108   296   304    168    174
      SINGLETON  1006.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   230   -99   -99   181   193   285   285   223   223   198   202   114   116   288   296    166    166
      SINGLETON  1011.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   224   -99   -99   193   193   299   299   223   223   210   214   106   112   288   296    166    172
      SINGLETON  1013.ON.CA   SiouxLookout-Jan-2004      M   382   384   232   232   -99   -99   193   193   299   299   213   221   210   210   118   118   296   306    166    172
      SINGLETON  1014.ON.CA   SiouxLookout-Jan-2004      F   384   384   232   238   -99   -99   193   199   299   301   213   213   210   210   102   108   296   296    174    174
      SINGLETON  1015.ON.CA   SiouxLookout-Jan-2004      F   382   382   224   232   -99   -99   193   193   299   299   223   223   210   216   106   106   296   306    166    166
      SINGLETON  1016.ON.CA   SiouxLookout-Jan-2004      M   382   384   224   232   -99   -99   193   193   -99   -99   213   221   210   210   106   112   288   288    166    166
      SINGLETON  1017.ON.CA   SiouxLookout-Jan-2004      F   382   388   230   230   -99   -99   181   185   285   299   223   223   202   202   106   118   304   304    166    166
      SINGLETON  1018.ON.CA   SiouxLookout-Jan-2004      F   384   384   224   230   -99   -99   185   199   285   299   223   223   198   204   116   118   296   296    166    166
      SINGLETON  1019.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   230   159   159   193   193   299   299   223   223   202   202   106   118   298   298    166    166
      SINGLETON  1020.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   230   155   167   185   193   299   299   223   223   202   204   106   106   296   304    166    166

---

    Code
      amCSV.amCluster(get(obj), csvFile = tmp)

---

    Code
      format(read.csv(tmp))
    Output
              index          samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b
      1  1001.ON.CA SiouxLookout-Jan-2004      F   382   384   230   236   -99   -99   185   185   301   301   223   223   192   192   118   118   296   304    166    166
      2  1002.ON.CA SiouxLookout-Jan-2004      F   382   384   230   236   -99   -99   181   193   299   299   223   223   202   202   118   118   288   296    166    166
      3  1003.ON.CA SiouxLookout-Jan-2004      M   382   382   224   242   -99   -99   185   191   285   299   223   223   192   202   102   118   298   304    166    172
      4  1004.ON.CA SiouxLookout-Jan-2004      M   382   384   232   236   -99   -99   193   193   299   301   223   223   192   216   102   108   296   304    168    174
      5  1006.ON.CA SiouxLookout-Jan-2004      F   382   384   224   230   -99   -99   181   193   285   285   223   223   198   202   114   116   288   296    166    166
      6  1011.ON.CA SiouxLookout-Jan-2004      F   382   384   224   224   -99   -99   193   193   299   299   223   223   210   214   106   112   288   296    166    172
      7  1013.ON.CA SiouxLookout-Jan-2004      M   382   384   232   232   -99   -99   193   193   299   299   213   221   210   210   118   118   296   306    166    172
      8  1014.ON.CA SiouxLookout-Jan-2004      F   384   384   232   238   -99   -99   193   199   299   301   213   213   210   210   102   108   296   296    174    174
      9  1015.ON.CA SiouxLookout-Jan-2004      F   382   382   224   232   -99   -99   193   193   299   299   223   223   210   216   106   106   296   306    166    166
      10 1016.ON.CA SiouxLookout-Jan-2004      M   382   384   224   232   -99   -99   193   193   -99   -99   213   221   210   210   106   112   288   288    166    166
      11 1017.ON.CA SiouxLookout-Jan-2004      F   382   388   230   230   -99   -99   181   185   285   299   223   223   202   202   106   118   304   304    166    166
      12 1018.ON.CA SiouxLookout-Jan-2004      F   384   384   224   230   -99   -99   185   199   285   299   223   223   198   204   116   118   296   296    166    166
      13 1019.ON.CA SiouxLookout-Jan-2004      F   382   384   224   230   159   159   193   193   299   299   223   223   202   202   106   118   298   298    166    166
      14 1020.ON.CA SiouxLookout-Jan-2004      F   382   384   224   230   155   167   185   193   299   299   223   223   202   204   106   106   296   304    166    166

---

    Code
      amHTML.amCluster(get(obj), htmlFile = tmp)

---

    Code
      cat(sub("summary generated: </b><em>.+?</em>", "summary generated: </b><em>(date)</em>", gsub("(\\t| )+?(\\n|$)", "\\2", readLines(tmp, warn = FALSE), perl = TRUE), perl = TRUE), sep = "\n")
    Output
      <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
      
               <html xmlns='http://www.w3.org/1999/xhtml' xml:lang='en' lang='en'><head>
      
              <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
      <title>allelematch: amCluster() output</title><style type="text/css">
      
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
      
      </style></head><body><div style="margin-left:5%; margin-right:5%"><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><div style="font-size:x-small;"><table><tr><td style="width:400px;"><span style="font-size:20px;">allelematch<br>cluster analysis</span><br><br></td></tr>
      <tr><td><b>
      Focal dataset N=</b><em>20</em></td></tr>
       <tr><td><b>unique N=</b><em>14</em></td></tr>
       <tr><td><b>unique (consensus) N=</b><em>0</em></td></tr>
       <tr><td><b>unique (singletons) N=</b><em>14</em></td></tr>
       <tr><td><b>missing data represented by: </b><em>-99</em></td></tr>
       <tr><td><b>missing data matching method: </b><em>2</em></td></tr>
       <tr><td><b>clustered genotypes consensus method: </b><em>1</em></td></tr>
       <tr><td><b>hierarchical clustering method: </b><em>complete</em></td></tr>
       <tr><td><b>cutHeight (d-hat; dynamic tree cutting height): </b><em>0.3</em></td></tr>
       <tr><td><b>run until only singletons: </b><em>TRUE</em></td></tr>
       <tr><td><b>runs: </b><em>4</em></td></tr>
       <tr><td><b>summary generated: </b><em>(date)</em></td></tr>
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Type</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1001.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1001.ON.CA">1001.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1002.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1002.ON.CA">1002.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1003.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1003.ON.CA">1003.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1004.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1004.ON.CA">1004.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1006.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1006.ON.CA">1006.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1011.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1011.ON.CA">1011.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1013.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1013.ON.CA">1013.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1014.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1014.ON.CA">1014.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1015.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1015.ON.CA">1015.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1016.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1016.ON.CA">1016.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1017.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1017.ON.CA">1017.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1018.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1018.ON.CA">1018.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1019.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1019.ON.CA">1019.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      <tr onmouseout="this.style.cssText='background-color:none;';" onmouseover="this.style.cssText='background-color:#E0FFFF';" style="">
      <td><div><a href="#1020.ON.CA">Jump</a></div></td>
      <td><div><a name="back_1020.ON.CA">1020.ON.CA</a></div></td>
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
      <td><div>SINGLETON</div></td>
      </tr>
      </table></div><div class="amGridLowerPanel"><span>There were 14 unique genotypes identified using the parameters supplied.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1002.ON.CA"><span style="font-size:medium;">(Singleton 1 of 14)</span></a><br><a href="#back_1002.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1002.ON.CA</div></td><td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td><td class="amTableSelectRow"><div>F</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>230</div></td><td class="amTableSelectRow"><div>236</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>181</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>202</div></td><td class="amTableSelectRow"><div>202</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>288</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1006.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div class="amMismatchAllele">224</div></td><td><div class="amMismatchAllele">230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div class="amMismatchAllele">285</div></td><td><div class="amMismatchAllele">285</div></td><td><div>223</div></td><td><div>223</div></td><td><div class="amMismatchAllele">198</div></td><td><div>202</div></td><td><div class="amMismatchAllele">114</div></td><td><div class="amMismatchAllele">116</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.68</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1006.ON.CA"><span style="font-size:medium;">(Singleton 2 of 14)</span></a><br><a href="#back_1006.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1006.ON.CA</div></td><td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td><td class="amTableSelectRow"><div>F</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>224</div></td><td class="amTableSelectRow"><div>230</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>181</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>285</div></td><td class="amTableSelectRow"><div>285</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>198</div></td><td class="amTableSelectRow"><div>202</div></td><td class="amTableSelectRow"><div>114</div></td><td class="amTableSelectRow"><div>116</div></td><td class="amTableSelectRow"><div>288</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1002.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div class="amMismatchAllele">230</div></td><td><div class="amMismatchAllele">236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div class="amMismatchAllele">299</div></td><td><div class="amMismatchAllele">299</div></td><td><div>223</div></td><td><div>223</div></td><td><div class="amMismatchAllele">202</div></td><td><div>202</div></td><td><div class="amMismatchAllele">118</div></td><td><div class="amMismatchAllele">118</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.68</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1011.ON.CA"><span style="font-size:medium;">(Singleton 3 of 14)</span></a><br><a href="#back_1011.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1011.ON.CA</div></td><td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td><td class="amTableSelectRow"><div>F</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>224</div></td><td class="amTableSelectRow"><div>224</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>210</div></td><td class="amTableSelectRow"><div>214</div></td><td class="amTableSelectRow"><div>106</div></td><td class="amTableSelectRow"><div>112</div></td><td class="amTableSelectRow"><div>288</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>172</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1015.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div class="amMismatchAllele">382</div></td><td><div>224</div></td><td><div class="amMismatchAllele">232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div class="amMismatchAllele">216</div></td><td><div>106</div></td><td><div class="amMismatchAllele">106</div></td><td><div class="amMismatchAllele">296</div></td><td><div class="amMismatchAllele">306</div></td><td><div>166</div></td><td><div class="amMismatchAllele">166</div></td><td><div>0.68</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1013.ON.CA"><span style="font-size:medium;">(Singleton 4 of 14)</span></a><br><a href="#back_1013.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1013.ON.CA</div></td><td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td><td class="amTableSelectRow"><div>M</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>232</div></td><td class="amTableSelectRow"><div>232</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>213</div></td><td class="amTableSelectRow"><div>221</div></td><td class="amTableSelectRow"><div>210</div></td><td class="amTableSelectRow"><div>210</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>306</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>172</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1016.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>384</div></td><td><div class="amMismatchAllele">224</div></td><td><div>232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>213</div></td><td><div>221</div></td><td><div>210</div></td><td><div>210</div></td><td><div class="amMismatchAllele">106</div></td><td><div class="amMismatchAllele">112</div></td><td><div class="amMismatchAllele">288</div></td><td><div class="amMismatchAllele">288</div></td><td><div>166</div></td><td><div class="amMismatchAllele">166</div></td><td><div>0.68</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1015.ON.CA"><span style="font-size:medium;">(Singleton 5 of 14)</span></a><br><a href="#back_1015.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1015.ON.CA</div></td><td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td><td class="amTableSelectRow"><div>F</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>224</div></td><td class="amTableSelectRow"><div>232</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>210</div></td><td class="amTableSelectRow"><div>216</div></td><td class="amTableSelectRow"><div>106</div></td><td class="amTableSelectRow"><div>106</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>306</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1011.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div class="amMismatchAllele">384</div></td><td><div>224</div></td><td><div class="amMismatchAllele">224</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div class="amMismatchAllele">214</div></td><td><div>106</div></td><td><div class="amMismatchAllele">112</div></td><td><div class="amMismatchAllele">288</div></td><td><div class="amMismatchAllele">296</div></td><td><div>166</div></td><td><div class="amMismatchAllele">172</div></td><td><div>0.68</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1016.ON.CA"><span style="font-size:medium;">(Singleton 6 of 14)</span></a><br><a href="#back_1016.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1016.ON.CA</div></td><td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td><td class="amTableSelectRow"><div>M</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>224</div></td><td class="amTableSelectRow"><div>232</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>213</div></td><td class="amTableSelectRow"><div>221</div></td><td class="amTableSelectRow"><div>210</div></td><td class="amTableSelectRow"><div>210</div></td><td class="amTableSelectRow"><div>106</div></td><td class="amTableSelectRow"><div>112</div></td><td class="amTableSelectRow"><div>288</div></td><td class="amTableSelectRow"><div>288</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1013.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>384</div></td><td><div class="amMismatchAllele">232</div></td><td><div>232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div class="amMissingAllele">299</div></td><td><div class="amMissingAllele">299</div></td><td><div>213</div></td><td><div>221</div></td><td><div>210</div></td><td><div>210</div></td><td><div class="amMismatchAllele">118</div></td><td><div class="amMismatchAllele">118</div></td><td><div class="amMismatchAllele">296</div></td><td><div class="amMismatchAllele">306</div></td><td><div>166</div></td><td><div class="amMismatchAllele">172</div></td><td><div>0.68</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1017.ON.CA"><span style="font-size:medium;">(Singleton 7 of 14)</span></a><br><a href="#back_1017.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1017.ON.CA</div></td><td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td><td class="amTableSelectRow"><div>F</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>388</div></td><td class="amTableSelectRow"><div>230</div></td><td class="amTableSelectRow"><div>230</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>181</div></td><td class="amTableSelectRow"><div>185</div></td><td class="amTableSelectRow"><div>285</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>202</div></td><td class="amTableSelectRow"><div>202</div></td><td class="amTableSelectRow"><div>106</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>304</div></td><td class="amTableSelectRow"><div>304</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1002.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div class="amMismatchAllele">384</div></td><td><div>230</div></td><td><div class="amMismatchAllele">236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div class="amMismatchAllele">193</div></td><td><div class="amMismatchAllele">299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>202</div></td><td><div class="amMismatchAllele">118</div></td><td><div>118</div></td><td><div class="amMismatchAllele">288</div></td><td><div class="amMismatchAllele">296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.68</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1019.ON.CA"><span style="font-size:medium;">(Singleton 8 of 14)</span></a><br><a href="#back_1019.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1019.ON.CA</div></td><td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td><td class="amTableSelectRow"><div>F</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>224</div></td><td class="amTableSelectRow"><div>230</div></td><td class="amTableSelectRow"><div>159</div></td><td class="amTableSelectRow"><div>159</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>202</div></td><td class="amTableSelectRow"><div>202</div></td><td class="amTableSelectRow"><div>106</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>298</div></td><td class="amTableSelectRow"><div>298</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1002.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div class="amMismatchAllele">230</div></td><td><div class="amMismatchAllele">236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMismatchAllele">181</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>202</div></td><td><div class="amMismatchAllele">118</div></td><td><div>118</div></td><td><div class="amMismatchAllele">288</div></td><td><div class="amMismatchAllele">296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.68</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1020.ON.CA"><span style="font-size:medium;">(Singleton 9 of 14)</span></a><br><a href="#back_1020.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1020.ON.CA</div></td><td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td><td class="amTableSelectRow"><div>F</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>224</div></td><td class="amTableSelectRow"><div>230</div></td><td class="amTableSelectRow"><div>155</div></td><td class="amTableSelectRow"><div>167</div></td><td class="amTableSelectRow"><div>185</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>202</div></td><td class="amTableSelectRow"><div>204</div></td><td class="amTableSelectRow"><div>106</div></td><td class="amTableSelectRow"><div>106</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>304</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1015.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div class="amMismatchAllele">382</div></td><td><div>224</div></td><td><div class="amMismatchAllele">232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMismatchAllele">193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div class="amMismatchAllele">210</div></td><td><div class="amMismatchAllele">216</div></td><td><div>106</div></td><td><div>106</div></td><td><div>296</div></td><td><div class="amMismatchAllele">306</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.68</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1001.ON.CA"><span style="font-size:medium;">(Singleton 10 of 14)</span></a><br><a href="#back_1001.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1001.ON.CA</div></td><td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td><td class="amTableSelectRow"><div>F</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>230</div></td><td class="amTableSelectRow"><div>236</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>185</div></td><td class="amTableSelectRow"><div>185</div></td><td class="amTableSelectRow"><div>301</div></td><td class="amTableSelectRow"><div>301</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>192</div></td><td class="amTableSelectRow"><div>192</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>304</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1002.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>230</div></td><td><div>236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMismatchAllele">181</div></td><td><div class="amMismatchAllele">193</div></td><td><div class="amMismatchAllele">299</div></td><td><div class="amMismatchAllele">299</div></td><td><div>223</div></td><td><div>223</div></td><td><div class="amMismatchAllele">202</div></td><td><div class="amMismatchAllele">202</div></td><td><div>118</div></td><td><div>118</div></td><td><div class="amMismatchAllele">288</div></td><td><div class="amMismatchAllele">296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.64</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1018.ON.CA"><span style="font-size:medium;">(Singleton 11 of 14)</span></a><br><a href="#back_1018.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1018.ON.CA</div></td><td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td><td class="amTableSelectRow"><div>F</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>224</div></td><td class="amTableSelectRow"><div>230</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>185</div></td><td class="amTableSelectRow"><div>199</div></td><td class="amTableSelectRow"><div>285</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>198</div></td><td class="amTableSelectRow"><div>204</div></td><td class="amTableSelectRow"><div>116</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1006.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div class="amMismatchAllele">382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMismatchAllele">181</div></td><td><div class="amMismatchAllele">193</div></td><td><div>285</div></td><td><div class="amMismatchAllele">285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>198</div></td><td><div class="amMismatchAllele">202</div></td><td><div class="amMismatchAllele">114</div></td><td><div class="amMismatchAllele">116</div></td><td><div class="amMismatchAllele">288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>0.64</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1003.ON.CA"><span style="font-size:medium;">(Singleton 12 of 14)</span></a><br><a href="#back_1003.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1003.ON.CA</div></td><td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td><td class="amTableSelectRow"><div>M</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>224</div></td><td class="amTableSelectRow"><div>242</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>185</div></td><td class="amTableSelectRow"><div>191</div></td><td class="amTableSelectRow"><div>285</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>192</div></td><td class="amTableSelectRow"><div>202</div></td><td class="amTableSelectRow"><div>102</div></td><td class="amTableSelectRow"><div>118</div></td><td class="amTableSelectRow"><div>298</div></td><td class="amTableSelectRow"><div>304</div></td><td class="amTableSelectRow"><div>166</div></td><td class="amTableSelectRow"><div>172</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1017.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div class="amMismatchAllele">F</div></td><td><div>382</div></td><td><div class="amMismatchAllele">388</div></td><td><div class="amMismatchAllele">230</div></td><td><div class="amMismatchAllele">230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMismatchAllele">181</div></td><td><div class="amMismatchAllele">185</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div class="amMismatchAllele">202</div></td><td><div>202</div></td><td><div class="amMismatchAllele">106</div></td><td><div>118</div></td><td><div class="amMismatchAllele">304</div></td><td><div>304</div></td><td><div>166</div></td><td><div class="amMismatchAllele">166</div></td><td><div>0.55</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1004.ON.CA"><span style="font-size:medium;">(Singleton 13 of 14)</span></a><br><a href="#back_1004.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1004.ON.CA</div></td><td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td><td class="amTableSelectRow"><div>M</div></td><td class="amTableSelectRow"><div>382</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>232</div></td><td class="amTableSelectRow"><div>236</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>301</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>223</div></td><td class="amTableSelectRow"><div>192</div></td><td class="amTableSelectRow"><div>216</div></td><td class="amTableSelectRow"><div>102</div></td><td class="amTableSelectRow"><div>108</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>304</div></td><td class="amTableSelectRow"><div>168</div></td><td class="amTableSelectRow"><div>174</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1001.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div class="amMismatchAllele">F</div></td><td><div>382</div></td><td><div>384</div></td><td><div class="amMismatchAllele">230</div></td><td><div>236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMismatchAllele">185</div></td><td><div class="amMismatchAllele">185</div></td><td><div class="amMismatchAllele">301</div></td><td><div>301</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div class="amMismatchAllele">192</div></td><td><div class="amMismatchAllele">118</div></td><td><div class="amMismatchAllele">118</div></td><td><div>296</div></td><td><div>304</div></td><td><div class="amMismatchAllele">166</div></td><td><div class="amMismatchAllele">166</div></td><td><div>0.55</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><a name="1014.ON.CA"><span style="font-size:medium;">(Singleton 14 of 14)</span></a><br><a href="#back_1014.ON.CA">Jump up</a><br></div><div class="amGridMiddlePanel">
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
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <tr><td class="amTableSelectRow"><div>SINGLETON</div></td><td class="amTableSelectRow"><div>1014.ON.CA</div></td><td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td><td class="amTableSelectRow"><div>F</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>384</div></td><td class="amTableSelectRow"><div>232</div></td><td class="amTableSelectRow"><div>238</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>-99</div></td><td class="amTableSelectRow"><div>193</div></td><td class="amTableSelectRow"><div>199</div></td><td class="amTableSelectRow"><div>299</div></td><td class="amTableSelectRow"><div>301</div></td><td class="amTableSelectRow"><div>213</div></td><td class="amTableSelectRow"><div>213</div></td><td class="amTableSelectRow"><div>210</div></td><td class="amTableSelectRow"><div>210</div></td><td class="amTableSelectRow"><div>102</div></td><td class="amTableSelectRow"><div>108</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>296</div></td><td class="amTableSelectRow"><div>174</div></td><td class="amTableSelectRow"><div>174</div></td><td class="amTableSelectRow"><div></div></td> </tr>
      <tr><td><div>CLOSEST</div></td><td><div>1004.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div class="amMismatchAllele">M</div></td><td><div class="amMismatchAllele">382</div></td><td><div>384</div></td><td><div>232</div></td><td><div class="amMismatchAllele">236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div class="amMismatchAllele">193</div></td><td><div>299</div></td><td><div>301</div></td><td><div class="amMismatchAllele">223</div></td><td><div class="amMismatchAllele">223</div></td><td><div class="amMismatchAllele">192</div></td><td><div class="amMismatchAllele">216</div></td><td><div>102</div></td><td><div>108</div></td><td><div>296</div></td><td><div class="amMismatchAllele">304</div></td><td><div class="amMismatchAllele">168</div></td><td><div>174</div></td><td><div>0.55</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>Closest match to singleton shown for diagnostic purposes</span></div></td></tr></table><br><br><span style="font-size:x-small;">Generated by allelematch:  an R package<br></span><span style="font-size:x-small;">To reference this analysis please use citation("allelematch")<br><br></span></div></body></html>

