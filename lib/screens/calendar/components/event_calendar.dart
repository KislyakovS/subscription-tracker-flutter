import 'package:flutter/material.dart';
import 'package:subscription_tracker/models/subscription.dart';
import 'package:subscription_tracker/screens/calendar/data/data.dart';
import 'package:subscription_tracker/widgets/wrapper.dart';
import 'package:table_calendar/table_calendar.dart';

class EventCalendare extends StatefulWidget {
  final DateTime? selectedDay;
  final void Function(DateTime selectedDay, DateTime focusedDay) onDaySelected;

  const EventCalendare(
      {Key? key, required this.onDaySelected, this.selectedDay})
      : super(key: key);

  @override
  _EventCalendareState createState() => _EventCalendareState();
}

class _EventCalendareState extends State<EventCalendare> {
  final DateTime _focusedDay = DateTime.now();

  List<Subscription> _eventLoader(DateTime date) {
    return calendarData
        .where((element) => isSameDay(date, element.date))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: TableCalendar<Subscription>(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(widget.selectedDay, day),
        onDaySelected: widget.onDaySelected,
        eventLoader: _eventLoader,
      ),
    );
  }
}
