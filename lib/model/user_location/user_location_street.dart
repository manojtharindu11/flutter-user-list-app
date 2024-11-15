class LocationStreet {
  final int number;
  final String name;
  LocationStreet({required this.number, required this.name});

  factory LocationStreet.fromMap(Map<String, dynamic> json) {
    return LocationStreet(number: json['number'], name: json['name']);
  }
}
