import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:usg_mobile/backend/initiatives_record.dart';
import 'package:intl/intl.dart';
import 'package:usg_mobile/reusable_widgets/reusable_widget.dart';

class InitiativePage extends StatefulWidget {
  final DocumentReference initiativeRef;

  InitiativePage({required this.initiativeRef});

  @override
  _InitiativePageState createState() => _InitiativePageState();
}

class _InitiativePageState extends State<InitiativePage> {
  late Future<InitiativeRecord?> initiativeFuture;

  @override
  void initState() {
    super.initState();
    initiativeFuture = getInitiative();
  }

  Future<InitiativeRecord?> getInitiative() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> docSnapshot =
          await widget.initiativeRef.get()
              as DocumentSnapshot<Map<String, dynamic>>;
      return docSnapshot.data() != null
          ? InitiativeRecord.fromFirestore(docSnapshot, null)
          : null;
    } catch (e) {
      print("Error getting initiative: $e");
      return null;
    }
  }

  String? _formatRelativeTime(DateTime? dateTime) {
    if (dateTime == null) return null;

    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} days ago';
    } else {
      return DateFormat.yMMMMd().format(dateTime);
    }
  }

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
      body: FutureBuilder<InitiativeRecord?>(
        future: initiativeFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == null) {
            if (kDebugMode) {
              print("InitiativeRef Path: ${widget.initiativeRef.path}");
            }
            return const Center(child: Text('Initiative not found'));
          } else {
            InitiativeRecord initiative = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableCard(context, initiative.title ?? 'No Title', initiative.description ?? 'No Description', 'Created by: ${initiative.initiative_owner ?? 'Unknown'}', 'Created: ${_formatRelativeTime(initiative.createDate) ?? 'Unknown'}'),
                   Text(
                     'Total signatures: ${initiative.signatures?.length.toString() ?? '0'}',
                     style: const TextStyle(
                         fontSize: 20, fontWeight: FontWeight.bold),
                   ),
                  // Text(
                  //   initiative.title ?? 'No Title',
                  //   style: const TextStyle(
                  //       fontSize: 20, fontWeight: FontWeight.bold),
                  // ),
                  // const SizedBox(height: 10),
                  // Text(initiative.description ?? 'No Description'),
                  // const SizedBox(height: 10),
                  // Text(
                  //     'Created by: ${initiative.initiative_owner ?? 'Unknown'}'),
                  // const SizedBox(height: 10),
                  // Text(
                  //     'Created: ${_formatRelativeTime(initiative.createDate) ?? 'Unknown'}'),
                  // const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // reusableButton(context, "Back", () {
                      //   Navigator.pop(context);
                      // }, 0, 0, 0, 0),
                      reusableButtonWithChild(context, () async {
                        String displayName =
                            FirebaseAuth.instance.currentUser!.email!;

                        if (initiative.signatures?.contains(displayName) ??
                            false) {
                          // User is already signed, remove the signature
                          await initiative.removeSignature(
                              widget.initiativeRef, displayName);
                        } else {
                          // User is not signed, add the signature
                          await initiative.addSignature(
                              widget.initiativeRef, displayName);
                        }

                        // Fetch the updated initiative data and trigger a UI rebuild
                        setState(() {
                          initiativeFuture = getInitiative();
                        });
                      },
                          0,
                          0,
                          0,
                          0,
                          FutureBuilder<InitiativeRecord?>(
                            future: getInitiative(),
                            // Assuming getInitiative fetches the updated data
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                String displayName =
                                    FirebaseAuth.instance.currentUser!.email!;
                                InitiativeRecord updatedInitiative =
                                    snapshot.data!;
                                return updatedInitiative.signatures != null
                                    ? updatedInitiative.signatures!
                                            .contains(displayName)
                                        ? const Text('Unsign Initiative')
                                        : const Text('Sign Initiative')
                                    : const Text(
                                        'Loading...'); // Handle the case where signatures is null
                              }
                            },
                          )),
                    ],
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
