import 'package:flutter/material.dart';
import 'package:weather/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

void navigateWithSlide(BuildContext context, Widget page) {
  Navigator.push(
    context,
    PageRouteBuilder(
    pageBuilder: (_, animation, __) => page,
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home:WeatherScreen()
    );
  }
}
