import 'package:weather_flutter/src/current_location/domain/entities/current_location.dart';

import '../services/geolocation_service.dart';

extension CurrentLocationFromGeolocation on GeoLocation {
  CurrentLocation toDomain() {
    return CurrentLocation(lat: position.lat, long: position.long);
  }
}
