import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription_tracker/config/constants.dart';
import 'package:subscription_tracker/models/subscription.dart';
import 'package:subscription_tracker/screens/screens.dart';
import 'package:subscription_tracker/widgets/list_subscripiton.dart';
import 'package:subscription_tracker/widgets/widgets.dart';

class SubscriptionScreen extends StatefulWidget {
  final Subscription subscription;

  const SubscriptionScreen({Key? key, required this.subscription})
      : super(key: key);

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: _elevation,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          widget.subscription.title,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 1,
                  child: Text('Edit'),
                ),
              ];
            },
            onSelected: (result) {
              if (result == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute<FormSubscriptionScreen>(
                    builder: (BuildContext context) => FormSubscriptionScreen(
                      subscription: widget.subscription,
                    ),
                  ),
                );
              }
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.more_vert),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: _controller,
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            SubscriptionItem(subscription: widget.subscription),
            const SizedBox(height: defaultPadding),
            Wrapper(child: Chart()),
            const SizedBox(height: defaultPadding),
            Wrapper(
              child: ListSubscription(subscriptions: [
                widget.subscription,
                widget.subscription,
                widget.subscription,
                widget.subscription
              ]),
            )
          ],
        ),
      ),
    );
  }
}
