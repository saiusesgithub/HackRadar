import 'package:flutter/material.dart';
import 'package:hackradar/screens/live_hackathons_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        automaticallyImplyLeading: false,
        title: Text("HackRadar"),
      ),
      body: LiveHackathonsPage(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            _selectedIndex == 0
                ? Icons.play_circle_fill
                : Icons.play_circle_outline,
          ),
          label: "Live",
        ),
        BottomNavigationBarItem(
          icon: Icon(_selectedIndex == 1 ? Icons.calendar_today : Icons.event),
          label: "Upcoming",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            _selectedIndex == 2 ? Icons.settings : Icons.settings_outlined,
          ),
          label: "Settings",
        ),
      ],
      currentIndex: _selectedIndex,
      iconSize: 22,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
    );
  }
}
