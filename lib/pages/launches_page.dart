import 'package:flutter/material.dart';
import 'package:testtechnique/theme/widgets/object_details_widget.dart';

import '../entities/launch_entity.dart';
import '../services/launch_service.dart';

class LaunchesPage extends StatefulWidget {
  const LaunchesPage({super.key});

  @override
  State<LaunchesPage> createState() => _LaunchesPageState();
}

class _LaunchesPageState extends State<LaunchesPage> {
  LaunchService launchService = LaunchService();
  Future<List<Launch>>? resListLaunch;
  dynamic resLaunch;
  int length = 0;
  bool isLoading = true;
  bool errorExist = false;

  @override
  void initState() {
    super.initState();
    getListLaunch();
  }

  Future getListLaunch() async {
    isLoading = false;
    errorExist = false;
    resListLaunch = launchService.getListObjects();
    length = (await resListLaunch)!.length;
    setState(() {});
  }

  Future getLaunch(int id) async {
    resLaunch = await launchService.getObjectById(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Launches list",
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
                future: resListLaunch,
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
                                                        launchService,
                                                    id: snapshot.data![index]
                                                        .flightNumber,
                                                  )));
                                },
                                icon: const Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.amber,
                                ),
                              ),
                              subtitle: Text(
                                  "launch_date_local : ${(snapshot.data?[index])?.launchDateLocal}"),
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
