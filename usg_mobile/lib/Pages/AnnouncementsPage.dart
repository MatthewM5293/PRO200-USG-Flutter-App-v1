import 'dart:math';

import 'package:flutter/material.dart';
import 'package:usg_mobile/Pages/InitiativePage.dart';
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

    //iterates through the announcement lists
    for(int i = 0; i < Initiatives.initiatives.length; i++){

      //generates random color for the container
      List colors = [Colors.amber, Colors.blue, Colors.deepPurple];
      Random random = new Random();

      final height = MediaQuery.of(context).size.height;
      final width = MediaQuery.of(context).size.width;

      //adds announcement to list
      announcementList.add(
          InkWell(
            child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                color: colors.elementAt(random.nextInt(colors.length)),
                margin: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            Initiatives.initiatives[i].title,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                          ),
                          margin: const EdgeInsets.fromLTRB(5, 3, 0, 0),
                          color: Colors.redAccent,
                          constraints: const BoxConstraints(
                            maxWidth: 180
                          ),
                        ),

                        Container(
                          child: Text(
                            Initiatives.initiatives[i].createDate.toString(),
                            textAlign: TextAlign.right,
                          ),
                          margin: const EdgeInsets.fromLTRB(0, 3, 5, 0),
                          color: Colors.green
                        ),
                      ],
                    ),


                    Container(
                      child: Text(
                        Initiatives.initiatives[i].creator,
                        overflow: TextOverflow.ellipsis,
                      ),
                      margin: const EdgeInsets.fromLTRB(5, 3, 5, 0),
                      color: Colors.cyanAccent,
                    ),


                    Container(
                      height: 105,
                      child: Text(
                        Initiatives.initiatives[i].description,
                        overflow: TextOverflow.fade,
                      ),
                      margin: const EdgeInsets.fromLTRB(5, 3, 5, 0),
                      color: Colors.cyanAccent,
                    ),

                  ],
                )
            ),

            onTap: () {

              var test = Initiatives.initiatives;
              print(test);
              var test3 = test.elementAt(0);
              //getting values from initiative

              Navigator.push(context, MaterialPageRoute(builder: (context){

                return const InitiativePage();

              }));
            },
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
        body: SingleChildScrollView(
          child: Column(
              children: announcementList
          ),
        )
    );
  }
}

