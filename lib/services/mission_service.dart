import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:testtechnique/services/abstract_service.dart';

import '../entities/mission_entity.dart';

class MissionService extends AbstractService {
  final String urlListMission = "https://api.spacexdata.com/v3/missions";
  String urlMissionDetails = "https://api.spacexdata.com/v3/missions/"; //+id*
  final _dbMission = Hive.box("mission");

  _storageInCacheWithHive(List<Mission> missions) {
    int i = 1;
    for (var mission in missions) {
      _dbMission.put(i, json.encode(mission.toJson()));
      i++;
    }
  }

  List<Mission> _readFromCacheWithHive() {
    List<Mission> missions = [];
    for (int i = 1; i < _dbMission.length + 1; i++) {
      String? rawJson = _dbMission.get(i)?.toString();
      if (rawJson != null) {
        try {
          missions.add(Mission.fromRawJson(rawJson));
        } catch (e) {
          print('Error parsing JSON from cache: $e');
        }
      }
    }
    return missions;
  }

  Future<List<Mission>> getListMission() async {
    try {
      final response = await http.get(Uri.parse(urlListMission));
      if (response.statusCode == 200) {
        Iterable l = json.decode(response.body);
        List<Mission> missions =
            List<Mission>.from(l.map((model) => Mission.fromJson(model)));
        _storageInCacheWithHive(missions);
        print("response.body is $missions");
        return missions;
      } else {
        throw Exception('Failed to load the list of Missions from network');
      }
    } catch (error) {
      print('Network error occurred: $error');
      List<Mission> missions = _readFromCacheWithHive();
      if (missions.isNotEmpty) {
        print(
            "Returning from cache: length= ${missions.length} & elements = $missions");
        return missions;
      } else {
        throw Exception('Failed to load the list of Missions from cache');
      }
    }
  }

  Future getMissionById(String id) async {
    final response = await http.get(Uri.parse("$urlMissionDetails$id"));

    if (response.statusCode == 200) {
      var mission =
          Mission.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      //just to check
      print("response.body is $mission");
      return mission;
    } else {
      throw Exception('Failed to load the mission');
    }
  }

  @override
  Future<List<Mission>> getListObjects() async {
    try {
      final response = await http.get(Uri.parse(urlListMission));
      if (response.statusCode == 200) {
        Iterable l = json.decode(response.body);
        List<Mission> missions =
            List<Mission>.from(l.map((model) => Mission.fromJson(model)));
        _storageInCacheWithHive(missions);
        print("response.body is $missions");
        return missions;
      } else {
        throw Exception('Failed to load the list of Missions from network');
      }
    } catch (error) {
      print('Network error occurred: $error');
      List<Mission> missions = _readFromCacheWithHive();
      if (missions.isNotEmpty) {
        print(
            "Returning from cache: length= ${missions.length} & elements = $missions");
        return missions;
      } else {
        throw Exception('Failed to load the list of Missions from cache');
      }
    }
  }

  @override
  Future getObjectById(id) async {
    final response = await http.get(Uri.parse("$urlMissionDetails$id"));

    if (response.statusCode == 200) {
      var mission =
          Mission.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      //just to check
      print("response.body is $mission");
      return mission;
    } else {
      throw Exception('Failed to load the mission');
    }
  }
}
