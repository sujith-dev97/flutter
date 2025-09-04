import 'dart:convert';
import 'package:api_calls/modal_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(WeatherAPP());
}

class WeatherAPP extends StatefulWidget {
  final String? temp;

  const WeatherAPP({super.key, this.temp});

  @override
  State<WeatherAPP> createState() => _WeatherAPPState();
}

class _WeatherAPPState extends State<WeatherAPP> {
  final TextEditingController _controller = TextEditingController();
  String _output = "Enter a city name";
  WeatherModel temp = WeatherModel();

  Future<void> fetchWeather(String city) async {
    final apiKey = "1ed3e1be4786ec8e17c282b9dee77492";
    final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric",
    );
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data is WeatherModel) {
          setState(() {
            _output =
                "city : ${data.city}\nTemperature: ${data.temperature}\nCondition: ${data.description}";
          });
        }
      } else {
        setState(() {
          _output = "city not found";
        });
      }
    } catch (e) {
      setState(() {
        _output = "Error: Unable to fetch weather data";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Weather")),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "Enter City Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    fetchWeather(_controller.text);
                  });
                },
                child: Text("Search"),
              ),
              SizedBox(height: 20),
              Text(
                _output,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
