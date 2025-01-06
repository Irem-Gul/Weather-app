

import 'package:flutter/material.dart';
import 'package:weather_app/screens/Forcast/forcast.dart';
import 'package:weather_app/screens/homescreen_enschede/HourlyGraphic.dart';
import 'package:weather_app/screens/homescreen_enschede/WeatherPage.dart';
import 'package:weather_app/test.dart';
import 'screens/homescreen_enschede/graphsScreen.dart';




void main() {

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HourlyGraphic(),
      
    );
  }
}
