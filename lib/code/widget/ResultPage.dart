import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project/code/entity/ResultEntity.dart';

class ResultPage extends StatefulWidget {
  final ResultEntity? res;
  ResultPage(this.res);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    String ans = "";
    bool ansNotExist = widget.res!.predication <= 20;
    if (!ansNotExist && widget.res?.desease != null) {
      for (dynamic str in widget.res!.desease) ans += str.toString() + " ";
    }
    if (ansNotExist) {
      ans = "No Disease Found for these Symptoms in our Records.";
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Chance of Disease",
            style: GoogleFonts.dmSerifDisplay(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: widget.res?.desease.length == 0
                ? Center(
                    child: Text("No Data Found"),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!ansNotExist)
                        Text(
                            "percentage of accuracy is ${widget.res!.predication}%."),
                      Expanded(
                        child: Center(
                          child: Text(
                              ansNotExist
                                  ? ans
                                  : "Possible Disease ${widget.res!.desease.length == 1 ? "is" : "are"} $ans.",
                              style: GoogleFonts.dmSerifDisplay(fontSize: 30)),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("DISCLAIMER",
                                  style:
                                      GoogleFonts.dmSerifDisplay(fontSize: 25)),
                              Text(
                                  "This predication of disease on our app shall not be correct totally 100%. We strongly recommond you to consult a doctor before starting treatment. This app is just for helping purpose which predict disease based on symptoms.",
                                  style:
                                      GoogleFonts.dmSerifDisplay(fontSize: 20)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
      ),
    );
  }
}
