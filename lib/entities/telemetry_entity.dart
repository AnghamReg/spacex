import 'dart:convert';

class Telemetry {
  dynamic flightClub;

  Telemetry({
    this.flightClub,
  });

  factory Telemetry.fromRawJson(String str) => Telemetry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Telemetry.fromJson(Map<String, dynamic> json) => Telemetry(
    flightClub: json["flight_club"],
  );

  Map<String, dynamic> toJson() => {
    "flight_club": flightClub,
  };
}