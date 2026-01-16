import 'package:flutter/material.dart';

class WeatherInfoCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final String value;

  const WeatherInfoCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  State<WeatherInfoCard> createState() => _WeatherInfoCardState();
}

class _WeatherInfoCardState extends State<WeatherInfoCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Card(
        color: const Color.fromRGBO(29, 29, 29, 1),
        elevation: 0,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Icon(widget.icon, size: 30, color: Colors.white),
            const SizedBox(height: 16),
            Text(
              widget.label,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 18),
            Text(
              widget.value,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherTime extends StatefulWidget {
  final IconData icon;
  final String time;
  final String temp;

  const WeatherTime({
    super.key,
    required this.icon,
    required this.time,
    required this.temp,
  });

  @override
  State<WeatherTime> createState() => _WeatherTimeState();
}

class _WeatherTimeState extends State<WeatherTime> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Card(
        color: const Color.fromRGBO(45, 45, 45, 1),
        elevation: 20,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Text(
              widget.time,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Icon(widget.icon, size: 30, color: Colors.white),
            const SizedBox(height: 18),
            Text(
              widget.temp,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(29, 29, 29, 1),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(29, 29, 29, 1),
        title: const Text(
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
                        children: const [
                          SizedBox(height: 16),
                          Text(
                            '27°C',
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
                            'Rain',
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
                    children: const [
                      Expanded(
                        child: WeatherInfoCard(
                          icon: Icons.water_drop,
                          label: 'Humidity',
                          value: '94%',
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: WeatherInfoCard(
                          icon: Icons.air,
                          label: 'Wind',
                          value: '12 km/h',
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: WeatherInfoCard(
                          icon: Icons.speed,
                          label: 'Pressure',
                          value: '1008',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
