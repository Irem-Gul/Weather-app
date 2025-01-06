class AltitudeData {
  final double altitude;
  final double latitude;
  final String locationId;
  final double longitude;

  AltitudeData({
    required this.altitude,
    required this.latitude,
    required this.locationId,
    required this.longitude,
  });

  // Factory constructor to create an AltitudeData instance from a JSON map
  factory AltitudeData.fromJson(Map<String, dynamic> json) {
    return AltitudeData(
      altitude: json['altitude'],
      latitude: json['latitude'],
      locationId: json['location_id'],
      longitude: json['longitude'],
    );
  }
}