import 'package:flutter/material.dart';

class votedPage extends StatelessWidget {
  const votedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: body(),
    );
  } //build
}

AppBar appbar() {
  return AppBar(
    title: Text(
      '      USG',
      style:
          TextStyle(color: Colors.yellow.shade600, fontWeight: FontWeight.bold),
    ),
    backgroundColor: Colors.black26,
    centerTitle: true,
    flexibleSpace: Container(
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 60.0, 0.0),
      child: Image.asset('assets/images/Neumont_logo.png'),
    ),
  );
}

Center body() {
  return Center(
    child: Column(
      children: [
        Container(
            color: Colors.green,
            width: 300,
            height: 300,
            margin: EdgeInsets.fromLTRB(20, 40, 20, 5),
            child: Column(children: [
              const Text(
                'Thank You For Voteing',
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 0.0),
                child: Image.asset('assets/images/Neumont_logo.png'),
              )
            ])),
        const Padding(padding: EdgeInsets.all(65.0)),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              alignment: Alignment.centerRight,
              side: const BorderSide(
                width: 2.0,
              ),
              backgroundColor: Colors.white10,
              foregroundColor: Colors.black,
              textStyle: const TextStyle(fontSize: 20)),
          onPressed: () {
            //Code for Yes goes here
            debugPrint('Return');
          },
          child: const Text('Return To Home'),
        ),
      ],
    ),
  );
}
