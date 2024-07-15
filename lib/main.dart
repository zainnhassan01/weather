import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:weatherapp/screens/home.dart';
import 'package:weatherapp/screens/loading.dart';
import 'package:weatherapp/screens/locations.dart';
void main() => runApp(MaterialApp(
  routes: {
    '/loading' :(context) => loading(),
    '/home' :(context) => home(),
    '/location':(context) => location(),
  },
  initialRoute: '/loading',
  debugShowCheckedModeBanner: false,
  title: "Weather App",
  theme: ThemeData(
    primaryColor: Colors.blue.shade400,
  ),
  builder: EasyLoading.init(),

));