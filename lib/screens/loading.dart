import 'package:get/get.dart';
import 'package:weatherapp/model/location_model.dart';
import 'package:weatherapp/model/service.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weatherapp/model/citymodel.dart';
import 'package:weatherapp/res/colors.dart';

class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  final controller = Get.find<CityModel>();
  void callservices() async {
    print("Location from callservices ${controller.mycity.value}");
    Weather i = Weather(cityname: controller.mycity.value);
    await i.getweatherdata();
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
      "pressure": i.pressure
    });
  }

  getLocation() async {
    controller.mycity.value = await LocationModel().getWeatherForNearestCity();
  }

  @override
  void initState() {
    super.initState();
    _initializeServices();
  }

  void _initializeServices() async {
    await getLocation(); // Wait for the location to be fetched
    callservices(); // Now call the service with the updated location
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: MyColor.gradient1),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "WEATHER APP",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            LoadingAnimationWidget.beat(color: Colors.white, size: 30),
          ],
        )),
      ),
    );
  }
}
