import 'package:flutter/material.dart';
import 'package:subscription_tracker/config/palette.dart';
import 'package:subscription_tracker/screens/screens.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List<Widget> _screens = [
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
        // backgroundColor: _currentIndex == 3 ? Colors.white : Palette.background,
        backgroundColor: Palette.background,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        items: [
          const Icon(Icons.home_filled),
          const Icon(Icons.bar_chart),
          const Icon(Icons.add),
          const Icon(
            Icons.calendar_today_rounded,
            size: 22,
          ),
          const Icon(Icons.settings)
        ]
            .map(
              (icon) => BottomNavigationBarItem(
                label: '',
                icon: icon,
              ),
            )
            .toList(),
      ),
    );
  }
}
