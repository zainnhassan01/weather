import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:weatherapp/screens/service.dart';

class location extends StatelessWidget {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select City",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          )
        ],
      ),
      body: ListView(
        children: List.generate(cities.length, (index) {
          return Card(
            child: ListTile(
              onTap: () {
                pop(cities[index], context);
              },
              leading: Icon(
                Icons.location_city,
                color: Colors.blue,
                size: 30,
              ),
              title: Text(
                cities[index],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  void pop(String name) async {}
  location i = location();
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
        ),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  Widget buildResults(BuildContext context) {
    List<String> matchresults = [];
    for (var city in i.cities) {
      if (city.toLowerCase().contains(query.toLowerCase()))
        matchresults.add(city);
    }
    return ListView(
      children: List.generate(matchresults.length, (index) {
        return Card(
          child: ListTile(
            title: Text(
              matchresults[index],
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      }),
    );
  }

  Widget buildSuggestions(BuildContext context) {
    List<String> matchresults = [];
    for (var city in i.cities) {
      if (city.toLowerCase().contains(query.toLowerCase()))
        matchresults.add(city);
    }
    return ListView(
      children: List.generate(matchresults.length, (index) {
        return Card(
          child: ListTile(
            onTap: () async {
              query = matchresults[index];
              EasyLoading.show(status: "Please Wait ...");
              Weather i = Weather(cityname: query);
              await i.getweatherdata();
              EasyLoading.dismiss();
              Navigator.pushReplacementNamed(context, '/home', arguments: {
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
              });
            },
            title: Text(
              matchresults[index],
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      }),
    );
  }
}
