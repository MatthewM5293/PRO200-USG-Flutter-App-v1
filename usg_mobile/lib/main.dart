
import 'package:flutter/material.dart';
import 'package:usg_mobile/pages/CreateInitPage.dart';
//import 'package:usg_mobile/Pages/Initiatives.dart';

void main() { runApp(const MyApp()); }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'usg moblie',
      debugShowCheckedModeBanner: false, //set to false when debug is over :)
      home: const CreateInitPage()
    );
  }
}


