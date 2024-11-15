class LocationCoordinate {
  final String latitude;
  final String longitude;
  LocationCoordinate({required this.latitude, required this.longitude});

  factory LocationCoordinate.fromMap(Map<String, dynamic> json) {
    return LocationCoordinate(
        latitude: json['latitude'], longitude: json['longitude']);
  }
}
