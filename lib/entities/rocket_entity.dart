import 'dart:convert';

class Rocket {
  String? rocketId;
  String? rocketName;
  String? rocketType;
  FirstStage? firstStage;
  SecondStage? secondStage;
  Fairings? fairings;

  Rocket({
    this.rocketId,
    this.rocketName,
    this.rocketType,
    this.firstStage,
    this.secondStage,
    this.fairings,
  });

  factory Rocket.fromRawJson(String str) => Rocket.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rocket.fromJson(Map<String, dynamic> json) => Rocket(
    rocketId: json["rocket_id"],
    rocketName: json["rocket_name"],
    rocketType: json["rocket_type"],
    firstStage: json["first_stage"] == null ? null : FirstStage.fromJson(json["first_stage"]),
    secondStage: json["second_stage"] == null ? null : SecondStage.fromJson(json["second_stage"]),
    fairings: json["fairings"] == null ? null : Fairings.fromJson(json["fairings"]),
  );

  Map<String, dynamic> toJson() => {
    "rocket_id": rocketId,
    "rocket_name": rocketName,
    "rocket_type": rocketType,
    "first_stage": firstStage?.toJson(),
    "second_stage": secondStage?.toJson(),
    "fairings": fairings?.toJson(),
  };
}

//FirstStage
class FirstStage {
  List<Core>? cores;

  FirstStage({
    this.cores,
  });

  factory FirstStage.fromRawJson(String str) => FirstStage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FirstStage.fromJson(Map<String, dynamic> json) => FirstStage(
    cores: json["cores"] == null ? [] : List<Core>.from(json["cores"]!.map((x) => Core.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cores": cores == null ? [] : List<dynamic>.from(cores!.map((x) => x.toJson())),
  };
}

//Core
class Core {
  String? coreSerial;
  int? flight;
  dynamic block;
  bool? gridfins;
  bool? legs;
  bool? reused;
  dynamic landSuccess;
  bool? landingIntent;
  dynamic landingType;
  dynamic landingVehicle;

  Core({
    this.coreSerial,
    this.flight,
    this.block,
    this.gridfins,
    this.legs,
    this.reused,
    this.landSuccess,
    this.landingIntent,
    this.landingType,
    this.landingVehicle,
  });

  factory Core.fromRawJson(String str) => Core.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Core.fromJson(Map<String, dynamic> json) => Core(
    coreSerial: json["core_serial"],
    flight: json["flight"],
    block: json["block"],
    gridfins: json["gridfins"],
    legs: json["legs"],
    reused: json["reused"],
    landSuccess: json["land_success"],
    landingIntent: json["landing_intent"],
    landingType: json["landing_type"],
    landingVehicle: json["landing_vehicle"],
  );

  Map<String, dynamic> toJson() => {
    "core_serial": coreSerial,
    "flight": flight,
    "block": block,
    "gridfins": gridfins,
    "legs": legs,
    "reused": reused,
    "land_success": landSuccess,
    "landing_intent": landingIntent,
    "landing_type": landingType,
    "landing_vehicle": landingVehicle,
  };
}

//SecondStage
class SecondStage {
  int? block;
  List<Payload>? payloads;

  SecondStage({
    this.block,
    this.payloads,
  });

  factory SecondStage.fromRawJson(String str) => SecondStage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SecondStage.fromJson(Map<String, dynamic> json) => SecondStage(
    block: json["block"],
    payloads: json["payloads"] == null ? [] : List<Payload>.from(json["payloads"]!.map((x) => Payload.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "block": block,
    "payloads": payloads == null ? [] : List<dynamic>.from(payloads!.map((x) => x.toJson())),
  };
}

//Payload
class Payload {
  String? payloadId;
  List<dynamic>? noradId;
  bool? reused;
  List<String>? customers;
  String? nationality;
  String? manufacturer;
  String? payloadType;
  num? payloadMassKg;
  num? payloadMassLbs;
  String? orbit;
  OrbitParams? orbitParams;

  Payload({
    this.payloadId,
    this.noradId,
    this.reused,
    this.customers,
    this.nationality,
    this.manufacturer,
    this.payloadType,
    this.payloadMassKg,
    this.payloadMassLbs,
    this.orbit,
    this.orbitParams,
  });

  factory Payload.fromRawJson(String str) => Payload.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    payloadId: json["payload_id"],
    noradId: json["norad_id"] == null ? [] : List<dynamic>.from(json["norad_id"]!.map((x) => x)),
    reused: json["reused"],
    customers: json["customers"] == null ? [] : List<String>.from(json["customers"]!.map((x) => x)),
    nationality: json["nationality"],
    manufacturer: json["manufacturer"],
    payloadType: json["payload_type"],
    payloadMassKg: json["payload_mass_kg"],
    payloadMassLbs: json["payload_mass_lbs"],
    orbit: json["orbit"],
    orbitParams: json["orbit_params"] == null ? null : OrbitParams.fromJson(json["orbit_params"]),
  );

  Map<String, dynamic> toJson() => {
    "payload_id": payloadId,
    "norad_id": noradId == null ? [] : List<dynamic>.from(noradId!.map((x) => x)),
    "reused": reused,
    "customers": customers == null ? [] : List<dynamic>.from(customers!.map((x) => x)),
    "nationality": nationality,
    "manufacturer": manufacturer,
    "payload_type": payloadType,
    "payload_mass_kg": payloadMassKg,
    "payload_mass_lbs": payloadMassLbs,
    "orbit": orbit,
    "orbit_params": orbitParams?.toJson(),
  };
}

//OrbitParams
class OrbitParams {
  String? referenceSystem;
  String? regime;
  dynamic longitude;
  dynamic semiMajorAxisKm;
  dynamic eccentricity;
  num? periapsisKm;
  num? apoapsisKm;
  num? inclinationDeg;
  dynamic periodMin;
  dynamic lifespanYears;
  dynamic epoch;
  dynamic meanMotion;
  dynamic raan;
  dynamic argOfPericenter;
  dynamic meanAnomaly;

  OrbitParams({
    this.referenceSystem,
    this.regime,
    this.longitude,
    this.semiMajorAxisKm,
    this.eccentricity,
    this.periapsisKm,
    this.apoapsisKm,
    this.inclinationDeg,
    this.periodMin,
    this.lifespanYears,
    this.epoch,
    this.meanMotion,
    this.raan,
    this.argOfPericenter,
    this.meanAnomaly,
  });

  factory OrbitParams.fromRawJson(String str) => OrbitParams.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrbitParams.fromJson(Map<String, dynamic> json) => OrbitParams(
    referenceSystem: json["reference_system"],
    regime: json["regime"],
    longitude: json["longitude"],
    semiMajorAxisKm: json["semi_major_axis_km"],
    eccentricity: json["eccentricity"],
    periapsisKm: json["periapsis_km"],
    apoapsisKm: json["apoapsis_km"],
    inclinationDeg: json["inclination_deg"],
    periodMin: json["period_min"],
    lifespanYears: json["lifespan_years"],
    epoch: json["epoch"],
    meanMotion: json["mean_motion"],
    raan: json["raan"],
    argOfPericenter: json["arg_of_pericenter"],
    meanAnomaly: json["mean_anomaly"],
  );

  Map<String, dynamic> toJson() => {
    "reference_system": referenceSystem,
    "regime": regime,
    "longitude": longitude,
    "semi_major_axis_km": semiMajorAxisKm,
    "eccentricity": eccentricity,
    "periapsis_km": periapsisKm,
    "apoapsis_km": apoapsisKm,
    "inclination_deg": inclinationDeg,
    "period_min": periodMin,
    "lifespan_years": lifespanYears,
    "epoch": epoch,
    "mean_motion": meanMotion,
    "raan": raan,
    "arg_of_pericenter": argOfPericenter,
    "mean_anomaly": meanAnomaly,
  };
}

//Fairings
class Fairings {
  bool? reused;
  bool? recoveryAttempt;
  bool? recovered;
  dynamic ship;

  Fairings({
    this.reused,
    this.recoveryAttempt,
    this.recovered,
    this.ship,
  });

  factory Fairings.fromRawJson(String str) => Fairings.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Fairings.fromJson(Map<String, dynamic> json) => Fairings(
    reused: json["reused"],
    recoveryAttempt: json["recovery_attempt"],
    recovered: json["recovered"],
    ship: json["ship"],
  );

  Map<String, dynamic> toJson() => {
    "reused": reused,
    "recovery_attempt": recoveryAttempt,
    "recovered": recovered,
    "ship": ship,
  };
}
