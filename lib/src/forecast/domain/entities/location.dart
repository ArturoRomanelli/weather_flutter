class Location {
  const Location({
    required this.cityName,
    required this.lat,
    required this.long,
  });

  /// Latitude of this place
  final double lat;

  /// Longitude of this place
  final double long;

  /// City name
  final String cityName;
}
