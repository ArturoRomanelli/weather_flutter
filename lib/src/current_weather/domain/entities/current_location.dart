class CurrentLocation {
  const CurrentLocation({required this.cityName, this.lat, this.long});

  /// Latitude of this place
  final double? lat;

  /// Longitude of this place
  final double? long;

  /// City name
  final String cityName;
}
