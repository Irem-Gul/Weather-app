// import 'package:flutter/material.dart';
// import 'package:weather_app/screens/Forcast/forcast.dart';


// class Screen1 extends StatelessWidget {
//   const Screen1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: WeatherPage(locationName: 'Enschede'),
//     );
//   }
// }

// class WeatherPage extends StatelessWidget {
//   final String locationName;

//   const WeatherPage({super.key, required this.locationName});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Color(0xFF85C0E2),Color(0xFF6DBEEE),Color(0xFFFFFEC7),Color(0xFF6DBEEE),Color(0xFF85C0E2)],
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               // Location 
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                 child: Row(
//                   children: [
//                     const Spacer(),
//                     Text(
//                       locationName,
//                       style: const TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.blueGrey,
//                       ),
//                     ),
//                     const Spacer(),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // Weather Icon and Temperature
//               const Icon(Icons.cloud_queue, size: 140, color: Colors.blueGrey),
//               const SizedBox(height: 10),
//               const Text(
//                 'MONDAY   |   NOV 18',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.blueGrey),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 '24°',
//                 style: TextStyle(
//                   fontSize: 80,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blueGrey,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // Weather details
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         WeatherDetail(icon: Icons.language, label: '6.88 Longitude'), //import data from cloud
//                         WeatherDetail(icon: Icons.public, label: '52.22 Latitude'),
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         WeatherDetail(icon: Icons.compress, label: '1010 mbar Pressure'),
//                         WeatherDetail(icon: Icons.water, label: '83% Humidity'),
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         WeatherDetail(icon: Icons.height, label: '66 Altitude'),
//                         WeatherDetail(icon: Icons.wb_sunny, label: '1 Light'),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // Horizontal Scroll for Hourly Weather
//               SizedBox(
//                 height: 100,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   children: List.generate(6, (index) {
//                     return _hourlyWeatherCard(index);
//                   }),
//                 ),
//               ),
//               const Spacer(),

              
//               // 7-day forecast button
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.transparent,
//                     foregroundColor: Colors.grey,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: const Text('Forecast for 7 days'),
//                   onPressed: () {
//                      Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                       builder: (context) => const Forcast(),
//                       ),
//                       );
//                   },
                 
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _hourlyWeatherCard(int hour) {
//     return Container(
//       width: 70,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('${19 + hour}:00', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
//           const Icon(Icons.cloud_queue_outlined, color: Colors.blueGrey),
//           const Text('20°/24°', style: TextStyle(fontSize: 12)),
//           const Text('74% rain', style: TextStyle(fontSize: 12)),
//         ],
//       ),
//     );
//   }
// }

// class WeatherDetail extends StatelessWidget {
//   final IconData icon;
//   final String label;

//   const WeatherDetail({super.key, required this.icon, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(icon, size: 20, color: Colors.blueGrey),
//         const SizedBox(width: 5),
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 12,
//             color: Colors.blueGrey,
//           ),
//         ),
//       ],
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:weather_app/components/API/screen1_class.dart';
// import 'package:weather_app/components/API/screen1_api.dart';


// class WeatherPage extends StatefulWidget {
//   final String device_id;

//   const WeatherPage({super.key, required this.device_id});

//   @override
//   _WeatherPageState createState() => _WeatherPageState();
// }

// class _WeatherPageState extends State<WeatherPage> {
//   late Future<Weather> weatherData;

//   @override
//   void initState() {
//     super.initState();
//     weatherData = WeatherService.fetchWeatherData(widget.device_id);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<Weather>(
//         future: weatherData,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             final weather = snapshot.data!;
//             return _buildWeatherUI(weather);
//           } else {
//             return const Center(child: Text('No data available'));
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildWeatherUI(Weather weather) {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Color(0xFF85C0E2),
//             Color(0xFF6DBEEE),
//             Color(0xFFFFFEC7),
//             Color(0xFF6DBEEE),
//             Color(0xFF85C0E2),
//           ],
//         ),
//       ),
//       child: SafeArea(
//         child: Column(
//           children: [
//             // Location
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//               child: Row(
//                 children: [
//                   const Spacer(),
//                   Text(
//                     weather.device_id,
//                     style: const TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.blueGrey,
//                     ),
//                   ),
//                   const Spacer(),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             // Weather Icon and Temperature
//             const Icon(Icons.cloud_queue, size: 140, color: Colors.blueGrey),
//             const SizedBox(height: 10),
//             const Text(
//               'TODAY',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.blueGrey),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               '${weather.hourly.first.temperature.toStringAsFixed(1)}°',
//               style: const TextStyle(
//                 fontSize: 80,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blueGrey,
//               ),
//             ),
//             const SizedBox(height: 20),
//             // Weather details
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       WeatherDetail(icon: Icons.language, label: '${weather.longitude} Longitude'),
//                       WeatherDetail(icon: Icons.public, label: '${weather.latitude} Latitude'),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       WeatherDetail(icon: Icons.compress, label: '${weather.pressure} mbar Pressure'),
//                       WeatherDetail(icon: Icons.water, label: '${weather.humidity}% Humidity'),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             // Horizontal Scroll for Hourly Weather
//             SizedBox(
//               height: 100,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 itemCount: weather.hourly.length,
//                 itemBuilder: (context, index) {
//                   final hourly = weather.hourly[index];
//                   return _hourlyWeatherCard(hourly);
//                 },
//               ),
//             ),
//             const Spacer(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _hourlyWeatherCard(HourlyWeather hourly) {
//     return Container(
//       width: 70,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(hourly.time, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
//           const Icon(Icons.cloud_queue_outlined, color: Colors.blueGrey),
//           Text('${hourly.temperature.toStringAsFixed(1)}°', style: const TextStyle(fontSize: 12)),
//           Text('${hourly.rainChance}% rain', style: const TextStyle(fontSize: 12)),
//         ],
//       ),
//     );
//   }
// }

// class WeatherDetail extends StatelessWidget {
//   final IconData icon;
//   final String label;

//   const WeatherDetail({super.key, required this.icon, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(icon, size: 20, color: Colors.blueGrey),
//         const SizedBox(width: 5),
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 12,
//             color: Colors.blueGrey,
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// DeviceReading Class (Model for API response)
class DeviceReading {
  final String deviceId;
  final double? extTemperature;
  final double humidity;
  final int light;
  final double pressure;
  final int readingId;
  final double temperature;
  final DateTime timestamp;

  DeviceReading({
    required this.deviceId,
    this.extTemperature,
    required this.humidity,
    required this.light,
    required this.pressure,
    required this.readingId,
    required this.temperature,
    required this.timestamp,
  });

  factory DeviceReading.fromJson(Map<String, dynamic> json) {
    return DeviceReading(
      deviceId: json['device_id'] ?? '',
      extTemperature: json['ext_temperature'] != null
          ? (json['ext_temperature'] is num
              ? (json['ext_temperature'] as num).toDouble()
              : double.tryParse(json['ext_temperature'].toString()))
          : null,
      humidity: json['humidity'] != null
          ? (json['humidity'] is num
              ? (json['humidity'] as num).toDouble()
              : double.parse(json['humidity']))
          : 0.0,
      light: json['light'] ?? 0,
      pressure: json['pressure'] != null
          ? (json['pressure'] is num
              ? (json['pressure'] as num).toDouble()
              : double.parse(json['pressure']))
          : 0.0,
      readingId: json['reading_id'] ?? 0,
      temperature: json['temperature'] != null
          ? (json['temperature'] is num
              ? (json['temperature'] as num).toDouble()
              : double.parse(json['temperature']))
          : 0.0,
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'])
          : DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}

// WeatherService (Fetches data from the API)
class WeatherService {
  Future<List<DeviceReading>> fetchWeather(String deviceId) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8080/readings'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((reading) => DeviceReading.fromJson(reading)).toList();
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

// Main App (UI)
void main() => runApp(const Screen1());

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(locationName: 'Enschede'),
    );
  }
}

class WeatherPage extends StatefulWidget {
  final String locationName;

  const WeatherPage({super.key, required this.locationName});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late Future<List<DeviceReading>> weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = WeatherService().fetchWeather('mkr-saxion');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF85C0E2), Color(0xFF6DBEEE), Color(0xFFFFFEC7), Color(0xFF6DBEEE), Color(0xFF85C0E2)],
          ),
        ),
        child: SafeArea(
          child: FutureBuilder<List<DeviceReading>>(
            future: weatherData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final weather = snapshot.data!.first;  // If the API returns a list, get the first element
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        children: [
                          const Spacer(),
                          Text(
                            widget.locationName,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueGrey,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Icon(Icons.cloud_queue, size: 140, color: Colors.blueGrey),
                    const SizedBox(height: 10),
                    const Text(
                      'MONDAY   |   NOV 18',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.blueGrey),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '${weather.temperature}°',
                      style: const TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              WeatherDetail(icon: Icons.language, label: '${weather.pressure} mbar Pressure'),
                              WeatherDetail(icon: Icons.water, label: '${weather.humidity}% Humidity'),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              WeatherDetail(icon: Icons.compress, label: '${weather.light} Light'),
                              WeatherDetail(icon: Icons.language, label: '${weather.extTemperature ?? 'N/A'} External Temp'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Centered hourly weather cards
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: List.generate(6, (index) {
                          return Center( // Center the hourly weather card
                            child: _hourlyWeatherCard(index),
                          );
                        }),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Forecast for 7 days'),
                        onPressed: () {},
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(child: Text('No data available'));
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _hourlyWeatherCard(int hour) {
    return Container(
      width: 70,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${19 + hour}:00', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
          const Icon(Icons.cloud_queue_outlined, color: Colors.blueGrey),
          const Text('20°/24°', style: TextStyle(fontSize: 12)),
          const Text('74% rain', style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class WeatherDetail extends StatelessWidget {
  final IconData icon;
  final String label;

  const WeatherDetail({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.blueGrey),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }
}

