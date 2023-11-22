import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUsg extends StatelessWidget {
  const AboutUsg();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text("About USG"),
      ), body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    const Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0)),
                    Image.asset('assets/images/NeumontLogo.png', height: 100, width: 100),
                  ],
                ),
                const Column(
                  children: [
                    Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 25, 50, 0)),
                    Text("USG",style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

