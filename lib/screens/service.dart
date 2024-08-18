import 'package:http/http.dart';
import 'dart:convert';
import 'package:date_time_format/date_time_format.dart';
class Weather {
  //maps and variables directly from data
  List weatherList = [];
  Map<dynamic,dynamic> weatherinfo = {}; 
  Map<String,dynamic> sun = {}; 
  Map<String,dynamic> temperatures = {}; 
  Map<String,dynamic> windinfo = {}; 
  String? cityname; 
  String? date;
  String? visibility;
  // used under maps
  String? mainweather;  //rain,sunny
  String? descriptionweather;
  String? windspeed; 
  String? degrees ; 
  String? maintemp;
  String? mintemp;
  String? maxtemp; 
  String? humidity;
  String? feels_like;
  String? sunrise;
  String? sunset;
  int? timezone;
  String? pressure;
  Weather({this.cityname});

Future<void> getweatherdata() async {
try{
  double temp;int t;
  DateTime dateformat = DateTime.now();
  date = DateTimeFormat.format(dateformat,format: "l j · g.i a");
  print(date);
  Response response = await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=9a997751786e636840ea481cbe506c1c'));
  Map<dynamic,dynamic> data = jsonDecode(response.body);
  print(data);
  cityname = data['name'];
  temp = (data['visibility'])/1000;
  t = temp.toInt();
  visibility = t.toString();
  windinfo = data['wind'];
  windspeed = windinfo['speed'].toString();
    if((windinfo['deg']! >= 0 && windinfo['deg']! <= 22.4 )|| (windinfo['deg']! >= 337.4 && windinfo['deg']! <= 360)) 
  {
    degrees = "North";
  }
  else if(windinfo['deg']! >= 22.5 && windinfo['deg']! <= 67.4 )
  {
    degrees = "NE";
  }
    else if(windinfo['deg']! >= 67.5 && windinfo['deg']! <= 112.4 )
  {
    degrees = "East";
  }
    else if(windinfo['deg']! >= 122.5 && windinfo['deg']! <= 157.4 )
  {
    degrees = "SE";
  }
    else if(windinfo['deg']! >= 157.5 && windinfo['deg']! <= 202.4 )
  {
    degrees = "South";
  }
    else if(windinfo['deg']! >= 202.5 && windinfo['deg']! <= 247.4 )
  {
    degrees = "SW";
  }
    else if(windinfo['deg']! >= 247.5 && windinfo['deg']! <= 292.4 )
  {
    degrees = "West";
  }
    else if(windinfo['deg']! >= 292.5 && windinfo['deg']! <= 337.5 )
  {
    degrees = "NW";
  }
  temperatures = data['main'];
  temp = (temperatures['temp']! - 273.15);
  t = temp.toInt();
  maintemp = t.toString();
  print("main temp $maintemp");
  temp = (temperatures['feels_like']! - 273.15);
  t = temp.toInt();
  feels_like = t.toString();
  temp = (temperatures['temp_min']! - 273.15);
  t= temp.toInt();
  mintemp = t.toString();
  print("min temp $mintemp");
  temp = (temperatures['temp_max']! - 273.15);
  t = temp.toInt();
  maxtemp = t.toString();
  print("max temp $maxtemp");
  humidity = temperatures['humidity'].toString();
  pressure = (temperatures['pressure'] * 0.02953).toString();
  weatherList = data['weather'];
  weatherinfo = weatherList[0];
  mainweather = weatherinfo['main'];
  descriptionweather = weatherinfo['description'].toUpperCase();
  print(descriptionweather);
  sun = data['sys'];
  timezone = data['timezone'];
  sun['sunrise'] = sun['sunrise'] + timezone;
  DateTime sunrisedata = DateTime.fromMillisecondsSinceEpoch(sun['sunrise'] * 1000,isUtc: true);
  sunrise = DateTimeFormat.format(sunrisedata,format: r'g:i a');
  print(sunrise);
  sun['sunset'] = sun['sunset'] +timezone;
  sunrisedata = DateTime.fromMillisecondsSinceEpoch(sun['sunset']*1000,isUtc: true);
  sunset = DateTimeFormat.format(sunrisedata,format: r'g:i a');
  print(sunset);
}
catch(e)
{
  print("Error Loading The Data.Error $e");
}
}
}

