import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:relative_time/relative_time.dart';
import 'package:usg_mobile/pages/login_page.dart';

TextFormField reusableTextField(String labelText, IconData iconData,
    bool isPasswordType, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.amber,
    decoration: InputDecoration(
      prefixIcon: Icon(
        iconData,
        color: Colors.amber,
      ),
      labelText: labelText,
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

TextFormField reusableInputField(
    String labelText, IconData iconData, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    enableSuggestions: true,
    autocorrect: true,
    cursorColor: Colors.amber,
    decoration: InputDecoration(
      prefixIcon: Icon(
        iconData,
        color: Colors.amber,
      ),
      labelText: labelText,
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: TextInputType.text,
  );
}

Container signInSignUpButton(
    BuildContext context, bool isLogin, Function onClick) {
  return Container(
    alignment: Alignment.centerRight,
    width: 200,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90.0)),
    child: ElevatedButton(
      onPressed: () {
        onClick();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)))),
      child: Text(
        isLogin ? 'Log in' : 'Sign Up',
      ),
    ),
  );
}

Container reusableButton(BuildContext context, String buttonText,
    Function onClick, double L, double T, double R, double B) {
  return Container(
    alignment: Alignment.centerRight,
    width: 200,
    height: 50,
    margin: EdgeInsets.fromLTRB(L, T, R, B),
    // margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90.0)),
    child: ElevatedButton(
      onPressed: () {
        onClick();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black;
            }
            return Colors.black;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)))),
      child: Text(buttonText),
    ),
  );
}

Container reusableButtonWithChild(BuildContext context, Function onClick,
    double L, double T, double R, double B, Widget child) {
  return Container(
    alignment: Alignment.centerRight,
    width: 200,
    height: 50,
    margin: EdgeInsets.fromLTRB(L, T, R, B),
    // margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90.0)),
    child: ElevatedButton(
      onPressed: () {
        onClick();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black;
            }
            return Colors.black;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)))),
      child: child,
    ),
  );
}

//Annoucement
Widget reusableAnnouncement(BuildContext context, String title, String body,
    String owner, Color color, Function? onTapFunc) {
  return Card(
    color: color,
    elevation: 3,
    margin: const EdgeInsets.all(8.0),
    child: ListTile(
      onTap: onTapFunc as void Function()?,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              owner,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              body,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    ),
  );
}

//Card
Widget reusableCard(BuildContext context, String title, String description,
    String name, String date) {
  return Card(
    elevation: 4.0,
    // margin: const EdgeInsets.all(16.0),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            description,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8.0),
          Text(
            name,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8.0),
          Text(
            date,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
  );
}

// class ReusableCard extends StatelessWidget {
//   final String title;
//   final String description;
//   final String name;
//   final String date;
//
//   ReusableCard({
//     required this.title,
//     required this.description,
//     required this.name,
//     required this.date,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4.0,
//       margin: const EdgeInsets.all(16.0),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8.0),
//             Text(
//               description,
//               style: const TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 8.0),
//             Text(
//               name,
//               style: const TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 8.0),
//             Text(
//               date,
//               style: const TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//sign out button?
// Widget singOutButton(BuildContext context) async {
//   FirebaseAuth.instance.signOut().then((value) {
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => const LoginWidget()));
//   });
// }
