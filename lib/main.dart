import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:testtechnique/entities/launch_entity.dart';
import 'package:testtechnique/pages/launches_page.dart';
import 'package:testtechnique/pages/missions_page.dart';
import 'package:testtechnique/theme/widgets/text_button_with_icon_widget.dart';

import 'entities/mission_entity.dart';

Future<void> main() async {
  await Hive.initFlutter();

  var launchDb=await Hive.openBox("launch");
  var missionDb=await Hive.openBox("mission");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text(
              'SpaceX Launches and Missions',
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
        body: const MyHomePage(),
      )
    );
  }
}
class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isConnected=true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 50, top: 20),
              child: Image.asset(
                "assets/images/spaceX.png",
                width: 250,
                height: 100,
              ),
            ),
            const Text(
              "Choose between : ",
              style: TextStyle(fontSize: 20),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Divider(
                endIndent: 120,
                thickness: 3,
                indent: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextButtonWithIconWidget(
                myButtonColor: Colors.black,
                myIconColor: Colors.amber,
                myIconData: Icons.list,
                myPressedOnFunction: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MissionsPage()));
                },
                myTextInButton: "Missions Lists",
              ),
            ),
            TextButtonWithIconWidget(
              myButtonColor: Colors.black,
              myIconColor: Colors.amber,
              myIconData: Icons.rocket_launch,
              myPressedOnFunction: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LaunchesPage()));
              },
              myTextInButton: "Launches Lists",
            ),
          ],
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    ;
  }
}
