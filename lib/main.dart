import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:weatherapp/model/location_model.dart';
import 'package:weatherapp/model/citymodel.dart';
import 'package:weatherapp/screens/home.dart';
import 'package:weatherapp/screens/loading.dart';
import 'package:weatherapp/screens/locations.dart';
//refresh not working properly and also add location based weather 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cityModelController = Get.put(CityModel());
  await cityModelController.extractDataFromJson();
  SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp]).then((_) {
     runApp(MaterialApp(
    routes: {
      '/loading': (context) => loading(),
      '/home': (context) => home(),
      '/location': (context) => location(),
    },
    initialRoute: '/loading',
    debugShowCheckedModeBanner: false,
    title: "Weather App",
    theme: ThemeData(
      primaryColor: Colors.orange.shade400,
    ),
    builder: EasyLoading.init(),
  ));
  });
 
}
