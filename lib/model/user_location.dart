class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postCode;
  final LocationCoordinates coordinates;
  final LocationTimezoneCoordinate timezone;
  final LocationStreet street;
  UserLocation(
      {required this.city,
      required this.state,
      required this.country,
      required this.postCode,
      required this.coordinates,
      required this.timezone,
      required this.street});
}

class LocationCoordinates {
  final String latitude;
  final String longitude;
  LocationCoordinates({required this.latitude, required this.longitude});
}

class LocationTimezoneCoordinate {
  final String offset;
  final String description;
  LocationTimezoneCoordinate({required this.offset, required this.description});
}

class LocationStreet {
  final int number;
  final String name;
  LocationStreet({required this.number, required this.name});
}
