
import 'dart:convert';

import 'package:testtechnique/entities/rocket_entity.dart';
import 'package:testtechnique/entities/telemetry_entity.dart';

class Launch {
  int? flightNumber;
  String? missionName;
  List<dynamic>? missionId;
  bool? upcoming;
  String? launchYear;
  int? launchDateUnix;
  DateTime? launchDateUtc;
  DateTime? launchDateLocal;
  bool? isTentative;
  String? tentativeMaxPrecision;
  bool? tbd;
  int? launchWindow;
  Rocket? rocket;
  List<dynamic>? ships;
  Telemetry? telemetry;
  LaunchSite? launchSite;
  bool? launchSuccess;
  LaunchFailureDetails? launchFailureDetails;
  Links? links;
  String? details;
  DateTime? staticFireDateUtc;
  int? staticFireDateUnix;
  Timeline? timeline;
  dynamic crew;

  Launch({
    this.flightNumber,
    this.missionName,
    this.missionId,
    this.upcoming,
    this.launchYear,
    this.launchDateUnix,
    this.launchDateUtc,
    this.launchDateLocal,
    this.isTentative,
    this.tentativeMaxPrecision,
    this.tbd,
    this.launchWindow,
    this.rocket,
    this.ships,
    this.telemetry,
    this.launchSite,
    this.launchSuccess,
    this.launchFailureDetails,
    this.links,
    this.details,
    this.staticFireDateUtc,
    this.staticFireDateUnix,
    this.timeline,
    this.crew,
  });

  factory Launch.fromRawJson(String str) => Launch.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Launch.fromJson(Map<String, dynamic> json) => Launch(
    flightNumber: json["flight_number"],
    missionName: json["mission_name"],
    missionId: json["mission_id"] == null ? [] : List<dynamic>.from(json["mission_id"]!.map((x) => x)),
    upcoming: json["upcoming"],
    launchYear: json["launch_year"],
    launchDateUnix: json["launch_date_unix"],
    launchDateUtc: json["launch_date_utc"] == null ? null : DateTime.parse(json["launch_date_utc"]),
    launchDateLocal: json["launch_date_local"] == null ? null : DateTime.parse(json["launch_date_local"]),
    isTentative: json["is_tentative"],
    tentativeMaxPrecision: json["tentative_max_precision"],
    tbd: json["tbd"],
    launchWindow: json["launch_window"],
    rocket: json["rocket"] == null ? null : Rocket.fromJson(json["rocket"]),
    ships: json["ships"] == null ? [] : List<dynamic>.from(json["ships"]!.map((x) => x)),
    telemetry: json["telemetry"] == null ? null : Telemetry.fromJson(json["telemetry"]),
    launchSite: json["launch_site"] == null ? null : LaunchSite.fromJson(json["launch_site"]),
    launchSuccess: json["launch_success"],
    launchFailureDetails: json["launch_failure_details"] == null ? null : LaunchFailureDetails.fromJson(json["launch_failure_details"]),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    details: json["details"],
    staticFireDateUtc: json["static_fire_date_utc"] == null ? null : DateTime.parse(json["static_fire_date_utc"]),
    staticFireDateUnix: json["static_fire_date_unix"],
    timeline: json["timeline"] == null ? null : Timeline.fromJson(json["timeline"]),
    crew: json["crew"],
  );

  Map<String, dynamic> toJson() => {
    "flight_number": flightNumber,
    "mission_name": missionName,
    "mission_id": missionId == null ? [] : List<dynamic>.from(missionId!.map((x) => x)),
    "upcoming": upcoming,
    "launch_year": launchYear,
    "launch_date_unix": launchDateUnix,
    "launch_date_utc": launchDateUtc?.toIso8601String(),
    "launch_date_local": launchDateLocal?.toIso8601String(),
    "is_tentative": isTentative,
    "tentative_max_precision": tentativeMaxPrecision,
    "tbd": tbd,
    "launch_window": launchWindow,
    "rocket": rocket?.toJson(),
    "ships": ships == null ? [] : List<dynamic>.from(ships!.map((x) => x)),
    "telemetry": telemetry?.toJson(),
    "launch_site": launchSite?.toJson(),
    "launch_success": launchSuccess,
    "launch_failure_details": launchFailureDetails?.toJson(),
    "links": links?.toJson(),
    "details": details,
    "static_fire_date_utc": staticFireDateUtc?.toIso8601String(),
    "static_fire_date_unix": staticFireDateUnix,
    "timeline": timeline?.toJson(),
    "crew": crew,
  };
}

//LaunchSite
class LaunchSite {
  String? siteId;
  String? siteName;
  String? siteNameLong;

  LaunchSite({
    this.siteId,
    this.siteName,
    this.siteNameLong,
  });

  factory LaunchSite.fromRawJson(String str) => LaunchSite.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LaunchSite.fromJson(Map<String, dynamic> json) => LaunchSite(
    siteId: json["site_id"],
    siteName: json["site_name"],
    siteNameLong: json["site_name_long"],
  );

  Map<String, dynamic> toJson() => {
    "site_id": siteId,
    "site_name": siteName,
    "site_name_long": siteNameLong,
  };
}

//LaunchFailureDetails
class LaunchFailureDetails {
  int? time;
  dynamic altitude;
  String? reason;

  LaunchFailureDetails({
    this.time,
    this.altitude,
    this.reason,
  });

  factory LaunchFailureDetails.fromRawJson(String str) => LaunchFailureDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LaunchFailureDetails.fromJson(Map<String, dynamic> json) => LaunchFailureDetails(
    time: json["time"],
    altitude: json["altitude"],
    reason: json["reason"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "altitude": altitude,
    "reason": reason,
  };
}

//Links
class Links {
  String? missionPatch;
  String? missionPatchSmall;
  dynamic redditCampaign;
  dynamic redditLaunch;
  dynamic redditRecovery;
  dynamic redditMedia;
  dynamic presskit;
  String? articleLink;
  String? wikipedia;
  String? videoLink;
  String? youtubeId;
  List<dynamic>? flickrImages;

  Links({
    this.missionPatch,
    this.missionPatchSmall,
    this.redditCampaign,
    this.redditLaunch,
    this.redditRecovery,
    this.redditMedia,
    this.presskit,
    this.articleLink,
    this.wikipedia,
    this.videoLink,
    this.youtubeId,
    this.flickrImages,
  });

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    missionPatch: json["mission_patch"],
    missionPatchSmall: json["mission_patch_small"],
    redditCampaign: json["reddit_campaign"],
    redditLaunch: json["reddit_launch"],
    redditRecovery: json["reddit_recovery"],
    redditMedia: json["reddit_media"],
    presskit: json["presskit"],
    articleLink: json["article_link"],
    wikipedia: json["wikipedia"],
    videoLink: json["video_link"],
    youtubeId: json["youtube_id"],
    flickrImages: json["flickr_images"] == null ? [] : List<dynamic>.from(json["flickr_images"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "mission_patch": missionPatch,
    "mission_patch_small": missionPatchSmall,
    "reddit_campaign": redditCampaign,
    "reddit_launch": redditLaunch,
    "reddit_recovery": redditRecovery,
    "reddit_media": redditMedia,
    "presskit": presskit,
    "article_link": articleLink,
    "wikipedia": wikipedia,
    "video_link": videoLink,
    "youtube_id": youtubeId,
    "flickr_images": flickrImages == null ? [] : List<dynamic>.from(flickrImages!.map((x) => x)),
  };
}

//Timeline
class Timeline {
  int? webcastLiftoff;

  Timeline({
    this.webcastLiftoff,
  });

  factory Timeline.fromRawJson(String str) => Timeline.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
    webcastLiftoff: json["webcast_liftoff"],
  );

  Map<String, dynamic> toJson() => {
    "webcast_liftoff": webcastLiftoff,
  };
}