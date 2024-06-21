import 'package:flutter/material.dart';
import 'package:testtechnique/entities/launch_entity.dart';
import 'package:testtechnique/entities/mission_entity.dart';
import 'package:testtechnique/services/abstract_service.dart';
import 'package:testtechnique/services/launch_service.dart';
import 'package:testtechnique/services/mission_service.dart';

class ObjectDetailsWidget extends StatefulWidget {
  AbstractService abstractService;
  dynamic id;

  ObjectDetailsWidget(
      {super.key, required this.abstractService, required this.id});

  @override
  State<ObjectDetailsWidget> createState() => _ObjectDetailsWidgetState();
}

class _ObjectDetailsWidgetState extends State<ObjectDetailsWidget> {
  Mission? mission;
  Launch? launch;
  bool isReadyToDisplay = false;

  @override
  initState() {
    super.initState();
    initVariable();
  }

  initVariable() async {
    if (widget.abstractService is LaunchService) {
      launch = await widget.abstractService.getObjectById(widget.id) as Launch;
      isReadyToDisplay = true;
      setState(() {});
    } else if (widget.abstractService is MissionService) {
      mission =
          await widget.abstractService.getObjectById(widget.id) as Mission;
      isReadyToDisplay = true;
      setState(() {});
    } else {
      throw Exception(
          "AbstractService is not a type of LaunchService Or MissionService");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(launch == null ? "Launch details" : "Launch details"),
          centerTitle: true,
        ),
        body: isReadyToDisplay
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    for (var key in launch == null
                        ? mission!.toJson().keys
                        : launch!.toJson().keys)
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 5, right: 5),
                        child: Row(
                          children: [
                            Text(
                              '$key : ',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Flexible(
                                child: Text(launch == null
                                    ? mission!.toJson()[key].toString()
                                    : launch!.toJson()[key].toString()))
                          ],
                        ),
                      )
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ));
  }
}
