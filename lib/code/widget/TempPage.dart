import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project/code/MyHomePage.dart';

class TempPage extends StatelessWidget {
  const TempPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 5000), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MyHomePage()),
          (context) => false);
    });
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Container()),
                Center(
                  child: Text(
                    "SANKET",
                    style: GoogleFonts.dmSerifDisplay(fontSize: 50),
                  ),
                ),
                Text("New Way of Knowing"),
                SizedBox(
                  height: 5,
                ),
                Text("Which Disease"),
                SizedBox(
                  height: 5,
                ),
                Text("You are Suffering from"),
                SizedBox(height: 40),
                CircularProgressIndicator(
                  color: Colors.black,
                ),
                Expanded(
                  child: Container(),
                ),
                Text("copyright @sanketteam")
              ]),
        ),
      ),
    );
  }
}
