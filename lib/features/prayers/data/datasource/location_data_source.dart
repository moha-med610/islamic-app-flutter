import 'package:geolocator/geolocator.dart';

abstract class BaseLocationDataSource {
  Future<Position> getLocation();
}

class LocationDataSource implements BaseLocationDataSource {
  @override
  Future<Position> getLocation() async {
    bool enabled = await Geolocator.isLocationServiceEnabled();

    if (!enabled) {
      throw Exception("Location is Not Enabled");
    }

    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    } else if (permission == LocationPermission.deniedForever) {
      throw Exception("Please Enabled Location Permission");
    }

    return await Geolocator.getCurrentPosition();
  }
}
