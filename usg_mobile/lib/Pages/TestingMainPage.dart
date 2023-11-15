import 'package:flutter/material.dart';
import 'package:usg_mobile/Pages/Initiatives.dart';
import 'package:usg_mobile/Pages/VotePage.dart';
import 'package:usg_mobile/Pages/InitiativePage.dart';
import 'package:usg_mobile/Pages/CreateInitPage.dart';
import 'package:usg_mobile/Pages/AnnouncementsPage.dart';

class AllPage extends StatelessWidget {
  const AllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(

        child: Column(

          children: [

            const Padding(padding: EdgeInsets.all(2.0)),

            Row(

              children: [

                TextButton(

                  onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context){

                  return const InitiativePage();

                  }));

                },

                  child: const Text('Go To initiatives Page'),

                ),

                TextButton(

                  onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context){

                      return const CreateInitPage();

                    }));

                  },

                  child: const Text('Go to Create Initiatives Page'),

                ),

                TextButton(

                  onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context){

                      return const votePage();

                    }));

                  },

                  child: const Text('Go to Voting 4 Peps Page'),

                ),

                TextButton(

                  onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context){

                      return const AnnouncementsPage();

                    }));

                  },

                  child: const Text('Go to Announcements Page'),

                ),

              ],

            ),

          ],

        ),

      ),

    );

  }

}

//body: ,
