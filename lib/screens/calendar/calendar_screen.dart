import 'package:flutter/material.dart';
import 'package:subscription_tracker/config/constants.dart';
import 'package:subscription_tracker/models/subscription.dart';
import 'package:subscription_tracker/screens/calendar/components/event_calendar.dart';
import 'package:subscription_tracker/screens/calendar/components/subscriptions.dart';
import 'package:subscription_tracker/screens/calendar/data/data.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<Subscription> _selectedSubscription = [];
  DateTime _selectedDay = DateTime.now();

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _selectedSubscription = calendarData
            .where((element) => isSameDay(selectedDay, element.date))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Calendar',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              EventCalendare(
                onDaySelected: _onDaySelected,
                selectedDay: _selectedDay,
              ),
              const SizedBox(height: defaultPadding),
              Subscriptions(subscriptions: _selectedSubscription),
            ],
          ),
        ),
      ),
    );
  }
}
