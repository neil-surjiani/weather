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
                fontSize: 24,
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
