import 'dart:convert';

class Mission {
  String? missionName;
  String? missionId;
  List<String>? manufacturers;
  List<String>? payloadIds;
  String? wikipedia;
  String? website;
  String? twitter;
  String? description;

  Mission({
    this.missionName,
    this.missionId,
    this.manufacturers,
    this.payloadIds,
    this.wikipedia,
    this.website,
    this.twitter,
    this.description,
  });

  factory Mission.fromRawJson(String str) => Mission.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Mission.fromJson(Map<String, dynamic> json) => Mission(
    missionName: json["mission_name"],
    missionId: json["mission_id"],
    manufacturers: json["manufacturers"] == null ? [] : List<String>.from(json["manufacturers"]!.map((x) => x)),
    payloadIds: json["payload_ids"] == null ? [] : List<String>.from(json["payload_ids"]!.map((x) => x)),
    wikipedia: json["wikipedia"],
    website: json["website"],
    twitter: json["twitter"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "mission_name": missionName,
    "mission_id": missionId,
    "manufacturers": manufacturers == null ? [] : List<dynamic>.from(manufacturers!.map((x) => x)),
    "payload_ids": payloadIds == null ? [] : List<dynamic>.from(payloadIds!.map((x) => x)),
    "wikipedia": wikipedia,
    "website": website,
    "twitter": twitter,
    "description": description,
  };
}
