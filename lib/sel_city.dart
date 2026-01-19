import 'package:flutter/material.dart';
import 'weather_screen.dart';

class SelCity extends StatefulWidget {
  const SelCity({super.key});

  @override
  State<SelCity> createState() => _SelCityState();
}

class _SelCityState extends State<SelCity> {
  List<String> cities = [
  "Amsterdam, NL",
  "Athens, GR",
  "Atlanta, US",
  "Auckland, NZ",
  "Austin, US",
  "Bangkok, TH",
  "Barcelona, ES",
  "Beijing, CN",
  "Berlin, DE",
  "Boston, US",
  "Brussels, BE",
  "Budapest, HU",
  "Buenos Aires, AR",
  "Cairo, EG",
  "Cape Town, ZA",
  "Chicago, US",
  "Copenhagen, DK",
  "Delhi, IN",
  "Dubai, AE",
  "Dublin, IE",
  "Frankfurt, DE",
  "Geneva, CH",
  "Hong Kong, HK",
  "Houston, US",
  "Istanbul, TR",
  "Jakarta, ID",
  "Jerusalem, IL",
  "Johannesburg, ZA",
  "Karachi, PK",
  "Kuala Lumpur, MY",
  "Kyoto, JP",
  "Las Vegas, US",
  "Lisbon, PT",
  "London, UK",
  "Los Angeles, US",
  "Madrid, ES",
  "Melbourne, AU",
  "Mexico City, MX",
  "Miami, US",
  "Milan, IT",
  "Montreal, CA",
  "Moscow, RU",
  "Mumbai, IN",
  "Munich, DE",
  "New York, US",
  "Osaka, JP",
  "Paris, FR",
  "Prague, CZ",
  "Rio de Janeiro, BR",
  "Rome, IT",
  "San Francisco, US",
  "Santiago, CL",
  "São Paulo, BR",
  "Seoul, KR",
  "Shanghai, CN",
  "Singapore, SG",
  "Stockholm, SE",
  "Sydney, AU",
  "Taipei, TW",
  "Tokyo, JP",
  "Toronto, CA",
  "Vancouver, CA",
  "Vienna, AT",
  "Warsaw, PL",
  "Washington DC, US",
  "Zurich, CH",
];

  String startCity = "Mumbai, IN";

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
