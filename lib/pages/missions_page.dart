import 'package:flutter/material.dart';

import '../entities/mission_entity.dart';
import '../services/mission_service.dart';
import '../theme/widgets/object_details_widget.dart';

class MissionsPage extends StatefulWidget {
  const MissionsPage({super.key});

  @override
  State<MissionsPage> createState() => _MissionsPageState();
}

class _MissionsPageState extends State<MissionsPage> {
  MissionService missionService = MissionService();
  Future<List<Mission>>? resListMission;
  dynamic resMission;
  int length = 0;
  bool isLoading = true;
  bool errorExist = false;

  @override
  void initState() {
    super.initState();
    getListMission();
  }

  Future getListMission() async {
    isLoading = false;
    errorExist = false;
    resListMission = missionService.getListObjects();
    length = (await resListMission)!.length;
    setState(() {});
  }

  Future getMission(String id) async {
    resMission = await missionService.getMissionById(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Missions list",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: isLoading && !errorExist
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.redAccent,
                  strokeWidth: 10,
                ),
              )
            : FutureBuilder(
                future: resListMission,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              trailing: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder:
                                              /* (context) => LaunchDetails(
                                              launch: snapshot.data![index])*/
                                              (context) => ObjectDetailsWidget(
                                                    abstractService:
                                                        missionService,
                                                    id: snapshot
                                                        .data![index].missionId,
                                                  )));
                                },
                                icon: const Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.amber,
                                ),
                              ),
                              subtitle: Text(
                                  "MISSION ID : ${(snapshot.data?[index])?.missionId}"),
                            ),
                          );
                        });
                  } else {
                    if (!snapshot.hasError) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.redAccent,
                          strokeWidth: 10,
                        ),
                      );
                    } else {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons
                                  .signal_wifi_connected_no_internet_4_outlined,
                              color: Colors.red,
                              size: 40,
                            ),
                            Text(
                                "Failed to download data. Please check your connection"),
                          ],
                        ),
                      );
                    }
                  }
                }));
  }
}
