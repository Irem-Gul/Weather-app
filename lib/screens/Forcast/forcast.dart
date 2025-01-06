import 'package:flutter/material.dart';


class Forcast extends StatelessWidget {
  const Forcast({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SevenDayForecastPage(),
    );
  }
}

class SevenDayForecastPage extends StatelessWidget {
  const SevenDayForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF85C0E2),Color(0xFFFFFEC7)],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button and title
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        //naviagate back to previous page...
                      },
                    ),
                    const Spacer(),
                    const Text(
                      'Forecast for 7 Days',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Days List
              Expanded(
                child: ListView(
                  children: const [
                    DayForecastCard(
                      day: 'Monday',
                      rainPercentage: '74%',
                      temperature: '20°/24°',
                      icon: Icons.cloud_queue,
                      isSelected: false,
                    ),
                    DayForecastCard(
                      day: 'Tuesday',
                      rainPercentage: '13%',
                      temperature: '23°/27°',
                      icon: Icons.wb_sunny,
                      isSelected: false,
                    ),
                    DayForecastCard(
                      day: 'Wednesday',
                      rainPercentage: '32%',
                      temperature: '22°/25°',
                      icon: Icons.cloud,
                      isSelected: false,
                    ),
                    DayForecastCard(
                      day: 'Thursday',
                      rainPercentage: '55%',
                      temperature: '20°/24°',
                      icon: Icons.cloud_queue,
                      isSelected: false,
                    ),
                    DayForecastCard(
                      day: 'Friday',
                      rainPercentage: '53%',
                      temperature: '20°/24°',
                      icon: Icons.cloud,
                      isSelected: false,
                    ),
                    DayForecastCard(
                      day: 'Saturday',
                      rainPercentage: '32%',
                      temperature: '20°/24°',
                      icon: Icons.cloud,
                      isSelected: false,
                    ),
                    DayForecastCard(
                      day: 'Sunday',
                      rainPercentage: '18%',
                      temperature: '23°/27°',
                      icon: Icons.wb_sunny,
                      isSelected: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DayForecastCard extends StatelessWidget {
  final String day;
  final String rainPercentage;
  final String temperature;
  final IconData icon;
  final bool isSelected;

  const DayForecastCard({
    super.key,
    required this.day,
    required this.rainPercentage,
    required this.temperature,
    required this.icon,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blueGrey : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: isSelected
            ? Border.all(color: Colors.transparent, width: 2)
            : Border.all(color: Colors.blueGrey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blue.shade700),
              const SizedBox(width: 10),
              Text(
                day,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$rainPercentage rain',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              Text(
                temperature,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
