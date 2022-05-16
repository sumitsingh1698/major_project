import 'package:flutter/material.dart';
import 'package:major_project/code/api/sanketapi.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _symtomesList = [];
  List _selectedSymtomes = [];
  bool isLoading = false;
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    _symtomesList = await SanketApi().getListofSymtoms();
    print(_symtomesList.length);
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
        backgroundColor: Colors.green,
        body: isLoading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: _symtomesList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CheckboxListTile(
                          value:
                              _selectedSymtomes.contains(_symtomesList[index]),
                          onChanged: (bool? selected) {
                            _onCategorySelected(selected, _symtomesList[index]);
                            print("hello $selected");
                          },
                          title: Text(
                            "${_symtomesList[index]}",
                            style: TextStyle(color: Colors.amberAccent),
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        print(_selectedSymtomes);
                        var res = await SanketApi()
                            .getDiseaseBySymtoms(_selectedSymtomes);
                        print(res);
                      },
                      child: Text("find"))
                ],
              ));
  }
}
