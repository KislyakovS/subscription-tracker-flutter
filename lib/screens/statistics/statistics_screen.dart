import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:subscription_tracker/config/constants.dart';
import 'package:subscription_tracker/screens/history/history_screen.dart';
import 'package:subscription_tracker/screens/home/data/nearest_sub.dart';
import 'package:subscription_tracker/widgets/chart.dart';
import 'package:subscription_tracker/widgets/list_subscripiton.dart';
import 'package:subscription_tracker/widgets/widgets.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  int _indexSliding = 0;
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

  void _onChangeSliding(int? index) {
    setState(() {
      _indexSliding = index ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: _elevation,
        centerTitle: false,
        title: const Text(
          'Your statistics',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        controller: _controller,
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            _Sliding(index: _indexSliding, onChange: _onChangeSliding),
            const SizedBox(height: defaultPadding),
            _Info(),
            const SizedBox(height: defaultPadding),
            _Chart(),
            const SizedBox(height: defaultPadding),
            _History(),
          ],
        ),
      ),
    );
  }
}

class _Sliding extends StatelessWidget {
  final int index;
  final void Function(int? index) onChange;

  const _Sliding({
    Key? key,
    required this.index,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoSlidingSegmentedControl<int>(
        children: {
          0: const Text('All'),
          1: const Text('For 3 months'),
          2: const Text('For 6 months'),
        },
        groupValue: index,
        onValueChanged: onChange,
      ),
    );
  }
}

class Info {
  final String label;
  final String value;

  Info({required this.label, required this.value});
}

class _Info extends StatelessWidget {
  final List<Info> _list = [
    Info(label: 'All subscriptions', value: '7'),
    Info(label: 'Total', value: '\$ 499'),
    Info(label: 'Most expensive \'Netflix\'', value: '\$ 12.99')
  ];

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Column(
        children: _list
            .asMap()
            .entries
            .map((item) => _row(item.value, item.key != _list.length - 1))
            .toList(),
      ),
    );
  }

  Widget _row(Info info, bool isDivider) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              info.label,
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              info.value,
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
        if (isDivider) Divider(color: Colors.grey.shade400)
      ],
    );
  }
}

class _Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Container(
        height: 250,
        child: Chart(),
      ),
    );
  }
}

class _History extends StatelessWidget {
  void onTapTitle(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<Widget>(
            builder: (BuildContext contetext) => HistoryScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      title: GestureDetector(
        onTap: () => onTapTitle(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Payment history',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.chevron_right)
          ],
        ),
      ),
      child: ListSubscription(subscriptions: nearestSubs),
    );
  }
}
