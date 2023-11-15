import 'package:flutter/material.dart';

List<Widget> announcementList = <Widget>[];

void main() {
  runApp(const StartPage());
}

class StartPage extends StatelessWidget{
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "whiteMountainView"),
        home: TestPage()
    );
  }
}

class TestPage extends StatefulWidget {
  TestPage({super.key});

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String data = '';
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hello World!",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
        body: Column(
          children: [
            TextField(
              controller: myController,
            ),
            TextButton(
                onPressed: () {
                  data = myController.text;
                  debugPrint(data);
                },
                child: Text('Text Button')
            )
          ]
        )
    );
  }
}
