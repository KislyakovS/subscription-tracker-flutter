import 'package:flutter/material.dart';
import 'package:subscription_tracker/config/constants.dart';
import 'package:subscription_tracker/models/subscription.dart';
import 'package:subscription_tracker/widgets/widgets.dart';

class ListSubscription extends StatelessWidget {
  final List<Subscription> subscriptions;

  const ListSubscription({Key? key, required this.subscriptions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: subscriptions
          .asMap()
          .entries
          .map(
            (subscription) => Padding(
              padding: EdgeInsets.only(
                  bottom: subscription.key != subscriptions.length - 1
                      ? defaultPadding
                      : 0),
              child: SubscriptionItem(
                subscription: subscription.value,
              ),
            ),
          )
          .toList(),
    );
  }
}
