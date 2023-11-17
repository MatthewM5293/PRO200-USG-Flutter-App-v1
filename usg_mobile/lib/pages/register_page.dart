import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:usg_mobile/main.dart';
import 'package:usg_mobile/reusable_widgets/reusable_widget.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();

  //controllers here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: reusableTextField(
                      "Email", Icons.mail, false, _emailTextController),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: reusableTextField("Password", Icons.lock_outline, true,
                      _passwordTextController),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: reusableTextField("Confirm Password", Icons.lock, true,
                      _passwordTextController),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 20, 0, 0),
                  child: signInSignUpButton(context, false, () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      if (kDebugMode) {
                        print("Account created");
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage(title: 'Flutter Demo Home Page')));
                    }).onError((error, stackTrace) {
                      if (kDebugMode) {
                        print("Error ${error.toString()}");
                      }
                    });
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
