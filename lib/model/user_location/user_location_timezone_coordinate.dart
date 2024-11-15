class LocationTimezoneCoordinate {
  final String offset;
  final String description;

  LocationTimezoneCoordinate({required this.offset, required this.description});

  factory LocationTimezoneCoordinate.fromMap(Map<String, dynamic> json) {
    return LocationTimezoneCoordinate(
        offset: json['offset'], description: json['description']);
  }
}
