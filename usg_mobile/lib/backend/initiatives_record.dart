import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class Initiative {
  User? initiative_owner = FirebaseAuth.instance.currentUser;
  final String? title;
  final String? description;
  final List<String>? signatures;

  Initiative({
    this.initiative_owner,
    this.title,
    this.description,
    this.signatures
});

  factory Initiative.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Initiative(
      initiative_owner: data?['initiative_owner'],
      title: data?['title'],
      description: data?['description'],
      signatures: data?['signatures']
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (initiative_owner != null) "initiative_owner": initiative_owner,
      if (title != null) "title": title,
      if (description != null) "description": description,
      "signatures": signatures,
    };
  }


}