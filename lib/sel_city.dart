import 'package:flutter/material.dart';
import 'weather_screen.dart';

class SelCity extends StatefulWidget {
  const SelCity({super.key});

  @override
  State<SelCity> createState() => _SelCityState();
}

class _SelCityState extends State<SelCity> {
  List<String> cities = [
    "Amsterdam",
    "Athens",
    "Atlanta",
    "Auckland",
    "Austin",
    "Bangkok",
    "Barcelona",
    "Beijing",
    "Berlin",
    "Boston",
    "Brussels",
    "Budapest",
    "Buenos Aires",
    "Cairo",
    "Cape Town",
    "Chicago",
    "Copenhagen",
    "Delhi",
    "Dubai",
    "Dublin",
    "Frankfurt",
    "Geneva",
    "Hong Kong",
    "Houston",
    "Istanbul",
    "Jakarta",
    "Jerusalem",
    "Johannesburg",
    "Karachi",
    "Kuala Lumpur",
    "Kyoto",
    "Las Vegas",
    "Lisbon",
    "London",
    "Los Angeles",
    "Madrid",
    "Melbourne",
    "Mexico City",
    "Miami",
    "Milan",
    "Montreal",
    "Moscow",
    "Mumbai",
    "Munich",
    "New York",
    "Osaka",
    "Paris",
    "Prague",
    "Rio de Janeiro",
    "Rome",
    "San Francisco",
    "Santiago",
    "São Paulo",
    "Seoul",
    "Shanghai",
    "Singapore",
    "Stockholm",
    "Sydney",
    "Taipei",
    "Tokyo",
    "Toronto",
    "Vancouver",
    "Vienna",
    "Warsaw",
    "Washington",
    "Zurich",
  ];

  String startCity = 'Mumbai';

  Widget locationDropdown({
    required String value,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value, // Currently selected currency
      // Dropdown list items
      items: cities.map((currency) {
        return DropdownMenuItem(
          value: currency,
          child: Text(
            currency,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }).toList(),

      // Triggered when user selects a new currency
      onChanged: onChanged,

      // Dropdown field decoration
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromRGBO(29, 29, 29, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(29, 29, 29, 1),
        title: Text(
          'Location Selection',
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
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 27),
              child: Text(
                'Please select city',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  color: Colors.white,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: locationDropdown(
                      value: startCity,
                      onChanged: (value) {
                        setState(() {
                          startCity = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 27),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white70,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 14,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, startCity);
                },
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
