import 'package:flutter/material.dart';
import 'package:usg_mobile/Pages/Initiatives.dart';

class CreateVoterPage extends StatefulWidget {
  const CreateVoterPage({super.key});

  @override
  State<StatefulWidget> createState() => _CreateVoterPage();

}

class _CreateVoterPage extends State<CreateVoterPage>{

  static

  final TextEditingController titleController = TextEditingController();

  final TextEditingController descController = TextEditingController();

  @override dispose(){

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
              color: Colors.yellow.shade600,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.black26,
        centerTitle: true,
        flexibleSpace: Container(
          child: Image.asset('assets/images/Neumont_logo.png'),
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 90.0, 0.0),
        ),

      ),

      //your stuff

      body: Center(

        child: Column(

          children: [

            const Padding(padding: EdgeInsets.all(2.0)),

            TextFormField(

              controller: titleController,

            ), //initiative title

            TextFormField(

              controller: descController,

              minLines: 1,

              maxLines: 80,

            ), //description

            Row(

              children: [

                TextButton(

                  onPressed: () {

                    //title = titleController.text;

                    //desc = descController.text;

                    //Initiatives.createInit(title, desc, 'temp data User');

                    titleController.text = '';

                    descController.text = '';

                  },

                  child: const Text('Create Initiative'),

                ),

              ],

            ),

            TextButton( //Will go back to main

              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text('Go Back'),

            ),

          ],

        ),

      ),

    );
  }

}

//body: ,
