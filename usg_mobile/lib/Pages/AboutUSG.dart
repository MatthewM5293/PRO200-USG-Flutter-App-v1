import 'package:flutter/material.dart';
import 'package:usg_mobile/Pages/VotePage.dart';
import 'package:usg_mobile/Pages/InitiativePage.dart';
import 'package:usg_mobile/Pages/CreateInitPage.dart';
import 'package:usg_mobile/Pages/AnnouncementsPage.dart';

class AllPage extends StatelessWidget {
  const AllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          'USG',
          style: TextStyle(
              color: Colors.yellow.shade600,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.black26,
        centerTitle: true,
        flexibleSpace: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 90.0, 0.0),
          child: Image.asset('assets/images/Neumont_logo.png'),
        ),

      ),

      body: const Center(

        child: Column(

          children: [

            Padding(padding: EdgeInsets.all(2.0)),

            Text("About USG"),

            Text("The USG is the unified student government for the school Neumont college of computer science")

          ]

      ),

    )

    );

  }

}

//body: ,
