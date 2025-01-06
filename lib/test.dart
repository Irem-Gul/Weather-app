// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class DeviceReading {
//   final String deviceId;
//   final double? extTemperature;
//   final double humidity;
//   final int light;
//   final double pressure;
//   final int readingId;
//   final double temperature;
//   final DateTime timestamp;

//   DeviceReading({
//     required this.deviceId,
//     this.extTemperature,
//     required this.humidity,
//     required this.light,
//     required this.pressure,
//     required this.readingId,
//     required this.temperature,
//     required this.timestamp,
//   });

//   factory DeviceReading.fromJson(Map<String, dynamic> json) {
//     return DeviceReading(
//       deviceId: json['device_id'] ?? '',
//       extTemperature: json['ext_temperature'] != null
//           ? (json['ext_temperature'] is num
//               ? (json['ext_temperature'] as num).toDouble()
//               : double.tryParse(json['ext_temperature'].toString()))
//           : null,
//       humidity: json['humidity'] != null
//           ? (json['humidity'] is num
//               ? (json['humidity'] as num).toDouble()
//               : double.parse(json['humidity']))
//           : 0.0,
//       light: json['light'] ?? 0,
//       pressure: json['pressure'] != null
//           ? (json['pressure'] is num
//               ? (json['pressure'] as num).toDouble()
//               : double.parse(json['pressure']))
//           : 0.0,
//       readingId: json['reading_id'] ?? 0,
//       temperature: json['temperature'] != null
//           ? (json['temperature'] is num
//               ? (json['temperature'] as num).toDouble()
//               : double.parse(json['temperature']))
//           : 0.0,
//       timestamp: json['timestamp'] != null
//           ? DateTime.parse(json['timestamp'])
//           : DateTime.fromMillisecondsSinceEpoch(0),
//     );
//   }
// }

// class DeviceReadingService {
//   Future<List<DeviceReading>> fetchDeviceReadings() async {
//     final response = await http.get(Uri.parse('http://20.166.119.151:8080/readings'));

//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       return data.map((reading) => DeviceReading.fromJson(reading)).toList();
//     } else {
//       throw Exception('Failed to load device readings');
//     }
//   }
// }

// void main() => runApp(DeviceReadingApp());

// class DeviceReadingApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Device Readings Viewer',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: DeviceReadingPage(),
//     );
//   }
// }

// class DeviceReadingPage extends StatelessWidget {
//   final DeviceReadingService service = DeviceReadingService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Device Readings'),
//       ),
//       body: FutureBuilder<List<DeviceReading>>(
//         future: service.fetchDeviceReadings(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No device readings found'));
//           } else {
//             final readings = snapshot.data!;
//             return ListView.builder(
//               itemCount: readings.length,
//               itemBuilder: (context, index) {
//                 final reading = readings[index];
//                 return ListTile(
//                   title: Text('Device: ${reading.deviceId}'),
//                   subtitle: Text(
//                       'Temp: ${reading.temperature} °C, Humidity: ${reading.humidity}%, Light: ${reading.light}, Pressure: ${reading.pressure} hPa\nTimestamp: ${reading.timestamp}'),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }


// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// // DeviceReading Class
// class DeviceReading {
//   final String deviceId;
//   final double? extTemperature;
//   final double humidity;
//   final int light;
//   final double pressure;
//   final int readingId;
//   final double temperature;
//   final DateTime timestamp;

//   DeviceReading({
//     required this.deviceId,
//     this.extTemperature,
//     required this.humidity,
//     required this.light,
//     required this.pressure,
//     required this.readingId,
//     required this.temperature,
//     required this.timestamp,
//   });

//   factory DeviceReading.fromJson(Map<String, dynamic> json) {
//     return DeviceReading(
//       deviceId: json['device_id'] ?? '',
//       extTemperature: json['ext_temperature'] != null
//           ? (json['ext_temperature'] is num
//               ? (json['ext_temperature'] as num).toDouble()
//               : double.tryParse(json['ext_temperature'].toString()))
//           : null,
//       humidity: json['humidity'] != null
//           ? (json['humidity'] is num
//               ? (json['humidity'] as num).toDouble()
//               : double.parse(json['humidity']))
//           : 0.0,
//       light: json['light'] ?? 0,
//       pressure: json['pressure'] != null
//           ? (json['pressure'] is num
//               ? (json['pressure'] as num).toDouble()
//               : double.parse(json['pressure']))
//           : 0.0,
//       readingId: json['reading_id'] ?? 0,
//       temperature: json['temperature'] != null
//           ? (json['temperature'] is num
//               ? (json['temperature'] as num).toDouble()
//               : double.parse(json['temperature']))
//           : 0.0,
//       timestamp: json['timestamp'] != null
//           ? DateTime.parse(json['timestamp'])
//           : DateTime.fromMillisecondsSinceEpoch(0),
//     );
//   }
// }

// Weather Class
// class Weather {
//   final String deviceId;
//   final double pressure;
//   final double humidity;
//   final int light;
//   final double temperature;
//   final DateTime timestamp;

//   Weather({
//     required this.deviceId,
//     required this.pressure,
//     required this.humidity,
//     required this.light,
//     required this.temperature,
//     required this.timestamp,
//   });

//   factory Weather.fromJson(Map<String, dynamic> json) {
//     return Weather(
//       deviceId: json['device_id'] ?? '',
//       pressure: json['pressure'] != null
//           ? (json['pressure'] is num
//               ? (json['pressure'] as num).toDouble()
//               : double.parse(json['pressure']))
//           : 0.0,
//       humidity: json['humidity'] != null
//           ? (json['humidity'] is num
//               ? (json['humidity'] as num).toDouble()
//               : double.parse(json['humidity']))
//           : 0.0,
//       light: json['light'] ?? 0,
//       temperature: json['temperature'] != null
//           ? (json['temperature'] is num
//               ? (json['temperature'] as num).toDouble()
//               : double.parse(json['temperature']))
//           : 0.0,
//       timestamp: json['timestamp'] != null
//           ? DateTime.parse(json['timestamp'])
//           : DateTime.fromMillisecondsSinceEpoch(0),
//     );
//   }
// }

// class DeviceReadingService {
//   Future<List<DeviceReading>> fetchDeviceReadings() async {
//     final response = await http.get(Uri.parse('http://20.166.119.151:8080/readings'));

//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       return data.map((reading) => DeviceReading.fromJson(reading)).toList();
//     } else {
//       throw Exception('Failed to load device readings');
//     }
//   }
// }

// class WeatherPage extends StatefulWidget {
//   final String deviceId;

//   const WeatherPage({super.key, required this.deviceId});

//   @override
//   _WeatherPageState createState() => _WeatherPageState();
// }

// class WeatherService {
//   Future<List<Weather>> fetchWeather(String deviceId) async {
//     final response = await http.get(Uri.parse('http://20.166.119.151:8080/readings'));

//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       return data.map((weather) => Weather.fromJson(weather)).toList();
//     } else {
//       throw Exception('Failed to load weather data');
//     }
//   }
// }


// class _WeatherPageState extends State<WeatherPage> {
//   late Future<List<Weather>> weatherData;

//   @override
//   void initState() {
//     super.initState();
//     weatherData = WeatherService().fetchWeather(widget.deviceId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Weather Details'),
//       ),
//       body: FutureBuilder<List<Weather>>(
//         future: weatherData,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             final weatherList = snapshot.data!;
//             return ListView.builder(
//               itemCount: weatherList.length,
//               itemBuilder: (context, index) {
//                 final weather = weatherList[index];
//                 return Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Device: ${weather.deviceId}',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 8),
//                       Text('Temperature: ${weather.temperature} °C'),
//                       Text('Humidity: ${weather.humidity} %'),
//                       Text('Light: ${weather.light}'),
//                       Text('Pressure: ${weather.pressure} hPa'),
//                       Text('Timestamp: ${weather.timestamp}'),
//                     ],
//                   ),
//                 );
//               },
//             );
//           } else {
//             return Center(child: Text('No data available'));
//           }
//         },
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';

class SensorData {
  final String deviceId;
  final double temperature;
  final String timestamp;

  SensorData({required this.deviceId, required this.temperature, required this.timestamp});

  factory SensorData.fromJson(Map<String, dynamic> json) {
    return SensorData(
      deviceId: json['device_id'],
      temperature: json['temperature'] != null ? double.parse(json['temperature'].toString()) : 0.0,
      timestamp: json['timestamp'],
    );
  }
}

class HourlyGraphic extends StatefulWidget {
  @override
  _HourlyGraphicState createState() => _HourlyGraphicState();
}

class _HourlyGraphicState extends State<HourlyGraphic> {
  List<FlSpot> _dataPoints = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  // Fetch data from the API
  Future<void> _fetchData() async {
    final url = Uri.parse('http://127.0.0.1:8080/readings'); // Replace with actual API URL
    final response = await http.get(url).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      List<SensorData> data = _parseJson(response.body);
      List<SensorData> filteredData = data.where((sensorData) => sensorData.deviceId == "mkr-saxion").toList();
      _updateGraph(filteredData);
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Parse the API JSON response into a list of SensorData
  List<SensorData> _parseJson(String responseBody) {
    final List<dynamic> parsed = json.decode(responseBody);
    return parsed.map((data) => SensorData.fromJson(data)).toList();
  }

  // Update the graph data with the fetched data
  void _updateGraph(List<SensorData> data) {
    Map<int, List<double>> hourlyData = {};

    for (var sensorData in data) {
      final timestamp = DateTime.parse(sensorData.timestamp);
      final hour = timestamp.hour;

      if (!hourlyData.containsKey(hour)) {
        hourlyData[hour] = [];
      }
      hourlyData[hour]!.add(sensorData.temperature);
    }

    List<FlSpot> spots = [];
    hourlyData.forEach((hour, temperatures) {
      final avgTemp = temperatures.reduce((a, b) => a + b) / temperatures.length;
      spots.add(FlSpot(hour.toDouble(), avgTemp));
    });

    setState(() {
      _dataPoints = spots;
    });
  }

  // Format the time to show only the hour
  String _formatTime(double timestamp) {
    final date = DateTime(0, 1, 1, timestamp.toInt(), 0);
    return '${date.hour}:00';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hourly Graphic Enschede'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _dataPoints.isEmpty
              ? const CircularProgressIndicator()
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: 1200,
                    child: LineChart(
                      LineChartData(
                        gridData: const FlGridData(show: true),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 32,
                              getTitlesWidget: (value, meta) {
                                return Text('${value.toInt()}°C'); // Corrected here
                              },
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 32,
                              getTitlesWidget: (value, meta) {
                                return Text(_formatTime(value));
                              },
                            ),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        clipData: FlClipData.all(), // Prevent line overflow
                        minX: 0,
                        maxX: 23,
                        minY: 0,
                        maxY: 40,
                        lineBarsData: [
                          LineChartBarData(
                            spots: _dataPoints,
                            isCurved: true,
                            color: Colors.blue,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}


// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:fl_chart/fl_chart.dart';

// class SensorData {
//   final String deviceId;
//   final double humidity;
//   final String timestamp;

//   SensorData({required this.deviceId, required this.humidity, required this.timestamp});

//   factory SensorData.fromJson(Map<String, dynamic> json) {
//     return SensorData(
//       deviceId: json['device_id'],
//       humidity: json['humidity'] != null ? double.parse(json['humidity']) : 0.0,
//       timestamp: json['timestamp'],
//     );
//   }
// }

// class HourlyHumidityGraphic extends StatefulWidget {
//   @override
//   _HourlyHumidityGraphicState createState() => _HourlyHumidityGraphicState();
// }

// class _HourlyHumidityGraphicState extends State<HourlyHumidityGraphic> {
//   List<FlSpot> _dataPoints = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }

//   // Fetch data from the API
//   Future<void> _fetchData() async {
//     final url = Uri.parse('http://127.0.0.1:8080/readings'); // Replace with actual API URL
//     final response = await http.get(url).timeout(Duration(seconds: 10));

//     if (response.statusCode == 200) {
//       List<SensorData> data = _parseJson(response.body);

//       // Get the current time and filter the data to only include the last 24 hours
//       final now = DateTime.now();
//       List<SensorData> filteredData = data.where((sensorData) {
//         final timestamp = DateTime.parse(sensorData.timestamp);
//         return now.difference(timestamp).inHours <= 24;
//       }).toList();

//       _updateGraph(filteredData);
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   // Parse the API JSON response into a list of SensorData
//   List<SensorData> _parseJson(String responseBody) {
//     final List<dynamic> parsed = json.decode(responseBody);
//     return parsed.map((data) => SensorData.fromJson(data)).toList();
//   }

//   // Update the graph data with the fetched data
//   void _updateGraph(List<SensorData> data) {
//     // Group data by hour
//     Map<int, List<double>> hourlyData = {};

//     for (var sensorData in data) {
//       final timestamp = DateTime.parse(sensorData.timestamp);
//       final hour = timestamp.hour;

//       // If the hour key doesn't exist in the map, create a new list for it
//       if (!hourlyData.containsKey(hour)) {
//         hourlyData[hour] = [];
//       }

//       // Add the humidity reading to the list for that hour
//       hourlyData[hour]!.add(sensorData.humidity);
//     }

//     // Now, calculate the average humidity per hour and update the graph
//     List<FlSpot> spots = [];
//     hourlyData.forEach((hour, humidities) {
//       final avgHumidity = humidities.reduce((a, b) => a + b) / humidities.length;
//       spots.add(FlSpot(hour.toDouble(), avgHumidity));
//     });

//     setState(() {
//       _dataPoints = spots;
//     });

//     // Debug log to verify the data points
//     print("Data Points: $_dataPoints");
//   }

//   // Format the time to show only the hour
//   String _formatTime(double timestamp) {
//     final date = DateTime(0, 1, 1, timestamp.toInt(), 0); // Set the year, month, day to 0
//     return '${date.hour}:00'; // Display only the hour
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Hourly Humidity Graphic Enschede'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: _dataPoints.isEmpty
//               ? CircularProgressIndicator()
//               : SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: SizedBox(
//                     width: 1200,
//                     child: LineChart(
//                       LineChartData(
//                         gridData: const FlGridData(show: true),
//                         titlesData: FlTitlesData(
//                           leftTitles: AxisTitles(
//                             sideTitles: SideTitles(
//                               showTitles: true,
//                               reservedSize: 32,
//                               getTitlesWidget: (value, meta) {
//                                 return Text('${value.toInt()}%'); // Display integer humidity values
//                               },
//                             ),
//                           ),
//                           bottomTitles: AxisTitles(
//                             sideTitles: SideTitles(
//                               showTitles: true,
//                               reservedSize: 32,
//                               getTitlesWidget: (value, meta) {
//                                 return Text(_formatTime(value)); // Time labels (only hour)
//                               },
//                             ),
//                           ),
//                           topTitles: AxisTitles(
//                             sideTitles: SideTitles(showTitles: false),
//                           ),
//                           rightTitles: AxisTitles(
//                             sideTitles: SideTitles(showTitles: false),
//                           ),
//                         ),
//                         borderData: FlBorderData(
//                           show: true,
//                           border: Border.all(color: Colors.grey, width: 1),
//                         ),
//                         // Dynamically adjust Y-axis based on the data
//                         minX: 0,
//                         maxX: 23,
//                         minY: _dataPoints.isEmpty
//                             ? 0
//                             : _dataPoints.map((spot) => spot.y).reduce((a, b) => a < b ? a : b) - 5,
//                         maxY: _dataPoints.isEmpty
//                             ? 100
//                             : _dataPoints.map((spot) => spot.y).reduce((a, b) => a > b ? a : b) + 5,
//                         lineBarsData: [
//                           LineChartBarData(
//                             spots: _dataPoints,
//                             isCurved: false, // Straight line for clarity
//                             color: Colors.green,
//                             dotData: FlDotData(show: false),
//                             belowBarData: BarAreaData(show: false),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
// }






















