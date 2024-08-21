import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:weatherapp/model/citymodel.dart';

class LocationModel {
  final controller = Get.put(CityModel());
Future<Position> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;
  
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    Get.snackbar("Error", 'Location services are disabled.');
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition(
    locationSettings: AndroidSettings(accuracy: LocationAccuracy.high,timeLimit: const Duration(seconds: 100)),);
}



Future<String> getCityName(Position position) async {
  List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude, position.longitude);

  if (placemarks.isNotEmpty) {  
    print("My Location ${placemarks[0]}");
    print("My Location ${placemarks.first.locality}"); 
    print("Sub Area Location ${placemarks[0].subAdministrativeArea}");// current
    return placemarks[0].subAdministrativeArea ?? "Unknown"; // This often corresponds to the district
  }
  return "Unknown";
}

Future<String> getWeatherForNearestCity() async {
  try {
    Position position = await getCurrentLocation();
    String city = await getCityName(position);
    print("City" + city);
    String finalcity = controller.cityNames.where((c) => c.contains(city)).toString();
    finalcity = finalcity.replaceAll(RegExp(r'[\(\)]'), '');
    print("Final City $finalcity");
    print("City Name $finalcity");
    return finalcity;
  } catch (e) {
    print("Error from getting location" +e.toString());
    return "Unknown";
  }
}
}