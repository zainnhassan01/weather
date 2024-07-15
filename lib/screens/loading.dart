import 'package:weatherapp/screens/service.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {

void callservices() async
{
  Weather i = Weather(cityname: "Islamabad");
  await i.getweatherdata();
  Navigator.pushReplacementNamed(context, '/home',arguments: {
    "cityname" : i.cityname, 
    "visibility" : i.visibility, 
    "weather_main": i.mainweather, 
    "description": i.descriptionweather, 
    "windspeed" : i.windspeed,
    "degrees" : i.degrees,
    "maintemp" : i.maintemp, 
    "mintemp" : i.mintemp,
    "maxtemp" : i.maxtemp,
    "humidity" : i.humidity,
    "feelslike" : i.feels_like,  
    "sunset" : i.sunset,
    "sunrise" : i.sunrise,
    "date" : i.date, 
  });
}
@override
  void initState() {
    super.initState();
    callservices();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("WEATHER APP",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            LoadingAnimationWidget.beat(color: Colors.white, size: 30),
          ],
        )),
    );
  }
}