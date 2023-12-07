import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:usg_mobile/backend/initiatives_record.dart';
import 'package:usg_mobile/pages/CreateInitPage.dart';
import 'package:usg_mobile/reusable_widgets/reusable_widget.dart';

import 'InitiativePage.dart';

List<Widget> announcementList = <Widget>[];

class AnnouncementsPage extends StatefulWidget {
  const AnnouncementsPage({super.key});

  @override
  State<StatefulWidget> createState() => _AnnouncementsPage();
}

class _AnnouncementsPage extends State<AnnouncementsPage> {
  final _InitStream =
      FirebaseFirestore.instance.collection('Initiatives').snapshots();

  @override
  Widget build(BuildContext context) {
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
      body: StreamBuilder(
        stream: _InitStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('loading'); //can be loading icon
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data?.docs.isEmpty == true) {
            return const Text(
                'Announcements cannot be accessed, try again later!');
          } else {
            var docs = snapshot.data!.docs;
            return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> initiative = InitiativeRecord().
                  return reusableAnnouncement2(
                      context,
                      docs[index]['title'],
                      docs[index]['description'],
                      docs[index]['initiative_owner'],
                      // docs[index]['createDate'] as Timestamp,
                      () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return InitiativePage();
                    }));
                  });
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createInit(context);
        },
        tooltip: 'Create',
        child: const Icon(Icons.add),
      ),
    );
  }
}

void createInit(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const CreateInitPage()));
}
