import 'package:flutter/material.dart';

List<Widget> announcementList = <Widget>[];

void main() {
  runApp(const AnnouncementsPage());
}

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "whiteMountainView"),
      home: AnnouncementsHome()
    );
  }
}

class AnnouncementsHome extends StatefulWidget {
  AnnouncementsHome({super.key});

  @override
  _AnnouncementsHomeState createState() => _AnnouncementsHomeState();
}

class _AnnouncementsHomeState extends State<AnnouncementsHome>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Hello World!",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.yellow,
          centerTitle: true,
        ),
        body: Column(
            children: announcementList
        )
    );
  }
}

