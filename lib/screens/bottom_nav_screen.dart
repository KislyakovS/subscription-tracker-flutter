import 'package:flutter/material.dart';
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
    SuspendedSubscriptionsScreen(),
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
        backgroundColor: Colors.grey[100],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        items: [
          Icons.home_filled,
          Icons.bar_chart,
          Icons.add,
          Icons.stop_circle_outlined,
          Icons.settings
        ]
            .map((value) =>
                BottomNavigationBarItem(label: '', icon: Icon(value)))
            .toList(),
      ),
    );
  }
}
