import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class InitiativeRecord {
  String? initiative_owner;
  String? title;
  String? description;
  List<String>? signatures;
  DateTime? createDate;

  InitiativeRecord(
      {this.initiative_owner, this.title, this.description, this.signatures, this.createDate});

  factory InitiativeRecord.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return InitiativeRecord(
        initiative_owner: data?['initiative_owner'],
        title: data?['title'],
        description: data?['description'],
        createDate: data?['createDate'],
        signatures: data?['signatures']);
  }

  Map<String, dynamic> toFirestore(
       {
     String? initiative_owner,
     String? title,
     String? description,
     List<String>? signatures
  }
  ) {
    return {
      if (initiative_owner != null) "initiative_owner": initiative_owner,
      if (title != null) "title": title,
      if (description != null) "description": description,
      "createDate" : DateTime.now(),
      "signatures": signatures,
    };
  }

  //get collection
  static CollectionReference get collection => db.collection('Initiatives');

}


