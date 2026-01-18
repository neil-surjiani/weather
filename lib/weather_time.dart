import 'package:flutter/material.dart';

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