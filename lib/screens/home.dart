import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/res/colors.dart';
import 'package:weatherapp/res/images.dart';
import 'package:weatherapp/res/textstyle.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    data = data.isNotEmpty
        ? data = data
        : data = ModalRoute.of(context)?.settings.arguments as Map;
    return Container(
      decoration: const BoxDecoration(
        gradient: MyColor.gradient1,
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(data['cityname'],
                          style: FontStyles(
                                  color: Colors.grey[200],
                                  height: height * 0.024)
                              .normal

                          // GoogleFonts.inter(
                          //     color: Colors.grey[300], fontSize: height * 0.024),
                          ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_outward_outlined,
                            color: Colors.white,
                            size: height * 0.028,
                          ))
                    ],
                  ),
                  Text("GOOD MORNING,",
                      style: FontStyles(height: height * 0.035).normal),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                            height: height * 0.27,
                            width: width * 0.6,
                            child: Image.asset(
                              ImageAssets.cloudwithsun,
                              fit: BoxFit.cover,
                            )),
                            SizedBox(
                    height: height * 0.05,
                  ),
                        Text(
                          "${data['maintemp']}° C",
                          style: FontStyles(height: height * 0.09).normal,
                        ),
                        Text(
                          data['weather_main'].toString().toUpperCase(),
                          style: FontStyles(
                                  height: height * 0.035,
                                  color: Colors.grey[400])
                              .normal,
                        ),
                        Text(
                          data['date'],
                          style: FontStyles(
                                  height: height * 0.021,
                                  color: Colors.grey[600])
                              .normal,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(ImageAssets.sun,height: height * 0.035,),
                            SizedBox(width: width * 0.03,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Sunrise",style: FontStyles(height: height * 0.018).normal,),
                                 Text(data['sunrise'],style: FontStyles(height: height * 0.02).normal,),
                                
                              ],
                            )
                          ],
                        ),
                         Row(
                          children: [
                            Image.asset(ImageAssets.moon,height: height * 0.035,),
                            SizedBox(width: width * 0.03,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Sunset",style: FontStyles(height: height * 0.018).normal,),
                                 Text(data['sunset'],style: FontStyles(height: height * 0.02).normal,),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                    child: Container(height: height * 0.001,color: Colors.grey[400],width: double.infinity,),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05,vertical: height * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Pressure",style: FontStyles(height: height * 0.02,color: Colors.grey[600]).normal,),
                             Text("${double.parse(data['pressure']).toStringAsFixed(2)} Hg",style: FontStyles(height: height * 0.025).normal,),
                            
                          ],
                        ),
                         Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Humidity",style: FontStyles(height: height * 0.02,color: Colors.grey[600]).normal,),
                              Text("${data['humidity']}%",style: FontStyles(height: height * 0.025).normal,),
                           ],
                         ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                    child: Container(height: height * 0.001,color: Colors.grey[400],width: double.infinity,),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05,vertical: height * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${data['degrees']} Wind",style: FontStyles(height: height * 0.02,color: Colors.grey[600]).normal,),
                             Text("${data['windspeed']}kph",style: FontStyles(height: height * 0.025).normal,),
                            
                          ],
                        ),
                         Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Feels Like",style: FontStyles(height: height * 0.02,color: Colors.grey[600]).normal,),
                              Text("${data['feelslike']}%",style: FontStyles(height: height * 0.025).normal,),
                           ],
                         ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}


// Scaffold(
  //     backgroundColor: Colors.blue.shade400,
  //     body: Center(
  //       child: SingleChildScrollView(
  //         child: Center(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Container(
  //               child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Text(data['cityname'],style: TextStyle(fontSize: 32,
  //                       color: Colors.white,
  //                       fontWeight: FontWeight.bold,
  //                       letterSpacing: 0.96),),
  //                       SizedBox(height: 20,),
  //                       Padding(
  //                             padding: const EdgeInsets.all(8.0),
  //                             child: Container(
  //                               height: 30,
  //                               width: 200,
  //                               decoration: BoxDecoration(
  //                                 color: Colors.black,
  //                                 borderRadius: BorderRadius.circular(100) 
  //                               ),
  //                             child: Center(child: Text(data['date'],
  //                            style: TextStyle(fontSize: 20,
  //                            color: Colors.white),)),
  //                         ),
  //                       ),
  //                       SizedBox(height: 20,),
  //                             Text(data['weather_main'],
  //                                 style: TextStyle(fontSize: 24,
  //                                 color: Colors.white,
  //                                 fontWeight: FontWeight.bold,
  //                                 letterSpacing: 0.72)),
  //                       SizedBox(height: 20,),
  //                           Text("${data['maintemp']}°ᶜ",
  //                               style: TextStyle(fontSize: 128,
  //                               color: Colors.white,
  //                               fontWeight: FontWeight.bold,
  //                               letterSpacing: 0.72)),
  //                       SizedBox(width: 20,), 
  //                       Text("${data['description']}",
  //                           style: TextStyle(
  //                           fontSize: 20,
  //                           color: Colors.white,
  //                           fontWeight: FontWeight.bold,
  //                       )
  //                       ),
  //                 SizedBox(height: 30,),
  //                 Container(
  //                     height: 330,
  //                     width: 330,
  //                     decoration: BoxDecoration(
  //                       color: Colors.black,
  //                       borderRadius: BorderRadius.circular(20),
  //                     ),
  //                      child:  Column(
  //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                        children: [
  //                          Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                               children: [
  //                                 Card(
  //                                   color: Colors.black,
  //                                   child: InkWell(
  //                                     child:Column(
  //                                       mainAxisAlignment: MainAxisAlignment.center,
  //                                       children: [
  //                                         Icon(Icons.air_rounded,color: Colors.blue.shade400,size: 40,),
  //                                         SizedBox(height:20),
  //                                         Text("${data['windspeed']} km/h",style: TextStyle(
  //                                           color: Colors.blue.shade400,
  //                                           fontSize: 23
  //                                         ),),
  //                                         Text("${data['degrees']} wind",style: TextStyle(
  //                                           color: Colors.blue.shade400,
  //                                           fontSize: 20
  //                                         ),),
  //                                       ],
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 Card(
  //                                   color: Colors.black,
  //                                   child: InkWell(
  //                                     child:Column(
  //                                       mainAxisAlignment: MainAxisAlignment.center,
  //                                       children: [
  //                                         Icon(Icons.water_drop,color: Colors.blue.shade400,size: 40,),
  //                                         SizedBox(height:20),
  //                                         Text("${data['humidity']}%",style: TextStyle(
  //                                           color: Colors.blue.shade400,
  //                                           fontSize: 23
  //                                         ),),
  //                                         Text("Humidity",style: TextStyle(
  //                                           color: Colors.blue.shade400,
  //                                           fontSize: 20
  //                                         ),),
  //                                       ],
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 Card(
  //                                   color: Colors.black,
  //                                   child: InkWell(
  //                                     child:Column(
  //                                       mainAxisAlignment: MainAxisAlignment.center,
  //                                       children: [
  //                                         Icon(Icons.remove_red_eye,color: Colors.blue.shade400,size: 40,),
  //                                         SizedBox(height:20),
  //                                         Text("${data['visibility']} km",style: TextStyle(
  //                                           color: Colors.blue.shade400,
  //                                           fontSize: 23
  //                                         ),),
  //                                         Text("Visibility",style: TextStyle(
  //                                           color: Colors.blue.shade400,
  //                                           fontSize: 20
  //                                         ),),
  //                                       ],
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                             Row(
  //                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                               children: [
  //                                 Expanded(
  //                                   child: Card(
  //                                     color: Colors.black,
  //                                     child: InkWell(
  //                                       child:Column(
  //                                         mainAxisAlignment: MainAxisAlignment.center,
  //                                         children: [
  //                                           Icon(Icons.sunny,color: Colors.blue.shade400,size: 40,),
  //                                           SizedBox(height:20),
  //                                           Text("${data['sunrise']}",style: TextStyle(
  //                                             color: Colors.blue.shade400,
  //                                             fontSize: 23
  //                                           ),),
  //                                           Text("Sunrise",style: TextStyle(
  //                                             color: Colors.blue.shade400,
  //                                             fontSize: 20
  //                                           ),),
  //                                         ],
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 Expanded(
  //                                   child: Card(
  //                                     color: Colors.black,
  //                                     child: InkWell(
  //                                       child:Column(
  //                                         mainAxisAlignment: MainAxisAlignment.center,
  //                                         children: [
  //                                           Icon(Icons.sunny,color: Colors.blue.shade400,size: 40,),
  //                                           SizedBox(height:20),
  //                                           Text("${data['sunset']}",style: TextStyle(
  //                                             color: Colors.blue.shade400,
  //                                             fontSize: 23
  //                                           ),),
  //                                           Text("Sunset",style: TextStyle(
  //                                             color: Colors.blue.shade400,
  //                                             fontSize: 20
  //                                           ),),
  //                                         ],
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ],
  //                             )
  //                        ],
  //                      ),
  //                      ),
  //                     ]
  //                   ),
  //               ),
  //           ],
  //         ),
  //         ),
  //       ),
  //     ),
  // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
  // floatingActionButton: FloatingActionButton(
  //   onPressed: () async{
  //     dynamic  result = await Navigator.pushNamed(context, '/location');
  //     setState(() {
  //       data = result;
  //     });
  //   },
  //   disabledElevation: 0,
  //   backgroundColor: Colors.black,
  //   child: Icon(Icons.public,size: 30,color: Colors.blue.shade400,),
  //   ),
  // );