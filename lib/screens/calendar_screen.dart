import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:subscription_tracker/widgets/widgets.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Calendar',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ...List.generate(10, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: VerticalCard(),
                    );
                  }).toList()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
