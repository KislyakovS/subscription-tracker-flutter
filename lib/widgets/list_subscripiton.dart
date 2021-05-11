import 'package:flutter/material.dart';
import 'package:subscription_tracker/config/constants.dart';
import 'package:subscription_tracker/models/subscription.dart';
import 'package:subscription_tracker/screens/subscription/subscription_screen.dart';
import 'package:subscription_tracker/widgets/widgets.dart';

class ListSubscription extends StatelessWidget {
  final List<Subscription> subscriptions;
  final bool isNavigator;

  const ListSubscription(
      {Key? key, required this.subscriptions, this.isNavigator = false})
      : super(key: key);

  void _onTapSubscription(BuildContext context, Subscription subscription) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) =>
            SubscriptionScreen(subscription: subscription),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      scrollDirection: Axis.vertical,
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
              child: isNavigator
                  ? GestureDetector(
                      onTap: () =>
                          _onTapSubscription(context, subscription.value),
                      child: SubscriptionItem(
                        subscription: subscription.value,
                      ),
                    )
                  : SubscriptionItem(
                      subscription: subscription.value,
                    ),
            ),
          )
          .toList(),
    );
  }
}
