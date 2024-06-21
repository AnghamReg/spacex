import 'dart:async';
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:testtechnique/entities/launch_entity.dart';
import 'package:testtechnique/services/abstract_service.dart';

class LaunchService extends AbstractService {
  final String urlListLaunch = "https://api.spacexdata.com/v3/launches";
  String urlLaunchDetails = "https://api.spacexdata.com/v3/launches/"; //+id
  final _dbLaunch = Hive.box("launch");

  _storageInCacheWithHive(List<Launch> launches) {
    int i = 1;
    for (var launch in launches) {
      _dbLaunch.put(i, json.encode(launch.toJson()));
      i++;
    }
  }

  List<Launch> _readFromCacheWithHive() {
    List<Launch> launches = [];
    for (int i = 1; i < _dbLaunch.length + 1; i++) {
      String? rawJson = _dbLaunch.get(i)?.toString();
      if (rawJson != null) {
        try {
          launches.add(Launch.fromRawJson(rawJson));
        } catch (e) {
          print('Error parsing JSON from cache: $e');
        }
      }
    }
    return launches;
  }

  @override
  Future getObjectById(dynamic id) async {
    final response =
        await http.get(Uri.parse("$urlLaunchDetails${id.toString()}"));

    if (response.statusCode == 200) {
      var launch =
          Launch.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      //just to check
      print("response.body is $launch");
      return launch;
    } else {
      throw Exception('Failed to load the launch');
    }
  }

  @override
  Future<List<Launch>> getListObjects() async {
    try {
      final response = await http.get(Uri.parse(urlListLaunch));
      if (response.statusCode == 200) {
        Iterable l = json.decode(response.body);
        List<Launch> launches =
            List<Launch>.from(l.map((model) => Launch.fromJson(model)));
        _storageInCacheWithHive(launches);
        print("response.body is $launches");
        return launches;
      } else {
        throw Exception('Failed to load the list of Launches from network');
      }
    } catch (error) {
      print('Network error occurred: $error');
      List<Launch> launches = _readFromCacheWithHive();
      if (launches.isNotEmpty) {
        print(
            "Returning from cache: length= ${launches.length} & elements = $launches");
        return launches;
      } else {
        throw Exception('Failed to load the list of Launches from cache');
      }
    }
  }
}
