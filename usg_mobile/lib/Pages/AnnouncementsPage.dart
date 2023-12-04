import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:usg_mobile/Pages/InitiativePage.dart';
import 'package:usg_mobile/backend/initiatives_record.dart';
import 'package:usg_mobile/pages/CreateInitPage.dart';

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
        home: AnnouncementsHome());
  }
}

class AnnouncementsHome extends StatefulWidget {
  AnnouncementsHome({super.key});

  Future<List<QueryDocumentSnapshot<InitiativeRecord>>?> getInitiatives() async{
    final ref = InitiativeRecord.collection.withConverter(fromFirestore: InitiativeRecord.fromFirestore, toFirestore: (InitiativeRecord initiative, _) => initiative.toFirestore());
    final docSnap = await ref.get();
    final allInits = docSnap.docs;

    if(allInits != null){
      initiatives = allInits;
    }
    else{
      initiatives = null;
    }
  }

  late int size;

  late List<QueryDocumentSnapshot<InitiativeRecord>>? initiatives;

  Future<void> initiativeSize () async {
    var inits = await getInitiatives();
    if(inits == null){
      size = 0;
    }
    else{
      size = inits.length;
    }
  }

  @override
  _AnnouncementsHomeState createState() => _AnnouncementsHomeState();
}

class _AnnouncementsHomeState extends State<AnnouncementsHome> {

  @override
  Widget build(BuildContext context) {
    // announcementList.clear();
    //iterates through the announcement lists
    for (int i = 0; i < widget.size; i++) {
      //generates random color for the container
      List colors = [Colors.amber, Colors.blue, Colors.deepPurple];
      Random random = new Random();
      //adds announcement to list
      announcementList.add(InkWell(
        child: Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: colors.elementAt(random.nextInt(colors.length)),
            margin: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(widget.initiatives!.elementAt(i).data().title.toString())),
                Align(
                    alignment: Alignment.topRight,
                    child:
                        Text(widget.initiatives!.elementAt(i).data().createDate.toString())),
                Align(
                    alignment: Alignment(-1.0, -0.75),
                    child: Text(widget.initiatives!.elementAt(i).data().initiative_owner.toString())),
                Align(
                    alignment: Alignment(-1.0, -0.50),
                    child: Text(widget.initiatives!.elementAt(i).data().description.toString()))
              ],
            )),
        onTap: () {

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return InitiativePage(id: i,);
          }));
        },
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'USG',
          style: TextStyle(
              color: Colors.yellow.shade600, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        flexibleSpace: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 30.0, 90.0, 0.0),
          child: Image.asset('assets/images/Neumont_logo.png'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: announcementList),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateInitPage()));
        },
        tooltip: 'Create',
        child: const Icon(Icons.add),
      ),
    );
  }

  void createInit(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CreateInitPage()));
  }

  @override
  void initState() {
    widget.initiativeSize();
    widget.getInitiatives();
  }
}
