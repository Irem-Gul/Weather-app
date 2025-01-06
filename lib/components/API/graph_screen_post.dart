class Reading {
  final double extTemperature;
  final double humidity;
  final double light;
  final double pressure;
  final int readingId;
  final double temperature;
  final DateTime timestamp;
   
  Reading({
    required this.extTemperature,
    required this.humidity,
    required this.light,
    required this.pressure,
    required this.readingId,
    required this.temperature,
    required this.timestamp,
  });

  factory Reading.fromJson(Map<String, dynamic> json) {
    return Reading(
      extTemperature: _parseToDouble(json['ext_temperature']),
      humidity: _parseToDouble(json['humidity']),
      light: json['light']?.toDouble() ?? 0.0, // Convert light to double
      pressure: _parseToDouble(json['pressure']),
      readingId: json['reading_id'] ?? 0, // Default to 0 if null
      temperature: _parseToDouble(json['temperature']),
      timestamp: DateTime.parse(json['timestamp']), // Parse timestamp to DateTime
    );
  }

  static double _parseToDouble(dynamic value) {
    if (value == null) {
      return 0.0; // Return 0.0 if the value is null
    } else if (value is num) {
      return value.toDouble(); // Safe conversion if it's already a number
    } else if (value is String) {
      return double.tryParse(value) ?? 0.0; // Try parsing the string, default to 0.0 if it fails
    } else {
      return 0.0; // Default to 0.0 for any unexpected type
    }
  }
}