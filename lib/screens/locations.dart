import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/res/colors.dart';
import 'package:weatherapp/res/textstyle.dart';
import 'package:weatherapp/screens/service.dart';

class location extends StatelessWidget {
  location({super.key});
  List<String> cities = [
    "Abu Dhabi",
    "Ahmedabad",
    "Aleppo",
    "Alexandria",
    "Amman",
    "Amsterdam",
    "Ankara",
    "Athens",
    "Auckland",
    "Baghdad",
    "Baku",
    "Bamako",
    "Banda Aceh",
    "Bandung",
    "Bangkok",
    "Barcelona",
    "Basrah",
    "Beijing",
    "Beirut",
    "Bekasi",
    "Belgrade",
    "Berlin",
    "Bishkek",
    "Bogota",
    "Brasilia",
    "Bridgetown",
    "Brisbane",
    "Brussels",
    "Budapest",
    "Buenos Aires",
    "Bursa",
    "Busan",
    "Cairo",
    "Cali",
    "Caloocan",
    "Canberra",
    "Cape Town",
    "Chennai",
    "Chicago",
    "Chittagong",
    "Colombo",
    "Copenhagen",
    "Daejeon",
    "Dallas",
    "Damascus",
    "Dar es Salaam",
    "Delhi",
    "Denver",
    "Dhaka",
    "Dili",
    "Djibouti",
    "Doha",
    "Dubai",
    "Dublin",
    "Durban",
    "Dushanbe",
    "Faisalabad",
    "Fort-de-France",
    "Funafuti",
    "Gaborone",
    "George Town",
    "Georgetown",
    "Gibraltar",
    "Gitega",
    "Giza",
    "Guadalajara",
    "Guangzhou",
    "Gujranwala",
    "Hanoi",
    "Havana",
    "Helsinki",
    "Hong Kong",
    "Hyderabad",
    "Hyderabad",
    "Ibadan",
    "Incheon",
    "Islamabad",
    "Istanbul",
    "Izmir",
    "Jaipur",
    "Jakarta",
    "Jeddah",
    "Jerusalem",
    "Juarez",
    "Kabul",
    "Kampala",
    "Kanpur",
    "Karachi",
    "Karaj",
    "Kathmandu",
    "Kawasaki",
    "Khartoum",
    "Kingsburg",
    "Kobe",
    "Kolkata",
    "Kuala Lumpur",
    "Kuwait",
    "Kyiv",
    "Kyoto",
    "Lagos",
    "Lahore",
    "Libreville",
    "Lisbon",
    "London",
    "Los Angeles",
    "Luanda",
    "Lubumbashi",
    "Lusaka",
    "Luxembourg",
    "Madrid",
    "Makassar",
    "Malabo",
    "Mali",
    "Manama",
    "Mecca",
    "Medina",
    "Melbourne",
    "Mexico City",
    "Miami",
    "Monaco",
    "Montreal",
    "Moscow",
    "Multan",
    "Mumbai",
    "Muscat",
    "Nagoya",
    "Nairobi",
    "New York",
    "Oslo",
    "Ottawa",
    "Panama",
    "Paris",
    "Philadelphia",
    "Phoenix",
    "Port Louis",
    "Port of Spain",
    "Port-Vila",
    "Prague",
    "Pristina",
    "Puebla",
    "Pune",
    "Pyongyang",
    "Quito",
    "Rawalpindi",
    "Road Town",
    "Salvador",
    "San Diego",
    "San Francisco",
    "San Juan",
    "Santiago",
    "Sao Paulo",
    "Seattle",
    "Seoul",
    "Shanghai",
    "Sharjah",
    "Shenzhen",
    "Singapore",
    "Stockholm",
    "Sucre",
    "Sydney",
    "Tabriz",
    "Tashkent",
    "Tehran",
    "Tokyo",
    "Toronto",
    "Torshavn",
    "Tripoli",
    "Victoria",
    "Vienna",
    "Vientiane",
    "Warsaw",
    "Washington",
    "Yokohama",
    "Zagreb"
  ];

  void pop(String temp, BuildContext context) async {
    EasyLoading.show(status: "Please Wait ...");
    print(temp);
    Weather i = Weather(cityname: temp);
    await i.getweatherdata();
    EasyLoading.dismiss();
    Navigator.pop(context, {
      "cityname": i.cityname,
      "visibility": i.visibility,
      "weather_main": i.mainweather,
      "description": i.descriptionweather,
      "windspeed": i.windspeed,
      "degrees": i.degrees,
      "maintemp": i.maintemp,
      "mintemp": i.mintemp,
      "maxtemp": i.maxtemp,
      "humidity": i.humidity,
      "feelslike": i.feels_like,
      "sunset": i.sunset,
      "sunrise": i.sunrise,
      "date": i.date,
      "pressure": i.pressure,
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(gradient: MyColor.gradient2),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context); //add refresh function
                      },
                      icon: Icon(
                        Icons.arrow_back_sharp,
                        size: height * 0.03,
                        color: Colors.white,
                      )),
                  Text(
                    "Back",
                    style: FontStyles(height: height * 0.024).normal,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select City",
                    style: FontStyles(height: height * 0.035).normal,
                  ),
                  IconButton(
                      onPressed: () {
                        showSearch(
                            context: context, delegate: CustomSearchDelegate());
                      },
                      icon: Icon(
                        Icons.search,
                        size: height * 0.03,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            Flexible(
              child: SizedBox(
                child: ListView(
                    children: List.generate(cities.length, (index) {
                  return Column(
                    children: [
                      Card(
                          elevation: 0.00,
                          color: Colors.transparent,
                          child: ListTile(
                            onTap: () {
                              pop(cities[index], context);
                            },
                            title: Text(cities[index],
                                style:
                                    FontStyles(height: height * 0.023).normal),
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                        child: Container(
                          height: height * 0.001,
                          color: Colors.grey[400],
                          width: double.infinity,
                        ),
                      ),
                    ],
                  );
                })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {

    @override
      ThemeData appBarTheme(BuildContext context) {
  final ThemeData theme = Theme.of(context);
  return theme.copyWith(
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: MyColor.search1,
      titleTextStyle: GoogleFonts.jost(color: Colors.white),
      toolbarTextStyle: GoogleFonts.jost(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: GoogleFonts.jost(fontSize: 20, color: Colors.white),
      hintStyle: GoogleFonts.jost(fontSize: 20, color: Colors.white),
      border: InputBorder.none,
      // Set the text style to white here
      // This is where you define the text color in the TextField
      prefixStyle: GoogleFonts.poppins(color: Colors.white),
      suffixStyle: GoogleFonts.poppins(color: Colors.white),
    ),
    textTheme: theme.textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white),
  );
}
  void pop(String name) async {}
  location i = location();
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,color: Colors.white,
        ),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back,color: Colors.white,),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    List<String> matchresults = [];
    for (var city in i.cities) {
      if (city.toLowerCase().contains(query.toLowerCase()))
        matchresults.add(city);
    }
    return Container(
      decoration: const BoxDecoration(gradient: MyColor.gradient2),
      child: ListView(
        children: List.generate(matchresults.length, (index) {
          return Column(
            children: [
              Card(
                  elevation: 0.00,
                  color: Colors.transparent,
                  child: ListTile(
                    title: Text(matchresults[index],
                        style: FontStyles(height: height * 0.023).normal),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                child: Container(
                  height: height * 0.001,
                  color: Colors.grey[400],
                  width: double.infinity,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    List<String> matchresults = [];
    for (var city in i.cities) {
      if (city.toLowerCase().contains(query.toLowerCase()))
        matchresults.add(city);
    }
    return Container(
      decoration: const BoxDecoration(gradient: MyColor.gradient2),
      child: ListView(
        children: List.generate(matchresults.length, (index) {
          return Column(
            children: [
              Card(
                  elevation: 0.00,
                  color: Colors.transparent,
                  child: ListTile(
                    onTap: () async {
                      query = matchresults[index];
                      EasyLoading.show(status: "Please Wait ...");
                      Weather i = Weather(cityname: query);
                      await i.getweatherdata();
                      EasyLoading.dismiss();
                      Navigator.pushReplacementNamed(context, '/home',
                          arguments: {
                            "cityname": i.cityname,
                            "visibility": i.visibility,
                            "weather_main": i.mainweather,
                            "description": i.descriptionweather,
                            "windspeed": i.windspeed,
                            "degrees": i.degrees,
                            "maintemp": i.maintemp,
                            "mintemp": i.mintemp,
                            "maxtemp": i.maxtemp,
                            "humidity": i.humidity,
                            "feelslike": i.feels_like,
                            "sunset": i.sunset,
                            "sunrise": i.sunrise,
                            "date": i.date,
                            "pressure": i.pressure
                          });
                    },
                    title: Text(matchresults[index],
                        style: FontStyles(height: height * 0.023).normal),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                child: Container(
                  height: height * 0.001,
                  color: Colors.grey[400],
                  width: double.infinity,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}



// Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Select City",
//           style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               showSearch(context: context, delegate: CustomSearchDelegate());
//             },
//           )
//         ],
//       ),
//       body: ListView(
//         children: List.generate(cities.length, (index) {
//           return Card(
//             child: ListTile(
//               onTap: () {
//                 pop(cities[index], context);
//               },
//               leading: Icon(
//                 Icons.location_city,
//                 color: Colors.blue,
//                 size: 30,
//               ),
//               title: Text(
//                 cities[index],
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),
//           );
//         }),
//       ),
//     );