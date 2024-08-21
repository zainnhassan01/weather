import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weatherapp/model/location_model.dart';
import 'package:weatherapp/res/colors.dart';
import 'package:weatherapp/res/images.dart';
import 'package:weatherapp/res/textstyle.dart';
import 'package:weatherapp/model/citymodel.dart';
import 'package:weatherapp/screens/locations.dart';
import 'package:weatherapp/model/service.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  bool loadingrefresh = false;
  final controller = Get.find<CityModel>();
  Map data = {};
  String getGreetingBasedOnTime() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return "Good Morning";
    } else if (hour >= 12 && hour < 17) {
      return "Good Afternoon";
    } else if (hour >= 17 && hour < 20) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }

  Future<void> _refresh() async {
    setState(() {
      loadingrefresh = true;
    });
    // controller.mycity.value = await LocationModel().getWeatherForNearestCity();
    Weather i = Weather(cityname: controller.mycity.value);
    await i.getweatherdata();
    await Future.delayed(
      const Duration(seconds: 5),
    );
    setState(() {
      data['cityname'] = i.cityname;
      data['visibility'] = i.visibility;
      data['weather_main'] = i.mainweather;
      data['description'] = i.descriptionweather;
      data['windspeed'] = i.windspeed;
      data['degrees'] = i.degrees;
      data['maintemp'] = i.maintemp;
      data['mintemp'] = i.mintemp;
      data['maxtemp'] = i.maxtemp;
      data['humidity'] = i.humidity;
      data['feelslike'] = i.feels_like;
      data['sunset'] = i.sunset;
      data['sunrise'] = i.sunrise;
      data['date'] = i.date;
      data['pressure'] = i.pressure;
    });
    setState(() {
      loadingrefresh = false;
    });
  }

  showMySnackbar() {
    if (data['weather_main'] == null) {
      print("exe");
      // Get.showSnackbar(GetSnackBar(title: "Error", message: "No Internet Connection", backgroundColor: Colors.white));
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 2,
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 20),
            action: SnackBarAction(
              label: "Try Again",
              onPressed: _refresh,
              textColor: Colors.red,
            ),
            content: Text(
              "Check your Internet Connection",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            duration: Duration(seconds: 7),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    data = data.isNotEmpty
        ? data = data
        : data = ModalRoute.of(context)?.settings.arguments as Map;
    print("weathebtrje ${data['weather_main']}");
    if (loadingrefresh == false) {
      showMySnackbar();
    }
    bool isNight = DateTime.now().hour < 6 || DateTime.now().hour >= 18;
    return Container(
      decoration: const BoxDecoration(
        gradient: MyColor.gradient1,
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: loadingrefresh
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingAnimationWidget.beat(
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Text("Refreshing...",style: FontStyles(height: height * 0.02,color: Colors.white).normal,)
                  ],
                ))
              : RefreshIndicator(
                  onRefresh: _refresh,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(data['cityname'] ?? "Unknown Location",
                                    style: FontStyles(
                                            color: Colors.grey[200],
                                            height: height * 0.024)
                                        .normal),
                                IconButton(
                                    onPressed: () async {
                                      dynamic result =
                                          await Navigator.pushNamed(
                                              context, '/location');
                                      setState(() {
                                        data = result;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.arrow_outward_outlined,
                                      color: Colors.white,
                                      size: height * 0.028,
                                    ))
                              ],
                            ),
                            Text("${getGreetingBasedOnTime()},",
                                style:
                                    FontStyles(height: height * 0.035).normal),
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
                                        getWeatherImage(
                                            (data['weather_main'] ?? "Clear")
                                                .toString()
                                                .toLowerCase(),
                                            isNight: isNight,
                                            description:
                                                data['description'] ?? ""),
                                        fit: BoxFit.cover,
                                      )),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text(
                                    "${data['maintemp'] ?? "0"}° C",
                                    style: FontStyles(height: height * 0.09)
                                        .normal,
                                  ),
                                  Text(
                                    data['weather_main'] ??
                                        "Not Available"
                                            .toString()
                                            .toUpperCase(),
                                    style: FontStyles(
                                            height: height * 0.035,
                                            color: Colors.grey[400])
                                        .normal,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.05,
                                        vertical: height * 0.01),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.arrow_upward,
                                              color: Colors.grey[600],
                                            ),
                                            Text(
                                              "${data['maxtemp'] ?? "0"}° C",
                                              style: FontStyles(
                                                      height: height * 0.025,
                                                      color: Colors.grey[600])
                                                  .normal,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: width * 0.05,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.arrow_downward,
                                              color: Colors.grey[600],
                                              size: height * 0.028,
                                            ),
                                            Text(
                                              "${data['mintemp'] ?? "0"}° C",
                                              style: FontStyles(
                                                      height: height * 0.025,
                                                      color: Colors.grey[600])
                                                  .normal,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Text(
                                  //   data['date'],
                                  //   style: FontStyles(
                                  //           height: height * 0.021,
                                  //           color: Colors.grey[600])
                                  //       .normal,
                                  // ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        ImageAssets.sun,
                                        height: height * 0.035,
                                      ),
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Sunrise",
                                            style: FontStyles(
                                                    height: height * 0.018,
                                                    color: Colors.grey[600])
                                                .normal,
                                          ),
                                          Text(
                                            data['sunrise'] ?? "00:00 am",
                                            style: FontStyles(
                                                    height: height * 0.02)
                                                .normal,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        ImageAssets.moon,
                                        height: height * 0.035,
                                      ),
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Sunset",
                                            style: FontStyles(
                                                    height: height * 0.018,
                                                    color: Colors.grey[600])
                                                .normal,
                                          ),
                                          Text(
                                            data['sunset'] ?? "00:00 pm",
                                            style: FontStyles(
                                                    height: height * 0.02)
                                                .normal,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02),
                              child: Container(
                                height: height * 0.001,
                                color: Colors.grey[400],
                                width: double.infinity,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.05,
                                  vertical: height * 0.01),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Pressure",
                                        style: FontStyles(
                                                height: height * 0.02,
                                                color: Colors.grey[600])
                                            .normal,
                                      ),
                                      Text(
                                        "${double.parse(data['pressure'] ?? "0").toStringAsFixed(2)} Hg",
                                        style:
                                            FontStyles(height: height * 0.025)
                                                .normal,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Humidity",
                                        style: FontStyles(
                                                height: height * 0.02,
                                                color: Colors.grey[600])
                                            .normal,
                                      ),
                                      Text(
                                        "${data['humidity'] ?? "0"}%",
                                        style:
                                            FontStyles(height: height * 0.025)
                                                .normal,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02),
                              child: Container(
                                height: height * 0.001,
                                color: Colors.grey[400],
                                width: double.infinity,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.05,
                                  vertical: height * 0.01),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${data['degrees'] ?? "W"} Wind",
                                        style: FontStyles(
                                                height: height * 0.02,
                                                color: Colors.grey[600])
                                            .normal,
                                      ),
                                      Text(
                                        "${data['windspeed'] ?? "0"}kph",
                                        style:
                                            FontStyles(height: height * 0.025)
                                                .normal,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Feels Like",
                                        style: FontStyles(
                                                height: height * 0.02,
                                                color: Colors.grey[600])
                                            .normal,
                                      ),
                                      Text(
                                        "${data['feelslike'] ?? "25"}° C",
                                        style:
                                            FontStyles(height: height * 0.025)
                                                .normal,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
    );
  }

  String getWeatherImage(String weatherCondition,
      {bool isNight = false, String description = ""}) {
    switch (weatherCondition) {
      case 'clear':
        return isNight ? ImageAssets.moon : ImageAssets.sun;
      case 'clouds':
        return isNight
            ? ImageAssets.clouds
            : (description == "few clouds" || description == "scattered clouds")
                ? ImageAssets.sunwithclouds
                : ImageAssets.clouds;
      case 'rain':
        return ImageAssets.rain;
      case 'drizzle':
        return isNight ? ImageAssets.rain : ImageAssets.sunwithlightrain;
      case 'snow':
        return ImageAssets.snow;
      case 'thunderstorm':
        return ImageAssets.rainwiththunderstorm;
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
      case 'sand':
      case 'ash':
        return ImageAssets
            .breeze; // Use breeze as a generic image for reduced visibility
      case 'squall':
        return ImageAssets.sunwithlightrain;
      case 'tornado':
        return ImageAssets.breeze; // Placeholder image
      default:
        return ImageAssets.sun; // Default to sun if condition is unknown
    }
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