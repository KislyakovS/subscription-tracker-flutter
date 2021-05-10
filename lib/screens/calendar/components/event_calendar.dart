import 'package:flutter/material.dart';
import 'package:subscription_tracker/models/subscription.dart';
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
  ];

  List<Subscription> _selectedSubscription = [];

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    //_selectedSubscription = [];
    //_selectedSubscription = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void __onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
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

  List<Subscription> _eventLoader(DateTime date) {
    return listData.where((element) => isSameDay(date, element.date)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrapper(
          child: TableCalendar<Subscription>(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(widget.selectedDay, day),
            onDaySelected: widget.onDaySelected,
            eventLoader: _eventLoader,
          ),
        ),
        Column(
          children: _selectedSubscription.map((e) => Text(e.title)).toList(),
        )
      ],
    );
  }
}
