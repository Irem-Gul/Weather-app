




class Weather {
  final String device_id;
  final double longitude;
  final double latitude;
  final double pressure;
  final double humidity;
  final double altitude;
  final double light;
  final List<HourlyWeather> hourly;

  Weather({
    required this.device_id,
    required this.longitude,
    required this.latitude,
    required this.pressure,
    required this.humidity,
    required this.altitude,
    required this.light,
    required this.hourly,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      device_id: json['location'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      pressure: json['pressure'],
      humidity: json['humidity'],
      altitude: json['altitude'],
      light: json['light'],
      hourly: (json['hourly'] as List<dynamic>)
          .map((hour) => HourlyWeather.fromJson(hour))
          .toList(),
    );
  }
}

class HourlyWeather {
  final String time;
  final double temperature;
  final double rainChance;

  HourlyWeather({
    required this.time,
    required this.temperature,
    required this.rainChance,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    return HourlyWeather(
      time: json['time'],
      temperature: json['temperature'],
      rainChance: json['rain_chance'],
    );
  }
}
