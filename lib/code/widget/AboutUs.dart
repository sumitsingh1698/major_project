import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Container()),
                Center(
                  child: Text(
                    "SANKET",
                    style: GoogleFonts.dmSerifDisplay(fontSize: 50),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(50),
                  child: Center(
                    child: Text(
                        "Our App is to help people to know disease before visiting Hospital."),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text("Team Member"),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Text("Sumit kumar, Worked on Frontend of this App")),
                SizedBox(
                  height: 5,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child:
                        Text("Manish Parsad, Worked on Backend of this App")),
                SizedBox(height: 40),
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
