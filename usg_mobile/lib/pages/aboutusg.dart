import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUsg extends StatelessWidget {
  const AboutUsg();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("About USG"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: [
                  const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0)),
                  Image.asset(
                    'assets/images/NeumontLogo.png',
                    height: 100,
                    width: 100,
                  )
                ]),
                const Column(
                  children: [
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0)),
                    Text(
                      "USG",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            )),
            Container(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsetsDirectional.fromSTEB(10, 100, 10, 10)),
                  Expanded(
                      child: Text(
                          '   USG, or Unified Student Government is what brings a voice to the student body, and '
                          'this app is meant to help streamline the connection between us and you.')
                  ),
                  Padding(padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10)),
                ],
              ),
            ),Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0)),
                  Image.asset('assets/images/DiscordQRCode.png',height: 100,width: 100),
                  Padding(padding:EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0))
                ],
              ),
            )
          ],
        ),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Row(
        //       children: [
        //         Column(
        //           children: [
        //             const Padding(
        //                 padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0)),
        //             Image.asset('assets/images/NeumontLogo.png',
        //                 height: 100, width: 100),
        //           ],
        //         ),
        //         const Column(
        //           children: [
        //             Padding(
        //                 padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0)),
        //             Text(
        //               "USG",
        //               style:
        //                   TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        //             )
        //           ],
        //         ),
        //       ],
        //     ),
        //     const Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Column(children: [
        //           Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0)),
        //           Text(
        //             'Testing',
        //             textAlign: TextAlign.center,
        //           )
        //         ])
        //       ],
        //     )
        //   ],
        // ),
      ),
    );
  }
}
