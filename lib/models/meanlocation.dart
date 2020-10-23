// To parse this JSON data, do
//
//     final meanLocation = meanLocationFromJson(jsonString);

import 'dart:convert';

List<MeanLocation> meanLocationFromJson(String str) => List<MeanLocation>.from(
    json.decode(str).map((x) => MeanLocation.fromJson(x)));

String meanLocationToJson(List<MeanLocation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MeanLocation {
  MeanLocation({
    this.time,
    this.latitude,
    this.longitude,
    this.frequency,
    this.sf,
    this.rssi,
    this.minRssi,
    this.maxRssi,
    this.snr,
    this.minSnr,
    this.maxSnr,
    this.fromgateway,
    this.distanceGw1,
    this.distanceGw2,
    this.status,
  });

  String time;
  double latitude;
  double longitude;
  String frequency;
  String sf;
  String rssi;
  String minRssi;
  String maxRssi;
  String snr;
  String minSnr;
  String maxSnr;
  String fromgateway;
  String distanceGw1;
  String distanceGw2;
  String status;

  factory MeanLocation.fromJson(Map<String, dynamic> json) => MeanLocation(
        time: json["time"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        frequency: json["frequency"],
        sf: json["sf"],
        rssi: json["rssi"],
        minRssi: json["min_rssi"],
        maxRssi: json["max_rssi"],
        snr: json["snr"],
        minSnr: json["min_snr"],
        maxSnr: json["max_snr"],
        fromgateway: json["fromgateway"],
        distanceGw1: json["distanceGW1"],
        distanceGw2: json["distanceGW2"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "latitude": latitude,
        "longitude": longitude,
        "frequency": frequency,
        "sf": sf,
        "rssi": rssi,
        "min_rssi": minRssi,
        "max_rssi": maxRssi,
        "snr": snr,
        "min_snr": minSnr,
        "max_snr": maxSnr,
        "fromgateway": fromgateway,
        "distanceGW1": distanceGw1,
        "distanceGW2": distanceGw2,
        "status": status,
      };
}
