import 'package:flutter/material.dart';
import 'package:usg_mobile/Pages/Initiatives.dart';

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

    announcementList.clear();

    for(int i = 0; i < Initiatives.initiatives.length; i++){

      announcementList.add(
          Container(

              height: 150,
              width: MediaQuery.of(context).size.width,
              color: Colors.amber,
              margin: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          Initiatives.initiatives[i].title
                      )
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Text(
                          Initiatives.initiatives[i].createDate.toString()
                      )
                  ),
                  Align(
                      alignment: Alignment(-1.0, -0.75),
                      child: Text(
                          Initiatives.initiatives[i].creator
                      )
                  ),
                  Align(
                      alignment: Alignment(-1.0, -0.50),
                      child: Text(
                          Initiatives.initiatives[i].description
                      )
                  )
                ],
              )
          )

      );


    }

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

