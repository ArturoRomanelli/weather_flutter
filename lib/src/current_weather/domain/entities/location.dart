class Location {
  const Location({
    required this.name,
    required this.lat,
    required this.long,
  });

  /// Latitude of this place
  final double lat;

  /// Longitude of this place
  final double long;

  /// A human-readable name of this place
  final String name;
}
