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

  Map<String, dynamic> toFirestore({
    String? initiative_owner,
    String? title,
    String? description,
    List<String>? signatures,
    DateTime? createDate,
  }) {
    return {
      if (initiative_owner != null) "initiative_owner": initiative_owner,
      if (title != null) "title": title,
      if (description != null) "description": description,
      "createDate": createDate ?? DateTime.now(),
      "signatures": signatures,
    };
  }

  //get collection
  static CollectionReference get collection => db.collection('Initiatives');

  Future<void> createNewInitiative({
    String? initiative_owner,
    String? title,
    String? description,
    List<String>? signatures,
  }) async {
    await InitiativeRecord.collection.add(
      InitiativeRecord().toFirestore(
        initiative_owner: initiative_owner,
        title: title,
        description: description,
        signatures: signatures,
      ),
    );
  }

  Future<InitiativeRecord?> getSelf(DateTime timestamp) async {
    final querySnapshot = await InitiativeRecord.collection
        .where('createDate', isEqualTo: timestamp)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final DocumentSnapshot<Map<String, dynamic>> docSnapshot =
          querySnapshot.docs.first as DocumentSnapshot<Map<String, dynamic>>;
      return InitiativeRecord.fromFirestore(docSnapshot, null);
    } else {
      return null;
    }
  }
}
