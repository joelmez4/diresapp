Highcharts.setOptions({
          lang: {
                  drillUpText: '⬅️ Regresar'
                  }
          });

          $(function()
          {
              var dataD = [
                  //APURIMAC
                  {
                      "id": 'region-apurimac',
                      "type": "map",
                      "data": [
                          {
                              "name": "Aymaraes",
                              "path": "M460,-57,462,-62,463,-69,464,-78,467,-82,470,-87,471,-91,476,-96,475,-103,476,-109,482,-113,485,-121,481,-127,475,-133,471,-137,472,-145,478,-147,481,-153,484,-160,486,-167,486,-177C486,-177,481,-179,480,-180,478,-182,474,-184,474,-184L465,-187,459,-193,449,-200,441,-205,436,-211,436,-220,436,-226,434,-230,432,-233,430,-244,429,-258,428,-274,428,-286C428,-288,429,-297,429,-297L430,-304,433,-309,442,-312,448,-315,455,-319,460,-323C460,-323,461,-323,462,-324,462,-325,463,-326,463,-327,463,-327,464,-328,464,-328,465,-328,466,-329,466,-329,468,-330,469,-330,469,-330L476,-334,481,-340C481,-340,480,-345,480,-347,480,-347,481,-347,481,-348,482,-348,483,-349,484,-350,486,-350,488,-351,488,-351L491,-350,495,-343,496,-336,500,-332,507,-334,509,-337,512,-343,518,-343,520,-338,521,-332,531,-332,538,-337,543,-344,544,-349,546,-356,555,-363,555,-363,550,-366,545,-374,536,-377,532,-382,523,-382,516,-385,501,-391L487,-395L474,-399,464,-401,459,-407,456,-414,456,-422,456,-431,455,-441,454,-449,452,-456,455,-468,455,-475,447,-474,437,-473,431,-475,428,-481,421,-489,412,-496,406,-505,393,-515,387,-522,380,-530,375,-537,375,-538C373,-536,371,-534,370,-533L361,-529C361,-529,351,-525,349,-524,347,-524,338,-520,338,-520L328,-520,322,-518,318,-513,314,-505,314,-502,313,-496,313,-487L309,-483C309,-483,308,-482,307,-481,305,-480,304,-479,303,-479,302,-478,297,-475,297,-475L291,-472,285,-468,282,-464,278,-456,276,-447,277,-435,274,-430,271,-425,266,-421,266,-415C266,-415,267,-405,267,-404,267,-402,267,-396,267,-394,267,-392,268,-384,268,-384L265,-376,258,-373,251,-367,246,-360C246,-360,243,-353,243,-351,242,-350,243,-350,243,-349,243,-348,244,-348,245,-347,246,-346,247,-345,247,-345L250,-337,254,-332,253,-290C253,-290,253,-283,253,-282,254,-281,255,-279,256,-277,257,-276,258,-274,258,-274L265,-267,267,-258,267,-249,263,-244C263,-244,258,-239,256,-238,254,-237,250,-232,250,-232,250,-232,248,-229,246,-228,245,-227,245,-226,245,-225,244,-224,244,-223,244,-223L241,-216,236,-211,232,-206,229,-200,227,-195,226,-191,226,-185,226,-178,222,-175,215,-175,208,-175,206,-174,206,-171,208,-165,212,-163,216,-158,214,-152,207,-148,202,-149,197,-152,196,-152,197,-140,198,-124C198,-124,198,-117,196,-115,194,-112,189,-110,189,-110L185,-104,190,-94,194,-85,189,-77,186,-73,187,-60,189,-47,183,-42,172,-38,161,-36,154,-29,151,-14,152,3,156,19,164,28,175,35,185,39,197,43,207,43,212,38,217,35C217,35,227,31,230,29,233,28,239,26,239,26L245,18,249,7C251,1,252,-2,252,-2,252,-2,253,-7,254,-10,255,-13,257,-18,258,-20,259,-22,263,-25,263,-25,263,-25,267,-29,271,-30,276,-32,280,-24,280,-24L287,-18,300,-14,318,-10,325,-16C325,-16,336,-19,338,-20,341,-21,342,-22,342,-22L354,-22L368,-23,373,-25C373,-25,374,-28,377,-29,379,-31,388,-31,388,-31L404,-31,410,-33,415,-40,418,-47,424,-49C424,-49,432,-50,434,-50L444,-50,450,-53,451,-60,457,-60,460,-57z",
                              "value": 1080
                          },
                          {
                              "name": "Grau",
                              "path": "M531,-332,526,-324,531,-307,536,-290,548,-282,566,-281,575,-276,593,-274,612,-278,627,-278,635,-276,639,-262,636,-247,645,-227,667,-225,671,-234,677,-242,680,-252,683,-258,686,-267,690,-268,700,-271,707,-279,720,-285,731,-287,735,-294,740,-300,747,-305,753,-303,759,-293,765,-286,776,-286,784,-281,792,-272,800,-268,807,-269,810,-278,813,-294C813,-294,814,-295,815,-297,815,-299,816,-302,816,-304,816,-306,816,-307,816,-308,817,-309,817,-310,818,-311,819,-312,820,-313,820,-313L824,-319,832,-324,840,-330,847,-336,851,-343,850,-349,846,-350,837,-347,829,-346,824,-354,824,-368C824,-370,825,-372,825,-374,825,-376,826,-377,826,-377L818,-381,808,-378,797,-383,796,-391,793,-400,797,-410,797,-419,795,-423,791,-425C791,-425,789,-427,788,-429,787,-429,786,-431,785,-432,784,-433,784,-434,783,-434,783,-437,780,-444,780,-448,779,-450,778,-452,777,-454,777,-455,776,-457,776,-457L773,-467,768,-474L763,-489L763,-506,763,-518,765,-526,770,-536,775,-542,776,-550,774,-557,774,-557,773,-556,762,-560,752,-565,743,-565,731,-564,715,-565,707,-571,698,-572,688,-567C688,-567,685,-566,682,-564,679,-563,676,-561,675,-561,674,-561,671,-561,669,-560,667,-559,664,-559,664,-559L653,-554,658,-547,662,-538,665,-531,656,-524,650,-516,645,-500,639,-488,631,-482,632,-466,627,-454,613,-451,598,-444,585,-436,582,-421C582,-421,583,-388,583,-386,583,-383,582,-376,582,-376L574,-371,564,-370,556,-363,555,-363,555,-363,546,-356,544,-349,543,-344,538,-337,531,-332,531,-332z",
                              "value": 1080
                          },
                          {
                              "name": "Antabamba",
                              "path": "M809,-274,807,-269,800,-268,792,-272,784,-281,776,-286,765,-286,759,-293,753,-303,747,-305,740,-300,735,-294,731,-287,720,-285,707,-279,700,-271,690,-268,686,-267,683,-258,680,-252,677,-242,671,-234,667,-225,645,-227,636,-247,639,-262,635,-276,627,-278,612,-278,593,-274,575,-276,566,-281,548,-282,536,-290,531,-307,526,-324,531,-332,521,-332,520,-338,518,-343,512,-343,509,-337,507,-334,500,-332,496,-336,495,-343,491,-350,488,-351C488,-351,486,-350,484,-350,483,-349,482,-348,481,-348,481,-347,480,-347,480,-347,480,-345,481,-340,481,-340L476,-334,469,-330C469,-330,468,-330,466,-329,466,-329,465,-328,464,-328,464,-328,463,-327,463,-327,463,-326,462,-325,462,-324,461,-323,460,-323,460,-323L455,-319,448,-315,442,-312,433,-309,430,-304,429,-297C429,-297,428,-288,428,-286L428,-274,429,-258,430,-244,432,-233,434,-230,436,-226,436,-220,436,-211,441,-205,449,-200,459,-193,465,-187,474,-184C474,-184,478,-182,480,-180,481,-179,486,-177,486,-177L486,-167,484,-160,481,-153,478,-147,472,-145,471,-137,475,-133,481,-127,485,-121,482,-113,476,-109,475,-103,476,-96,471,-91,470,-87,467,-82,464,-78,463,-69,462,-62,460,-57,466,-52,476,-52,484,-52,491,-49,499,-41,504,-35,514,-36,520,-31L529,-27,540,-23C540,-23,548,-15,551,-15,553,-14,563,-14,563,-14L569,-18,572,-23,574,-29,581,-33,585,-40,588,-48,595,-50,602,-52,610,-53,621,-52,629,-44,637,-36,650,-31,659,-35,668,-40L681,-46L691,-45,691,-33L693,-23L700,-18,711,-22,722,-30,737,-37,750,-41,760,-44,770,-49C770,-49,770,-64,770,-68L770,-85,763,-90,756,-96,754,-102C754,-102,752,-111,752,-114,752,-117,754,-122,754,-122,754,-122,762,-131,763,-133,764,-135,775,-144,779,-148,783,-152,787,-151,787,-151L796,-150,806,-150,812,-154C812,-154,817,-160,818,-162,818,-164,819,-173,819,-173L823,-180,834,-184,858,-181,851,-185,851,-198,842,-209,832,-225,832,-235,840,-251,826,-258,816,-270,809,-274z",
                              "value": 1080
                          },
                          {
                              "name": "Cotabambas",
                              "path": "M809,-274,816,-270,826,-258,840,-251,832,-235,832,-225,842,-209,851,-198,851,-185,858,-181,866,-181,880,-182,885,-190C885,-190,888,-197,890,-199,891,-201,893,-207,893,-207L896,-216,901,-221,906,-229,916,-238,925,-241,929,-253C929,-253,929,-260,930,-263,930,-266,934,-269,934,-269L938,-271,946,-271C946,-271,952,-273,954,-274,956,-275,961,-276,961,-276L966,-282,971,-290L973,-297,978,-308,982,-318,985,-326,990,-335,996,-347C996,-347,998,-363,998,-368L998,-399C998,-402,1000,-435,1000,-437,1000,-439,998,-459,998,-459L995,-472,989,-485,984,-493,978,-506,970,-518,965,-529,960,-541,955,-553,947,-560,938,-567C938,-567,934,-568,931,-570,929,-571,922,-578,922,-578,922,-578,916,-585,913,-587,910,-590,906,-598,906,-598L901,-601C901,-601,890,-604,887,-604,885,-604,879,-598,875,-598,872,-598,861,-597,858,-599,855,-601,845,-602,840,-604,835,-607,832,-608,828,-610,824,-612,820,-614,820,-614,820,-614,814,-623,813,-626,813,-627,813,-629,812,-632L811,-629,799,-617,791,-602,788,-589C788,-589,783,-577,782,-574,781,-573,781,-570,781,-568,781,-565,781,-562,781,-562L774,-557,774,-557,776,-550,775,-542,770,-536,765,-526,763,-518,763,-506,763,-489,768,-474,773,-467,776,-457C776,-457,777,-455,777,-454,778,-452,779,-450,780,-448,780,-444,783,-437,783,-434,784,-434,784,-433,785,-432,786,-431,787,-429,788,-429,789,-427,791,-425,791,-425L795,-423,797,-419,797,-410,793,-400,796,-391,797,-383,808,-378,818,-381,826,-377C826,-377,825,-376,825,-374,825,-372,824,-370,824,-368L824,-354,829,-346,837,-347,846,-350,850,-349,851,-343,847,-336,840,-330,832,-324,824,-319,820,-313C820,-313,819,-312,818,-311,817,-310,817,-309,816,-308,816,-307,816,-306,816,-304,816,-302,815,-299,815,-297,814,-295,813,-294,813,-294L810,-278,809,-274z",
                              "value": 1080
                          },
                          {
                              "name": "Abancay",
                              "path": "M375,-538,375,-537,380,-530,387,-522,393,-515,406,-505,412,-496,421,-489,428,-481,431,-475,437,-473,447,-474,455,-475,455,-468,452,-456,454,-449,455,-441,456,-431,456,-422,456,-414,459,-407,464,-401,474,-399,487,-395,501,-391,516,-385,523,-382,532,-382,536,-377,545,-374,550,-366,556,-363,564,-370,574,-371,582,-376C582,-376,583,-383,583,-386,583,-388,582,-421,582,-421L585,-436,598,-444,613,-451,627,-454L632,-466,631,-482,639,-488L645,-500,650,-516,656,-524,665,-531,662,-538,658,-547,653,-554,664,-559C664,-559,667,-559,669,-560,671,-561,674,-561,675,-561,676,-561,679,-563,682,-564,685,-566,688,-567,688,-567L698,-572,707,-571,715,-565,731,-564,743,-565,752,-565,762,-560,773,-556,781,-562C781,-562,781,-565,781,-568,781,-570,781,-573,782,-574,783,-577,788,-589,788,-589L791,-602,799,-617L811,-629,812,-632C811,-635,810,-638,810,-638L800,-648,785,-655,775,-658,770,-661,766,-664,751,-665,736,-674,731,-675,718,-676C712,-677,710,-678,707,-678,705,-678,695,-683,695,-683,695,-683,683,-690,681,-691,678,-692,662,-696,662,-696L645,-706C645,-706,633,-712,629,-715,626,-719,617,-721,614,-723,610,-726,601,-729,599,-732,597,-734,590,-737,589,-739,587,-742,585,-748,583,-751,581,-755,574,-759,574,-759,574,-759,561,-759,558,-760,554,-760,542,-759,542,-759L529,-765,521,-771,510,-774L495,-775L487,-772,478,-766,468,-762,458,-757,446,-757,439,-757,431,-750,429,-744,424,-740,411,-740,405,-743L391,-746,384,-744L371,-745,370,-745,370,-745,376,-742,381,-738,387,-736,392,-732,396,-725,395,-715,401,-711,408,-703C408,-703,416,-699,418,-698,420,-697,424,-693,424,-693,424,-693,433,-691,435,-690,436,-689,438,-688,440,-686,441,-685,443,-684,443,-684L447,-677,456,-675,463,-671,468,-663,470,-657,473,-648,476,-642,481,-636,486,-630,492,-628,494,-622,497,-614,493,-605,488,-597,482,-593,473,-590,466,-588C466,-588,454,-585,452,-585,450,-584,440,-581,440,-581L433,-575,426,-570,418,-565C418,-565,416,-565,415,-565,413,-564,411,-564,410,-564,409,-564,409,-563,408,-563,407,-562,407,-562,406,-561,405,-560,404,-559,404,-559L395,-553,387,-545,377,-539C377,-539,376,-538,375,-538z",
                              "value": 5000
                          },
                          {
                              "name": "Andahuaylas",
                              "path": "M196,-152,197,-152,202,-149,207,-148,214,-152,216,-158,212,-163,208,-165,206,-171,206,-174,208,-175,215,-175,222,-175,226,-178,226,-185,226,-191,227,-195,229,-200,232,-206,236,-211,241,-216,244,-223C244,-223,244,-224,245,-225,245,-226,245,-227,246,-228,248,-229,250,-232,250,-232,250,-232,254,-237,256,-238,258,-239,263,-244,263,-244L267,-249,267,-258,265,-267,258,-274C258,-274,257,-276,256,-277,255,-279,254,-281,253,-282,253,-283,253,-290,253,-290L254,-332,250,-337,247,-345C247,-345,246,-346,245,-347,244,-348,243,-348,243,-349,243,-350,242,-350,243,-351,243,-353,246,-360,246,-360L251,-367,258,-373,265,-376,268,-384C268,-384,267,-392,267,-394,267,-396,267,-402,267,-404,267,-405,266,-415,266,-415L266,-421L271,-425L274,-430,277,-435,276,-447,278,-456,282,-464,285,-468,291,-472,297,-475C297,-475,302,-478,303,-479,304,-479,305,-480,307,-481C308,-482,309,-483,309,-483L313,-487,313,-496,314,-502,314,-505,318,-513,322,-518,328,-520,338,-520C338,-520,347,-524,349,-524,351,-525,361,-529,361,-529L370,-533C371,-534,377,-539,377,-539L387,-545,395,-553,404,-559C404,-559,405,-560,406,-561,407,-562,407,-562,408,-563,409,-563,409,-564,410,-564,411,-564,413,-564,415,-565,416,-565,418,-565,418,-565L426,-570,433,-575,440,-581C440,-581,450,-584,452,-585,454,-585,466,-588,466,-588L473,-590,482,-593,488,-597,493,-605,497,-614,494,-622,492,-628,486,-630,481,-636,476,-642,473,-648,470,-657,468,-663L463,-671,456,-675L447,-677,443,-684C443,-684,441,-685,440,-686,438,-688,436,-689,435,-690,433,-691,424,-693,424,-693,424,-693,420,-697,418,-698,416,-699,408,-703,408,-703L401,-711,395,-715,396,-725,392,-732,387,-736,381,-738,376,-742,370,-745,370,-745,367,-751,355,-754,348,-749,346,-741,348,-731,344,-727,331,-728,322,-727C322,-727,316,-727,312,-728,309,-728,308,-731,308,-731L300,-732C300,-732,297,-733,294,-733,292,-733,287,-735,287,-735L285,-741,278,-746,271,-743,264,-739L255,-739L245,-739,238,-742,233,-745,224,-743,220,-740,216,-740,214,-735,211,-730,209,-723,205,-717C205,-717,202,-714,201,-712,201,-712,201,-711,201,-710,201,-709,201,-708,201,-707,201,-705,202,-703,202,-703L202,-696,202,-689C202,-689,205,-686,206,-684,207,-683,207,-682,208,-681,208,-679,208,-678,208,-677,209,-676,209,-675,209,-674,209,-672,209,-671,210,-670,211,-668,212,-664,212,-664L206,-660C206,-660,203,-659,201,-658,198,-656,195,-655,194,-655,192,-655,190,-654,189,-653,188,-652,187,-652,187,-652,187,-652,177,-649,174,-649,173,-649,169,-649,165,-649,161,-649,157,-649,153,-649L144,-649C142,-649,140,-648,138,-648,137,-647,135,-646,135,-646L131,-636C130,-635,130,-633,130,-630,129,-627,129,-625,129,-623,129,-622,130,-620,131,-617,132,-615,133,-613,134,-612,135,-611,135,-609,135,-607,136,-606,136,-604,136,-603,136,-602,136,-598,136,-596,136,-593,136,-590,136,-590L129,-580,120,-575,100,-577,90,-579,84,-572,74,-569,63,-567,54,-559L53,-544,60,-531L70,-519,77,-502,81,-486,87,-474,95,-469,101,-463,109,-449,110,-439,115,-430,121,-422,127,-409,125,-393,127,-381,135,-369,140,-357,146,-343,150,-333,161,-322,165,-310,173,-297,178,-287,180,-253C180,-253,181,-235,181,-233,181,-231,176,-218,176,-218L169,-209,161,-195,150,-189,151,-175,153,-159C153,-159,159,-153,163,-152,166,-150,171,-148,174,-148,176,-148,181,-151,181,-151L187,-156,192,-160,196,-152,196,-152z",
                              "value": 8000
                          },
                          {
                              "name": "Chincheros",
                              "path": "M90,-579,100,-577,120,-575,129,-580,136,-590C136,-590,136,-593,136,-596,136,-598,136,-602,136,-603,136,-604,136,-606,135,-607,135,-609,135,-611,134,-612,133,-613,132,-615,131,-617,130,-620,129,-622,129,-623,129,-625,129,-627,130,-630,130,-633,130,-635,131,-636L135,-646C135,-646,137,-647,138,-648,140,-648,142,-649,144,-649L153,-649C157,-649,161,-649,165,-649,169,-649,173,-649,174,-649,177,-649,187,-652,187,-652,187,-652,188,-652,189,-653,190,-654,192,-655,194,-655,195,-655,198,-656,201,-658,203,-659,206,-660,206,-660L212,-664C212,-664,211,-668,210,-670,209,-671,209,-672,209,-674,209,-675,209,-676,208,-677,208,-678,208,-679,208,-681,207,-682,207,-683,206,-684,205,-686,202,-689,202,-689L202,-696,202,-703C202,-703,201,-705,201,-707,201,-708,201,-709,201,-710,201,-711,201,-712,201,-712,202,-714,205,-717,205,-717L209,-723,211,-730,214,-735,216,-740,212,-741,206,-745,202,-752,200,-759,195,-765,186,-770,174,-775,166,-782,155,-787,149,-794,138,-799,128,-802C128,-802,121,-807,119,-808C117,-810,118,-813,118,-813L114,-819L108,-823,100,-829,90,-833L83,-838,74,-842,67,-842,62,-845,66,-865,63,-891L51,-896,39,-896,26,-893,22,-885,21,-871,20,-856,11,-848,7,-838,7,-826,13,-824,16,-818,16,-806,8,-797,4,-787,0,-778,0,-768C0,-766,5,-755,5,-755L5,-738,6,-720,9,-704,13,-692,23,-681,23,-635,28,-630,39,-623,48,-617C48,-617,58,-605,60,-604,62,-603,72,-596,72,-596L79,-589,90,-579,90,-579z",
                              "value": 1080
                          }
                      ]
                  }

              ];
              // MAPA DEL PERU
              var mapa,
          grafico1,
          grafico2,
          data = [
                  {
                      //APURIMAC

                      "hc-key": "pe-ap",
                      "value": 10758,
                      drilldown: 'region-apurimac'
                  }
                  //ACREDITADAS
              ];
// INCIALIZADO EL MAPA
mapa = $('#container').highcharts('Map', {
                chart: {
                    width: 520,
                    height: 500,
                      events: {

                      }
                },
                  title: {
                      text: 'Apurimac'
                  },
                  subtitle: {
                      text: 'Fuente: Diresa Apurímac'
                  },
                  credits: {
                      enabled: false
                  },
                  mapNavigation: {
                      enabled: true,
                      buttonOptions: {
                          verticalAlign: 'bottom',
                          y: 35
                      }
                  },
                  legend: {
                      align: 'left',
                      title: {
                          text: 'Detección de Anemia <br/> por regiones'
                      },
                      y: 35,
                      x: 35,
                      floating: true
                  },
                  colorAxis: {
                      min: 0
                  },
                  tooltip: {
                      headerFormat: '<span style="font-size:10px">{series.name}</span><br/>',
                      pointFormat: '{point.name}: <b>{point.value:.1f} Personas</b><br/>',
                      footerFormat: '<span style="font-size:10px">Fuente: DIRESA Apurimac</span><br/>'
                  },
                  series: [{
                          data: data,
                          mapData: Highcharts.maps['countries/pe/pe-all'],
                          joinBy: 'hc-key',
                          name: 'Anemia',
                          allowPointSelect: true,
                          states: {
                              hover: {
                                  color: '#a4edba'
                              }
                          },

                          dataLabels: {
                              enabled: false,
                              format: '{point.name}'
                              //format: '{point.properties.postal-code}'
                          }
                      },
                      //CIUDADES DENTRO DEL MAPA DE PERU

                       //
                       // {
                       // type: 'mappoint',
                       // name: 'Acreditados',
                       //
                       // marker: {
                       // radius: 2,
                       // symbol: 'url(http://procalidad.gob.pe/images/universidad.png)'
                       // },
                       // dataLabels: {
                       // format: '{point.value}'
                       // },
                       // color: Highcharts.getOptions().colors[1],
                       // data: [{
                       // name: 'UNMSM: Carreras acreditadas',
                       // x: 350,
                       // y: -900,
                       // value: 2
                       // }, {
                       // name: 'Birmingham',
                       // x: 400,
                       // y: -1200,
                       // value: 3
                       // }, {
                       // name: 'Leeds',
                       // x: 800,
                       // y: -950,
                       // value: 1
                       // }, {
                       // name: 'Glasgow',
                       // x: 700,
                       // y: -800,
                       // value: 4
                       // }, {
                       // name: 'Sheffield',
                       // x: 650,
                       // y: -700,
                       // value: 2
                       // }, {
                       // name: 'Liverpool',
                       // x: 800,
                       // y: -1400,
                       // value: 6
                       // }, {
                       // name: 'Bristol',
                       // x: 1050,
                       // y: -680,
                       // value: 9
                       // }, {
                       // name: 'Belfast',
                       // x: 620,
                       // y: -850,
                       // value: 8
                       // }, {
                       // name: 'Lerwick',
                       // x: 500,
                       // y: -930,
                       // dataLabels: {
                       // align: 'left',
                       // x: 5,
                       // verticalAlign: 'middle'
                       // }
                       // }]
                       // }

                  ],
                  drilldown: {
                      series: dataD,
                      activeDataLabelStyle: {
                          color: 'white',
                          textDecoration: 'none'
                      },
                      drillUpButton: {
                          relativeTo: 'spacingBox',
                          position: {
                              x: 0,
                              y: 460
                          }
                      }
                  }
             });

});
