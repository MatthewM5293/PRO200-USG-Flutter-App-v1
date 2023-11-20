import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Announcement {
  final User? annoucement_owner;
  final String? title;
  final String? description;

  Announcement({
    this.annoucement_owner,
    this.title,
    this.description
  });

  factory Announcement.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,) {
    final data = snapshot.data();
    return Announcement(
        annoucement_owner: data?['annoucement_owner'],
        title: data?['title'],
        description: data?['description']
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (annoucement_owner != null) "annoucement_owner": annoucement_owner,
      if (title != null) "title": title,
      if (description != null) "description": description
    };
  }
}