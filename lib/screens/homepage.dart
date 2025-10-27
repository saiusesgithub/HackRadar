import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff00ffd5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        title: Text(
          "HackRadar",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(0xff000000),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Live",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Upcoming",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        backgroundColor: Color(0xff000000),
        currentIndex: 0,
        elevation: 10,
        iconSize: 22,
        selectedItemColor: Color(0xff03fcd3),
        unselectedItemColor: Color(0xff9e9e9e),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: (value) {},
      ),
    );
  }
}