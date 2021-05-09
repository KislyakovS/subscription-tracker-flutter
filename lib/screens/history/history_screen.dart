import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:subscription_tracker/config/constants.dart';
import 'package:subscription_tracker/screens/home/data/nearest_sub.dart';
import 'package:subscription_tracker/widgets/widgets.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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

  final listWidgets = nearestSubs
      .map(
        (subscription) => SubscriptionItem(subscription: subscription),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: _elevation,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Payment history',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        controller: _controller,
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: listWidgets,
        ),
      ),
    );
  }
}
