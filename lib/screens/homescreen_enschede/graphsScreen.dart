import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/components/API/AltitudeData.dart';
import 'dart:convert';
import 'package:weather_app/components/API/graph_screen_post.dart';

class HumidityAndPressurePage extends StatelessWidget {
  // Function to fetch humidity and pressure readings data
  Future<List<Reading>> fetchReadingsData() async {
    try {
      final response = await http.get(Uri.parse('http://127.0.0.1:8080/readings'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final currentTime = DateTime.now();
        final filteredData = data.where((item) {
          final timestamp = DateTime.parse(item['timestamp']);
          return currentTime.difference(timestamp).inHours <= 24;
        }).toList();
        return filteredData.map((item) => Reading.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      rethrow;
    }
  }

  // Function to fetch altitude data (only for "saxion")
  Future<List<AltitudeData>> fetchAltitudeData() async {
    try {
      final response = await http.get(Uri.parse('http://127.0.0.1:8080/locations'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        // Filter data to include only the location with 'location_id' as 'saxion'
        final saxionData = data.where((item) => item['location_id'] == 'saxion').toList();

        // Map filtered data to AltitudeData model
        return saxionData.map((item) => AltitudeData.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load altitude data');
      }
    } catch (e) {
      print('Error fetching altitude data: $e');
      rethrow;
    }
  }

  // Function to parse data for humidity graph
  List<FlSpot> parseDataToHumiditySpots(List<Reading> data) {
    List<FlSpot> humiditySpots = [];
    for (var i = 0; i < data.length; i++) {
      var humidity = data[i].humidity; // Assuming 'humidity' is a field in the Reading model
      var timestamp = data[i].timestamp; // Assuming 'timestamp' is in DateTime format
      humiditySpots.add(FlSpot(timestamp.hour.toDouble(), humidity.toDouble()));
    }
    return humiditySpots;
  }

  // Function to parse data for pressure vs. altitude graph
  List<FlSpot> parseDataToPressureSpots(List<Reading> data) {
    List<FlSpot> pressureSpots = [];
    for (var i = 0; i < data.length; i++) {
      var pressure = data[i].pressure; // Assuming 'pressure' is a field in the Reading model
      var timestamp = data[i].timestamp; // Assuming 'timestamp' is in DateTime format
      pressureSpots.add(FlSpot(timestamp.hour.toDouble(), pressure.toDouble()));
    }
    return pressureSpots;
  }

  // Function to parse data for altitude graph
  List<FlSpot> parseDataToAltitudeSpots(List<AltitudeData> data) {
    List<FlSpot> altitudeSpots = [];

    // Filter data to get the "saxion" location
    final saxionData = data.firstWhere(
      (item) => item.locationId == 'saxion',
      orElse: () => AltitudeData(altitude: 0.0, locationId: '', latitude: 0.0, longitude: 0.0), // Default object
    );

    // Use a fixed x-axis value to simulate time (e.g., hourly data)
    // Add multiple points for altitude, but since the value doesn't change, use the same altitude for all hours
    for (int hour = 0; hour < 24; hour++) {
      altitudeSpots.add(FlSpot(hour.toDouble(), saxionData.altitude)); // Same altitude for all hours
    }

    return altitudeSpots;
  }

  // Combine data from readings and altitude
  Future<Map<String, dynamic>> fetchData() async {
    final readingsData = await fetchReadingsData();
    final altitudeData = await fetchAltitudeData();
    return {
      'readings': readingsData,
      'altitude': altitudeData,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Humidity and Pressure vs Altitude'),
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.arrow_back),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final readingsData = snapshot.data!['readings'];
            final altitudeData = snapshot.data!['altitude'];
            final humiditySpots = parseDataToHumiditySpots(readingsData);
            final pressureSpots = parseDataToPressureSpots(readingsData);
            final altitudeSpots = parseDataToAltitudeSpots(altitudeData);

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Humidity graph
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      children: [
                        Text('Humidity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Container(
                          height: 300, // Set a fixed height
                          child: LineChart(
                            LineChartData(
                              gridData: FlGridData(show: true),
                              titlesData: FlTitlesData(
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 40,
                                    interval: 10,
                                    getTitlesWidget: (value, meta) {
                                      return Text(
                                        value.toInt().toString(),
                                        style: const TextStyle(fontSize: 12),
                                      );
                                    },
                                  ),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 30,
                                    interval: 1,
                                    getTitlesWidget: (value, meta) {
                                      final hour = value.toInt();
                                      return Text(
                                        '$hour:00',
                                        style: const TextStyle(fontSize: 10),
                                      );
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
                                border: const Border(
                                  top: BorderSide.none,
                                  right: BorderSide.none,
                                  bottom: BorderSide(color: Colors.black, width: 1),
                                  left: BorderSide(color: Colors.black, width: 1),
                                ),
                              ),
                              minX: 12,
                              maxX: 24,
                              minY: 0,
                              maxY: 80, // Set Y-axis for Humidity from 0 to 80
                              lineBarsData: [
                                LineChartBarData(
                                  spots: humiditySpots,
                                  isCurved: true,
                                  dotData: FlDotData(show: true),
                                  belowBarData: BarAreaData(show: false), // No shading
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Space between graphs
                  SizedBox(height: 30),

                  // Pressure vs Altitude graph
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      children: [
                        Text('Pressure vs Altitude', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Container(
                          height: 300, // Set a fixed height
                          child: LineChart(
                            LineChartData(
                              gridData: FlGridData(show: true),
                              titlesData: FlTitlesData(
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 40,
                                    interval: 200,
                                    getTitlesWidget: (value, meta) {
                                      return Text(
                                        value.toInt().toString(),
                                        style: const TextStyle(fontSize: 12),
                                      );
                                    },
                                  ),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 30,
                                    interval: 1,
                                    getTitlesWidget: (value, meta) {
                                      final hour = value.toInt();
                                      return Text(
                                        '$hour:00',
                                        style: const TextStyle(fontSize: 10),
                                      );
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
                                border: const Border(
                                  top: BorderSide.none,
                                  right: BorderSide.none,
                                  bottom: BorderSide(color: Colors.black, width: 1),
                                  left: BorderSide(color: Colors.black, width: 1),
                                ),
                              ),
                              minX: 12,
                              maxX: 24,
                              minY: 900,
                              maxY: 1100, // Set a suitable range for Pressure
                              lineBarsData: [
                                LineChartBarData(
                                  spots: pressureSpots,
                                  isCurved: true,
                                  dotData: FlDotData(show: true),
                                  belowBarData: BarAreaData(show: false), // No shading
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}