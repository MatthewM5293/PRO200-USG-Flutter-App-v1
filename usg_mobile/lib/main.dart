import 'package:flutter/material.dart';
import 'package:usg_mobile/pages/votePage.dart';
import 'package:usg_mobile/pages/votedPage.dart';


void main() { runApp(const MyApp()); }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'usg moblie',
      debugShowCheckedModeBanner: true, //set to false when debug is over :)
      home: votedPage()
    );
  }
}


