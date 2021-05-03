import 'package:flutter/material.dart';
import 'package:subscription_tracker/config/palette.dart';
import 'package:subscription_tracker/screens/screens.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    HomeScreen(),
    StatisticsScreen(),
    NewSubscriptionScreen(),
    CalendarScreen(),
    SettingsScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: Palette.background,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        items: [
          Icon(Icons.home_filled),
          Icon(Icons.bar_chart),
          Icon(Icons.add),
          Icon(
            Icons.calendar_today_rounded,
            size: 22,
          ),
          Icon(Icons.settings)
        ]
            .map((icon) => BottomNavigationBarItem(label: '', icon: icon))
            .toList(),
      ),
    );
  }
}
