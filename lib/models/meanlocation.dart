// To parse this JSON data, do
//
//     final meanLocation = meanLocationFromJson(jsonString);

import 'dart:convert';

List<MeanLocation> meanLocationFromJson(String str) => List<MeanLocation>.from(json.decode(str).map((x) => MeanLocation.fromJson(x)));

String meanLocationToJson(List<MeanLocation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MeanLocation {
  MeanLocation({
    this.time,
    this.latitude,
    this.longitude,
    this.frequency,
    this.rssi,
    this.snr,
  });

  String time;
  double latitude;
  double longitude;
  String frequency;
  String rssi;
  String snr;

  factory MeanLocation.fromJson(Map<String, dynamic> json) => MeanLocation(
    time: json["time"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    frequency: json["frequency"],
    rssi: json["rssi"],
    snr: json["snr"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "latitude": latitude,
    "longitude": longitude,
    "frequency": frequency,
    "rssi": rssi,
    "snr": snr,
  };
}
