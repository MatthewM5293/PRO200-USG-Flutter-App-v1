import 'package:flutter/material.dart';

class votePage extends StatelessWidget {
  const votePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '      USG',
          style: TextStyle(
              color: Colors.yellow.shade600,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.black26,
        centerTitle: true,
        flexibleSpace: Container(
          child: Image.asset('assets/images/Neumont_logo.png'),
          padding: EdgeInsets.fromLTRB(0.0, 20.0, 60.0, 0.0),
        ),
      ),

      //your stuff

      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(2.0)),
            const TextField( //is the text box?
              maxLines: 12,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    //Code for Yes goes here
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    //Code for no here
                  },
                  child: const Text('No'),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  } //build
} //class
