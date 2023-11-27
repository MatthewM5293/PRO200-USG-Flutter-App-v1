import 'package:flutter/material.dart';
import 'package:usg_mobile/Pages/Initiatives.dart';
import 'package:usg_mobile/Pages/TestingMainPage.dart';
import 'package:usg_mobile/Pages/Initiatives.dart';

class InitiativePage extends StatefulWidget {
  const InitiativePage({super.key});

  @override
  State<StatefulWidget> createState() => _InitPage();

}

  class _InitPage extends State<InitiativePage>{

    late String title = Initiatives.initiatives[AllPage.initOpen].title;

    late String desc = Initiatives.initiatives[AllPage.initOpen].description;

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
          child: Image.asset('assets/images/Neumont_logo.png'),
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 90.0, 0.0),
        ),

      ),

      //your stuff

      body: Center(

        child: Column(

          children: [

            const Padding(padding: EdgeInsets.all(2.0)),

            Text(title), //initiative title

            Text(desc), //description box

            Row(

              children: [

                TextButton(

                  onPressed: (){

                    Initiatives.initiatives[AllPage.initOpen].addSigs("doge");

                    Initiatives.initiatives[AllPage.initOpen].printSigs();

                  },

                  child: const Text('Sign Initiative'),

                ),

                TextButton(

                  onPressed: (){

                    Initiatives.initiatives[AllPage.initOpen].removeSig("doge");

                    Initiatives.initiatives[AllPage.initOpen].printSigs();

                  },

                  child: const Text('Undo Signature'),

                ),

              ],

            ),

            TextButton( //Will go back to main

              onPressed: (){Navigator.pop(context);},

              child: const Text('Go Back'),

            ),

          ],

        ),

      ),

    );

  }

}

//body: ,
