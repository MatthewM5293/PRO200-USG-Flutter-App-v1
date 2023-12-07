import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class InitiativeRecord {
  String? initiative_owner;
  String? title;
  String? description;
  DateTime? createDate;
  List<String>? signatures;

  InitiativeRecord(
      {this.initiative_owner,
      this.title,
      this.description,
      this.createDate,
      this.signatures});

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
      {String? initiative_owner,
      String? title,
      String? description,
      List<String>? signatures}) {
    return {
      if (initiative_owner != null) "initiative_owner": initiative_owner,
      if (title != null) "title": title,
      if (description != null) "description": description,
      "createDate": DateTime.now(),
      "signatures": signatures,
    };
  }

  //get collection
  static CollectionReference get collection => db.collection('Initiatives');

  // Future<List<InitiativeRecord>> getAllCollections() async {
  //   QuerySnapshot collections = await db.collectionGroup('Initiatives').get();
  //
  //   return collections as List<InitiativeRecord>;
  // }

  Future<List<InitiativeRecord>> getAllInitiatives() async {
    final snapShot = await db.collection("Initiatives").get();
    final initData = snapShot.docs
        .map((e) => InitiativeRecord.fromFirestore(e, null))
        .toList();
    return initData;
  }
}
