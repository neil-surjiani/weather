import 'package:flutter/material.dart';
import 'package:weather/main.dart';
import 'package:weather/sel_city.dart';
import 'weather_info.dart';
import 'weather_time.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/secret.dart';
import 'sel_city.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String city = 'Mumbai';
  double temp = 0;
  int humidity = 0;
  int pressure = 0;
  double wind = 0;
  String weather = "";

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future getCurrentWeather() async {
    try {
      final result = await http.get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey",
        ),
      );

      final data = jsonDecode(result.body);

      if (data["cod"] != "200") {
        throw 'An unexpected error has occured.';
      }

      setState(() {
        temp = data["list"][0]["main"]["temp"];
        humidity = data["list"][0]["main"]["humidity"];
        pressure = data["list"][0]["main"]["pressure"];
        wind = data["list"][0]["wind"]["speed"];
        weather = data["list"][0]["weather"][0]["main"];
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(29, 29, 29, 1),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(29, 29, 29, 1),
        title: Text(
          'Weather App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                // refresh logic (API call later)
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
              child: Text(
                city,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      color: const Color.fromRGBO(45, 45, 45, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 20,
                      child: Column(
                        children: [
                          SizedBox(height: 16),
                          Text(
                            '${(temp - 273.15).toStringAsFixed(1)} °C',
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 16),
                          Icon(Icons.cloud, size: 40, color: Colors.white),
                          SizedBox(height: 18),
                          Text(
                            weather,
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 10,
                      bottom: 10,
                    ),
                    child: Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Text(
                        "Weather Forecast",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(13, (index) {
                        final hour = (12 + index) % 24;
                        final time = hour.toString().padLeft(2, '0') + ':00';

                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                            width: 140,
                            child: WeatherTime(
                              icon: Icons.cloud,
                              time: time,
                              temp: '27°C',
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Text(
                        "Additional Information",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: WeatherInfoCard(
                          icon: Icons.water_drop,
                          label: 'Humidity',
                          value: '$humidity %',
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: WeatherInfoCard(
                          icon: Icons.air,
                          label: 'Wind',
                          value: '${(wind * 18 / 5).toStringAsFixed(1)} km/h',
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: WeatherInfoCard(
                          icon: Icons.speed,
                          label: 'Pressure',
                          value: '$pressure',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 24,
              ), // minimal side gap
              child: SizedBox(
                width: double.infinity, // full screen width
                height: 52, // good button height
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 38, 38, 38),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // slight curve
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () async {
                    final selectedCity = await Navigator.push<String>(
                      context,
                      MaterialPageRoute(builder: (_) => const SelCity()),
                    );

                    if (selectedCity != null) {
                      setState(() {
                        city = selectedCity;
                      });
                      getCurrentWeather(); // refresh weather
                    }
                  },
                  child: const Text(
                    'Change City',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
