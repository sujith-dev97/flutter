import 'dart:ffi';

class WeatherModel {
 late String city;
 late double temperature;
 late String description;

  WeatherModel.fromJson(Map<String, dynamic> json) {
    city = json['name'] ?? "unknown city";
    temperature = json['weather'];
    description = json['description'];
  }

  void display() {
    print("city: $city, temperature: $temperature, description: $description");
  }
}
void main (){
  json(Map<String,Dynamic > data){}
}
