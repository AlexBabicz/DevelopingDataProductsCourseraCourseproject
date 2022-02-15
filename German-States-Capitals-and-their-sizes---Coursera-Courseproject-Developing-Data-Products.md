---
title: "German States-Capitals and their sizes - Coursera Courseproject: Developing Data Products"
author: "Alex Babicz"
date: "15.02.2022"
output: 
  html_document:
    keep_md: yes
---


## Overview

Germany consists of 16 different states with a state capital each. Some are city states, but most are not. They vary in population size and have an own armorial each. These city states are shown on the map here with their corresponding armorial and a link to their Wikipedia entry. The population size is given as number and used as parameter for a circle around the city (10 times the square root; maybe only seen when zoomed in).  
  
*Mainz and Wiesbaden are pretty close to each other so you maybe have to zoom in to count all 16 states.*



## Table
Here is the underlying data table as overview.
<table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;color: black !important;background-color: lightgray !important;"> city </th>
   <th style="text-align:left;color: black !important;background-color: lightgray !important;"> state </th>
   <th style="text-align:right;color: black !important;background-color: lightgray !important;"> pop </th>
   <th style="text-align:right;color: black !important;background-color: lightgray !important;"> area_size </th>
   <th style="text-align:right;color: black !important;background-color: lightgray !important;"> lng </th>
   <th style="text-align:right;color: black !important;background-color: lightgray !important;"> lat </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Berlin </td>
   <td style="text-align:left;"> Berlin </td>
   <td style="text-align:right;"> 3664088 </td>
   <td style="text-align:right;"> 891.12 </td>
   <td style="text-align:right;"> 13.405538 </td>
   <td style="text-align:right;"> 52.51767 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bremen </td>
   <td style="text-align:left;"> Bremen </td>
   <td style="text-align:right;"> 566573 </td>
   <td style="text-align:right;"> 318.21 </td>
   <td style="text-align:right;"> 8.809338 </td>
   <td style="text-align:right;"> 53.07561 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dresden </td>
   <td style="text-align:left;"> Saxony </td>
   <td style="text-align:right;"> 556227 </td>
   <td style="text-align:right;"> 328.48 </td>
   <td style="text-align:right;"> 13.736883 </td>
   <td style="text-align:right;"> 51.05170 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Düsseldorf </td>
   <td style="text-align:left;"> Nort Rhine-Westphalia </td>
   <td style="text-align:right;"> 620523 </td>
   <td style="text-align:right;"> 217.41 </td>
   <td style="text-align:right;"> 6.780068 </td>
   <td style="text-align:right;"> 51.22422 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Erfurt </td>
   <td style="text-align:left;"> Thuringia </td>
   <td style="text-align:right;"> 213692 </td>
   <td style="text-align:right;"> 269.91 </td>
   <td style="text-align:right;"> 11.027236 </td>
   <td style="text-align:right;"> 50.97712 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hamburg </td>
   <td style="text-align:left;"> Hamburg </td>
   <td style="text-align:right;"> 1852478 </td>
   <td style="text-align:right;"> 755.09 </td>
   <td style="text-align:right;"> 9.996970 </td>
   <td style="text-align:right;"> 53.55068 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hannover </td>
   <td style="text-align:left;"> Lower Saxony </td>
   <td style="text-align:right;"> 534049 </td>
   <td style="text-align:right;"> 204.30 </td>
   <td style="text-align:right;"> 9.738084 </td>
   <td style="text-align:right;"> 52.37455 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Kiel </td>
   <td style="text-align:left;"> Schleswig-Holstein </td>
   <td style="text-align:right;"> 246601 </td>
   <td style="text-align:right;"> 118.65 </td>
   <td style="text-align:right;"> 10.137270 </td>
   <td style="text-align:right;"> 54.32178 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Magdeburg </td>
   <td style="text-align:left;"> Saxony-Anhalt </td>
   <td style="text-align:right;"> 235775 </td>
   <td style="text-align:right;"> 201.03 </td>
   <td style="text-align:right;"> 11.632726 </td>
   <td style="text-align:right;"> 52.12625 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mainz </td>
   <td style="text-align:left;"> Rhineland-Palatinate </td>
   <td style="text-align:right;"> 217123 </td>
   <td style="text-align:right;"> 97.73 </td>
   <td style="text-align:right;"> 8.271855 </td>
   <td style="text-align:right;"> 50.00196 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> München </td>
   <td style="text-align:left;"> Bavaria </td>
   <td style="text-align:right;"> 1488202 </td>
   <td style="text-align:right;"> 310.70 </td>
   <td style="text-align:right;"> 11.575997 </td>
   <td style="text-align:right;"> 48.13768 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Potsdam </td>
   <td style="text-align:left;"> Brandenburg </td>
   <td style="text-align:right;"> 182112 </td>
   <td style="text-align:right;"> 188.24 </td>
   <td style="text-align:right;"> 13.053580 </td>
   <td style="text-align:right;"> 52.40035 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Saarbrücken </td>
   <td style="text-align:left;"> Saarland </td>
   <td style="text-align:right;"> 179349 </td>
   <td style="text-align:right;"> 167.52 </td>
   <td style="text-align:right;"> 6.995542 </td>
   <td style="text-align:right;"> 49.23661 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Schwerin </td>
   <td style="text-align:left;"> Mecklenburg-Western Pomerania </td>
   <td style="text-align:right;"> 95609 </td>
   <td style="text-align:right;"> 130.52 </td>
   <td style="text-align:right;"> 11.414434 </td>
   <td style="text-align:right;"> 53.62855 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Stuttgart </td>
   <td style="text-align:left;"> Baden-Württemberg </td>
   <td style="text-align:right;"> 630305 </td>
   <td style="text-align:right;"> 207.32 </td>
   <td style="text-align:right;"> 9.177734 </td>
   <td style="text-align:right;"> 48.77582 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Wiesbaden </td>
   <td style="text-align:left;"> Hesse </td>
   <td style="text-align:right;"> 278609 </td>
   <td style="text-align:right;"> 203.87 </td>
   <td style="text-align:right;"> 8.239138 </td>
   <td style="text-align:right;"> 50.08170 </td>
  </tr>
</tbody>
</table>


```{=html}
<div id="htmlwidget-c514ff53f85b00679874" style="width:1152px;height:768px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-c514ff53f85b00679874">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"http://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"http://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addCircles","args":[[52.51767,53.075606,51.051697,51.22422,50.977122,53.550678,52.374551,54.321775,52.126248,50.001959,48.137683,52.400355,49.236608,53.628545,48.775817,50.081698],[13.405538,8.809338,13.736883,6.780068,11.027236,9.99697,9.738084,10.13727,11.632726,8.271855,11.575997,13.05358,6.995542,11.414434,9.177734,8.239138],[19141.8076471372,7527.10435692239,7458.06275114389,7877.32822726081,4622.68320350854,13610.5767695568,7307.86562547506,4965.8936758654,4855.66679252191,4659.64590929397,12199.188497601,4267.45825990132,4234.96162910598,3092.070503724,7939.17502011387,5278.34254288219],null,null,{"interactive":true,"className":"","stroke":true,"color":"#03F","weight":1,"opacity":0.5,"fill":true,"fillColor":"#03F","fillOpacity":0.2},null,null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null,null]},{"method":"addMarkers","args":[[52.51767,53.075606,51.051697,51.22422,50.977122,53.550678,52.374551,54.321775,52.126248,50.001959,48.137683,52.400355,49.236608,53.628545,48.775817,50.081698],[13.405538,8.809338,13.736883,6.780068,11.027236,9.99697,9.738084,10.13727,11.632726,8.271855,11.575997,13.05358,6.995542,11.414434,9.177734,8.239138],{"iconUrl":{"data":["https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Coat_of_arms_of_Berlin.svg/60px-Coat_of_arms_of_Berlin.svg.png","https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Bremen_Wappen%28Mittel%29.svg/60px-Bremen_Wappen%28Mittel%29.svg.png","https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Coat_of_arms_of_Saxony.svg/60px-Coat_of_arms_of_Saxony.svg.png","https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Coat_of_arms_of_North_Rhine-Westfalia.svg/60px-Coat_of_arms_of_North_Rhine-Westfalia.svg.png","https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Coat_of_arms_of_Thuringia.svg/60px-Coat_of_arms_of_Thuringia.svg.png","https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/DEU_Hamburg_COA.svg/60px-DEU_Hamburg_COA.svg.png","https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Coat_of_arms_of_Lower_Saxony.svg/60px-Coat_of_arms_of_Lower_Saxony.svg.png","https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/DEU_Schleswig-Holstein_COA.svg/60px-DEU_Schleswig-Holstein_COA.svg.png","https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Wappen_Sachsen-Anhalt.svg/60px-Wappen_Sachsen-Anhalt.svg.png","https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Coat_of_arms_of_Rhineland-Palatinate.svg/60px-Coat_of_arms_of_Rhineland-Palatinate.svg.png","https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Bayern_Wappen.svg/60px-Bayern_Wappen.svg.png","https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Brandenburg_Wappen.svg/60px-Brandenburg_Wappen.svg.png","https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Wappen_des_Saarlands.svg/60px-Wappen_des_Saarlands.svg.png","https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Coat_of_arms_of_Mecklenburg-Western_Pomerania_%28great%29.svg/60px-Coat_of_arms_of_Mecklenburg-Western_Pomerania_%28great%29.svg.png","https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Coat_of_arms_of_Baden-W%C3%BCrttemberg_%28lesser%29.svg/60px-Coat_of_arms_of_Baden-W%C3%BCrttemberg_%28lesser%29.svg.png","https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Coat_of_arms_of_Hesse.svg/60px-Coat_of_arms_of_Hesse.svg.png"],"index":[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]},"iconWidth":28.9782608695652,"iconHeight":31,"iconAnchorX":14.4891304347826,"iconAnchorY":15.5},null,null,{"interactive":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},["<a href='https://en.wikipedia.org/wiki/Berlin'>Berlin<\/a><\/br>Population: 3664088<\/br>State: Berlin","<a href='https://en.wikipedia.org/wiki/Bremen_(state)'>Bremen<\/a><\/br>Population: 566573<\/br>State: Bremen","<a href='https://en.wikipedia.org/wiki/Dresden'>Dresden<\/a><\/br>Population: 556227<\/br>State: Saxony","<a href='https://en.wikipedia.org/wiki/Düsseldorf'>Düsseldorf<\/a><\/br>Population: 620523<\/br>State: Nort Rhine-Westphalia","<a href='https://en.wikipedia.org/wiki/Erfurt'>Erfurt<\/a><\/br>Population: 213692<\/br>State: Thuringia","<a href='https://en.wikipedia.org/wiki/Hamburg'>Hamburg<\/a><\/br>Population: 1852478<\/br>State: Hamburg","<a href='https://en.wikipedia.org/wiki/Hanover'>Hannover<\/a><\/br>Population: 534049<\/br>State: Lower Saxony","<a href='https://en.wikipedia.org/wiki/Kiel'>Kiel<\/a><\/br>Population: 246601<\/br>State: Schleswig-Holstein","<a href='https://en.wikipedia.org/wiki/Magdeburg'>Magdeburg<\/a><\/br>Population: 235775<\/br>State: Saxony-Anhalt","<a href='https://en.wikipedia.org/wiki/Mainz'>Mainz<\/a><\/br>Population: 217123<\/br>State: Rhineland-Palatinate","<a href='https://en.wikipedia.org/wiki/Munich'>München<\/a><\/br>Population: 1488202<\/br>State: Bavaria","<a href='https://en.wikipedia.org/wiki/Potsdam'>Potsdam<\/a><\/br>Population: 182112<\/br>State: Brandenburg","<a href='https://en.wikipedia.org/wiki/Saarbrücken'>Saarbrücken<\/a><\/br>Population: 179349<\/br>State: Saarland","<a href='https://en.wikipedia.org/wiki/Schwerin'>Schwerin<\/a><\/br>Population: 95609<\/br>State: Mecklenburg-Western Pomerania","<a href='https://en.wikipedia.org/wiki/Stuttgart'>Stuttgart<\/a><\/br>Population: 630305<\/br>State: Baden-Württemberg","<a href='https://en.wikipedia.org/wiki/Wiesbaden'>Wiesbaden<\/a><\/br>Population: 278609<\/br>State: Hesse"],null,null,null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]}],"limits":{"lat":[48.137683,54.321775],"lng":[6.780068,13.736883]}},"evals":[],"jsHooks":[]}</script>
```
