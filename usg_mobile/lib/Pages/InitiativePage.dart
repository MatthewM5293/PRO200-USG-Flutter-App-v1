import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:usg_mobile/backend/initiatives_record.dart';

class InitiativePage extends StatelessWidget {


  InitiativePage({super.key, required this.id});

  final int id;

  late String title;

  late String description;

  late String initiativeOwner;

  late List<String>? signatures;

  late DateTime createDate;

  Future<InitiativeRecord?> getSelf(int id) async{
    final ref = InitiativeRecord.collection.doc(id.toString()).withConverter(fromFirestore: InitiativeRecord.fromFirestore, toFirestore: (InitiativeRecord initiative, _) => initiative.toFirestore());
    final docSnap = await ref.get();
    final initiative = docSnap.data();

    if(initiative != null){
      return initiative;
    }
    else{
      return null;
    }
  }

  Future<void> createSelf() async{
    InitiativeRecord? self = await getSelf(id);

    if(self != null){
      title = self.title!;
      description = self.description!;
      initiativeOwner = self.initiative_owner!;
      signatures = self.signatures;
      createDate = self.createDate!;
    }

  }

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

      //your stuff

      body: Center(

        child: Column(

          children: [

            const Padding(padding: EdgeInsets.all(2.0)),

            Text(title), //initiative title

            Text(description), //description box

            Row(

              children: [

                TextButton(

                  onPressed: (){
                    signatures?.add(FirebaseAuth.instance.currentUser!.displayName!);
                  },

                  child: const Text('Sign Initiative'),

                ),

                TextButton(

                  onPressed: (){

                    signatures?.removeWhere((element) => element == FirebaseAuth.instance.currentUser!.displayName!);

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
