import 'package:flutter/material.dart';

import '../api/sanketapi.dart';
import '../entity/ResultEntity.dart';
import 'ResultPage.dart';

class SymptomsPage extends StatefulWidget {
  @override
  _SymptomsPageState createState() => _SymptomsPageState();
}

class _SymptomsPageState extends State<SymptomsPage> {
  var _symtomesList = [];
  List _selectedSymtomes = [];
  bool isLoading = true;

  @override
  void initState() {
    // isLoading = _selectedSymtomes.length != 0;
    getInit();
    super.initState();
  }

  getInit() async {
    print(_symtomesList.length);
    _symtomesList = await SanketApi().getListofSymtoms();
    setState(() {
      isLoading = false;
    });
  }

  void _onCategorySelected(bool? selected, String value) {
    if (selected == null) return;
    if (selected == true) {
      setState(() {
        _selectedSymtomes.add(value);
      });
    } else {
      setState(() {
        _selectedSymtomes.remove(value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
            height: 60.0,
            width: 60.0,
            child: FittedBox(
                child: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () async {
                print(_selectedSymtomes);

                ResultEntity? res =
                    await SanketApi().getDiseaseBySymtoms(_selectedSymtomes);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ResultPage(res)));
              },
              child: Container(
                  padding: EdgeInsets.only(left: 3), child: Icon(Icons.send)),
            ))),
        body: isLoading
            ? Center(
                child: Container(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                )),
              )
            : Container(
                color: Colors.grey[100],
                child: Column(
                  children: [
                    if (_selectedSymtomes.length != 0)
                      ExpansionTile(
                          collapsedIconColor: Colors.black,
                          collapsedTextColor: Colors.black,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "Selected Symptoms (${_selectedSymtomes.length})"),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectedSymtomes = [];
                                    });
                                  },
                                  child: Text("Clear All"))
                            ],
                          ),
                          children: [
                            for (String str in _selectedSymtomes)
                              ListTile(
                                title: Row(
                                  children: [
                                    Text("${formateValue(str)}"),
                                  ],
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _onCategorySelected(false, str);
                                      });
                                    },
                                    icon: Icon(Icons.close)),
                              ),
                          ]),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _symtomesList.length,
                        itemBuilder: (BuildContext context, int index) {
                          bool thisItemisSelected =
                              _selectedSymtomes.contains(_symtomesList[index]);
                          return CheckboxListTile(
                            value: thisItemisSelected,
                            onChanged: (bool? selected) {
                              _onCategorySelected(
                                  selected, _symtomesList[index]);
                            },
                            activeColor: Colors.black,
                            title: Text(
                              "${formateValue(_symtomesList[index])}",
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ));
  }

  String formateValue(String str) {
    List<String> strs = str.split("_");
    String result = "";
    for (String str in strs) {
      result += (str[0].toUpperCase()) + str.substring(1) + " ";
    }
    return result;
  }
}
