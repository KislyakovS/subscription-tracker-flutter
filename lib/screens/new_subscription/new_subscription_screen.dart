import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription_tracker/config/constants.dart';
import 'package:subscription_tracker/screens/form_subscription/form_subscription_screen.dart';
import 'package:subscription_tracker/screens/new_subscription/data/subscriptions.dart';
import 'package:subscription_tracker/widgets/widgets.dart';

import 'components/subscription_item_add.dart';

class NewSubscriptionScreen extends StatefulWidget {
  @override
  _NewSubscriptionScreenState createState() => _NewSubscriptionScreenState();
}

class _NewSubscriptionScreenState extends State<NewSubscriptionScreen> {
  bool _isSearch = false;
  double _height = 0;
  final double targetElevation = 3;
  double _elevation = 0;
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    double newElevation = _controller.offset > 1 ? targetElevation : 0;
    if (_elevation != newElevation) {
      setState(() {
        _elevation = newElevation;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_scrollListener);
    _controller.dispose();
  }

  void _pressedButtonSearch() {
    setState(() {
      _isSearch = !_isSearch;
      if (_isSearch) {
        _height = 50;
      } else {
        _height = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: _elevation,
        centerTitle: false,
        title: const Text(
          'New subscription',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 30,
              color: Colors.black,
            ),
            onPressed: _pressedButtonSearch,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: IconButton(
              icon: const Icon(
                Icons.add,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => FormSubscriptionScreen(),
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [Search(height: _height), _List()],
          ),
        ),
      ),
    );
  }
}

class _List extends StatelessWidget {
  final List<Widget> _list = subscriptions
      .map((subscription) => SubscriptionItemAdd(subscription: subscription))
      .toList();

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: _list,
    );
  }
}
