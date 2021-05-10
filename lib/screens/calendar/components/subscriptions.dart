import 'package:flutter/material.dart';
import 'package:subscription_tracker/models/subscription.dart';
import 'package:subscription_tracker/widgets/list_subscripiton.dart';
import 'package:subscription_tracker/widgets/widgets.dart';

class Subscriptions extends StatelessWidget {
  final List<Subscription> subscriptions;

  const Subscriptions({Key? key, required this.subscriptions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: subscriptions.isEmpty ? _Empty() : _List(list: subscriptions),
    );
  }
}

class _Empty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'There are no subscriptions.',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class _List extends StatelessWidget {
  final List<Subscription> list;

  const _List({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: ListSubscription(subscriptions: list),
    );
  }
}
