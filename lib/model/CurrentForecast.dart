import 'dart:convert';

import 'package:equatable/equatable.dart';
export 'CurrentForecast.dart';

class CurrentForecast extends Equatable {
  CurrentForecast({
    this.time,
    this.summary,
    this.icon,
    this.nearestStormDistance,
    this.nearestStormBearing,
    this.precipIntensity,
    this.precipProbability,
    this.temperature,
    this.apparentTemperature,
    this.dewPoint,
    this.humidity,
    this.pressure,
    this.windSpeed,
    this.windGust,
    this.windBearing,
    this.cloudCover,
    this.uvIndex,
    this.visibility,
    this.ozone,
  });

  final int time;
  final String summary;
  final String icon;
  final int nearestStormDistance;
  final int nearestStormBearing;
  final int precipIntensity;
  final int precipProbability;
  final double temperature;
  final double apparentTemperature;
  final double dewPoint;
  final double humidity;
  final double pressure;
  final double windSpeed;
  final double windGust;
  final int windBearing;
  final double cloudCover;
  final int uvIndex;
  final int visibility;
  final double ozone;

  factory CurrentForecast.fromJson(Map<String, dynamic> json) =>
      CurrentForecast(
        time: json["time"],
        summary: json["summary"],
        icon: json["icon"],
        nearestStormDistance: json["nearestStormDistance"],
        nearestStormBearing: json["nearestStormBearing"],
        precipIntensity: json["precipIntensity"],
        precipProbability: json["precipProbability"],
        temperature: json["temperature"].toDouble(),
        apparentTemperature: json["apparentTemperature"].toDouble(),
        dewPoint: json["dewPoint"].toDouble(),
        humidity: json["humidity"].toDouble(),
        pressure: json["pressure"].toDouble(),
        windSpeed: json["windSpeed"].toDouble(),
        windGust: json["windGust"].toDouble(),
        windBearing: json["windBearing"],
        cloudCover: json["cloudCover"].toDouble(),
        uvIndex: json["uvIndex"],
        visibility: json["visibility"],
        ozone: json["ozone"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "summary": summary,
        "icon": icon,
        "nearestStormDistance": nearestStormDistance,
        "nearestStormBearing": nearestStormBearing,
        "precipIntensity": precipIntensity,
        "precipProbability": precipProbability,
        "temperature": temperature,
        "apparentTemperature": apparentTemperature,
        "dewPoint": dewPoint,
        "humidity": humidity,
        "pressure": pressure,
        "windSpeed": windSpeed,
        "windGust": windGust,
        "windBearing": windBearing,
        "cloudCover": cloudCover,
        "uvIndex": uvIndex,
        "visibility": visibility,
        "ozone": ozone,
      };

  @override
  List<Object> get props => [
        time,
        summary,
        icon,
        nearestStormDistance,
        nearestStormBearing,
        precipIntensity,
        precipProbability,
        temperature,
        apparentTemperature,
        dewPoint,
        humidity,
        pressure,
        windSpeed,
        windGust,
        windBearing,
        cloudCover,
        uvIndex,
        visibility,
        ozone
      ];
}

CurrentForecast currentForecastFromJson(String str) =>
    CurrentForecast.fromJson(json.decode(str));

String currentForecastToJson(CurrentForecast data) =>
    json.encode(data.toJson());
