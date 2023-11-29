import 'package:flutter/material.dart';
import 'package:usg_mobile/Pages/Initiatives.dart';
import 'package:usg_mobile/pages/login_page.dart';
import 'package:usg_mobile/reusable_widgets/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateInitPage extends StatefulWidget {
  const CreateInitPage({super.key});

  @override
  State<StatefulWidget> createState() => _CreateInitPage();
}

class _CreateInitPage extends State<CreateInitPage> {
  String title = "";
  String desc = "";

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  dispose() {
    titleController.text = '';
    descController.text = '';
    super.dispose();
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
        body: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                      child: reusableInputField(
                          "Title", Icons.text_fields, titleController)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                    child: reusableInputField(
                        "Description", Icons.text_fields, descController),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                reusableButton(context, "Back", () {
                  Navigator.pop(context);
                }, 0, 0, 0, 0),
                reusableButton(context, "Create Initiative", () {
                  title = titleController.text;
                  desc = descController.text;
                  FirebaseAuth.instance.authStateChanges().listen((User? user) {
                    if (user != null) {
                      Initiatives.createInit(
                        title,
                        desc,
                        user.email.toString(),
                      );
                      Navigator.pop(context);
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginWidget()));
                    }
                  });

                  //clears text fields
                  titleController.text = '';
                  descController.text = '';
                }, 0, 0, 0, 0)
              ],
            ),
          ],
        ));
  }
}

//body: ,
