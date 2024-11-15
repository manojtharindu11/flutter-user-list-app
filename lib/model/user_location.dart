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

factory UserLocation.fromMap(Map<String,dynamic> json) {

  final coordinates = LocationCoordinates(
        latitude: json['coordinates']['latitude'],
        longitude: json['coordinates']['longitude']);

    final timezone = LocationTimezoneCoordinate(
        offset: json['timezone']['offset'],
        description: json['timezone']['description']);

    final street = LocationStreet(
        number: json['street']['number'],
        name: json['street']['name']);

      return UserLocation(
        city: json['city'],
        state: json['state'],
        country: json['country'],
        postCode: json['postCode'].toString(),
        coordinates: coordinates,
        timezone: timezone,
        street: street);
}

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
