

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AboutUsg extends StatelessWidget
{
  const AboutUsg();
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("USG"),
      ),body: Center(
        child:Row(
          children: [
            Image.asset('assets/images/NeumontLogo.png',height: 100,width: 100),
            Text("USG")
          ],
        ),
    ),
    );
  }
}

