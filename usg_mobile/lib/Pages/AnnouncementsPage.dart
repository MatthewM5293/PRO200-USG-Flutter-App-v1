import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
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

  DatabaseReference ref = FirebaseDatabase.instance.ref("Initiatives");

  /*Future<List<QueryDocumentSnapshot<InitiativeRecord>>?> getInitiatives() async{
    final ref = InitiativeRecord.collection.withConverter(fromFirestore: InitiativeRecord.fromFirestore, toFirestore: (InitiativeRecord initiative, _) => initiative.toFirestore());
    final docSnap = await ref.get();
    final allInits = docSnap.docs;

    if(allInits != null){
      initiatives = allInits;
    }
    else{
      initiatives = null;
    }

    return allInits;
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
  }*/

  @override
  _AnnouncementsHomeState createState() => _AnnouncementsHomeState();
}

class _AnnouncementsHomeState extends State<AnnouncementsHome> {

  @override
  Widget build(BuildContext context) {

    print("Hello World!");

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
      body: FirebaseAnimatedList(
        query: widget.ref,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
        Animation<double> animation, int index) {
          return ListTile(
            title: Text(snapshot.value['title']),
            subtitle: Text(snapshot.value['description']),
          );
        }
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
    /*widget.initiativeSize();
    widget.getInitiatives();*/
  }

  /*body: SingleChildScrollView(
  child: Column(children: announcementList),
  ),*/
}
