import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

class CityModel extends GetxController {
  RxList<String> cityNames = <String>[].obs;
  RxList<String> cityviewlist = <String>[].obs;
  RxString mycity = "Unknown".obs;
  late List<dynamic> jsonData;
  extractDataFromJson() async {
    // final file = File('assets/citiesjson/current.city.list.json');
    final jsonString =
        await rootBundle.loadString('assets/citiesjson/current.city.list.json');

    // Decode the JSON data
    jsonData = jsonDecode(jsonString);

    // Extract city names
    for (var city in jsonData) {
      cityNames.add(city['name']);
    }
    cityNames.removeAt(0);
    cityNames.removeAt(1);
    cityNames.sort();
    List<dynamic> filteredjson =
        jsonData.where((city) => city['stat']['population'] >= 750000).toList();
    for (var city in filteredjson) {
      cityviewlist.add(city['name']);
    }
    cityviewlist.sort();
    return cityviewlist;
  }
}
