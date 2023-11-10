import 'package:flutter/material.dart';

class votePage extends StatelessWidget {
  const votePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: appBar(),

      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.grey,
              width: 300,
              height: 400,
              margin: EdgeInsets.fromLTRB(20, 40, 20, 5),
              child: Column(
                children: [
                  const TextField( maxLines: 1,),
                ],
              )
            ),
            const Padding(padding: EdgeInsets.all(2.0)),



                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                  alignment: Alignment.centerRight,

                    side: BorderSide(
                      width: 2.0,
                    ),
                    backgroundColor: Colors.white10,
                    foregroundColor: Colors.black,
                      textStyle: const TextStyle(fontSize: 20)
                  ),
                  onPressed: () {
                    //Code for Yes goes here
                    debugPrint('Received click');

                  },
                  child: const Text('Submit Votes'),
                ),

          ],
        ),
      ),

    );
  } //build

  AppBar appBar() {
    return AppBar(
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
    );
  }


} //class
