import 'package:flutter/material.dart';
import 'package:subscription_tracker/config/constants.dart';
import 'package:subscription_tracker/models/subscription.dart';
import 'package:subscription_tracker/screens/calendar/components/event_calendar.dart';
import 'package:subscription_tracker/screens/calendar/components/subscriptions.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final listData = [
    Subscription(
      title: 'Apple Music',
      image:
          'https://pbs.twimg.com/profile_images/1310656963223584768/hr40_0pb_400x400.png',
      date: DateTime.utc(2021, DateTime.may, 20),
      price: 169,
      currency: '₽',
    ),
    Subscription(
      title: 'Megogo',
      image: 'https://androidshara.ru/wp-content/uploads/2018/10/Megogo.png',
      date: DateTime.utc(2021, DateTime.may, 30),
      price: 799,
      currency: '₽',
    ),
    Subscription(
      title: 'Megogo',
      image: 'https://androidshara.ru/wp-content/uploads/2018/10/Megogo.png',
      date: DateTime.utc(2021, DateTime.may, 30),
      price: 799,
      currency: '₽',
    ),
    Subscription(
      title: 'Megogo',
      image: 'https://androidshara.ru/wp-content/uploads/2018/10/Megogo.png',
      date: DateTime.utc(2021, DateTime.may, 30),
      price: 799,
      currency: '₽',
    ),
    Subscription(
      title: 'Megogo',
      image: 'https://androidshara.ru/wp-content/uploads/2018/10/Megogo.png',
      date: DateTime.utc(2021, DateTime.may, 30),
      price: 799,
      currency: '₽',
    ),
  ];

  List<Subscription> _selectedSubscription = [];
  // DateTime _focusedDay = DateTime.now();
  // DateTime? _selectedDay;

  DateTime _selectedDay = DateTime.now();

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        //_focusedDay = focusedDay;
        // _rangeStart = null; // Important to clean those
        // _rangeEnd = null;
        // _rangeSelectionMode = RangeSelectionMode.toggledOff;
        _selectedSubscription = listData
            .where((element) => isSameDay(selectedDay, element.date))
            .toList();
      });
      //_selectedEvents.value = _getEventsForDay(selectedDay);
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
