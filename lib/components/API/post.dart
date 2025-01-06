
// maybe we can add location to the table in the database
class Album {
  final String device_id;
  final double ext_temperature;
  final double humidity;
  final int light;
  final double pressure;
  final int reading_id;
  final double temperature;
  final String timestamp;

  const Album({
    required this.device_id,
    required this.ext_temperature,
    required this.humidity,
    required this.light,
    required this.pressure,
    required this.reading_id,
    required this.temperature,
    required this.timestamp,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'device_id': String device_id,
        'ext_temperature': double ext_temperature,
        'humidity': double humidity,
        'light': int light,
        'pressure': double pressure,
        'reading_id':int reading_id,
        'temperature': double temperature,
        'timestamp': String timestamp,
      } =>
        Album(
          device_id: device_id,
          ext_temperature: ext_temperature,
          humidity:humidity,
          light: light,
          pressure: pressure,
          reading_id: reading_id,
          temperature: temperature,
          timestamp: timestamp,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}