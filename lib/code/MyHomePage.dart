import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project/code/api/sanketapi.dart';
import 'package:major_project/code/entity/ResultEntity.dart';
import 'package:major_project/code/widget/ResultPage.dart';
import 'package:major_project/code/widget/SymptomsPage.dart';
import 'package:major_project/code/widget/TempPage.dart';

import 'widget/AboutUs.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Widget> _pages = <Widget>[SymptomsPage(), AboutUs()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void setResultAndGettoResultPage(ResultEntity? resData) {
    _onItemTapped(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            _selectedIndex == 0 ? "Symptoms" : "About Us",
            style: GoogleFonts.dmSerifDisplay(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black87,
          selectedItemColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.masks),
              label: 'Disease',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.verified_user_outlined),
              label: 'About Us',
            ),
          ],
          currentIndex: _selectedIndex, //New
          onTap: _onItemTapped,
        ),
        body: _pages[_selectedIndex]);
  }
}
