// To parse this JSON data, do
//
//     final smartLocation = smartLocationFromJson(jsonString);

import 'dart:convert';

List<SmartLocation> smartLocationFromJson(String str) => List<SmartLocation>.from(json.decode(str).map((x) => SmartLocation.fromJson(x)));

String smartLocationToJson(List<SmartLocation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SmartLocation {
  SmartLocation({
    this.latitude,
    this.longitude,
    this.frequency,
    this.rssi,
    this.rssiP,
    this.snr,
  });

  double latitude;
  double longitude;
  String frequency;
  String rssi;
  String rssiP;
  String snr;

  factory SmartLocation.fromJson(Map<String, dynamic> json) => SmartLocation(
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    frequency: json["frequency"],
    rssi: json["rssi"],
    rssiP: json["rssi_p"],
    snr: json["snr"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
    "frequency": frequency,
    "rssi": rssi,
    "rssi_p": rssiP,
    "snr": snr,
  };
}
