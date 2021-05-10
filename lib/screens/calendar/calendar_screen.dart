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

  final double targetElevation = 3;
  double _elevation = 0;
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_scrollListener);
    _controller.dispose();
  }

  void _scrollListener() {
    double newElevation = _controller.offset > 1 ? targetElevation : 0;
    if (_elevation != newElevation) {
      setState(() {
        _elevation = newElevation;
      });
    }
  }

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
        elevation: _elevation,
        centerTitle: false,
        title: const Text(
          'Calendar',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        controller: _controller,
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
    );
  }
}
