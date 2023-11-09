import 'package:flutter/material.dart';

class votePage extends StatelessWidget {
  const votePage({super.key});

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
          padding: EdgeInsets.fromLTRB(0.0, 20.0, 90.0, 0.0),
        ),
      ),
    );
  }
}

//body: ,
