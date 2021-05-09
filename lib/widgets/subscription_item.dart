import 'package:flutter/material.dart';
import 'package:subscription_tracker/config/constants.dart';
import 'package:subscription_tracker/models/subscription.dart';
import 'package:subscription_tracker/widgets/image_subscription.dart';

class SubscriptionItem extends StatelessWidget {
  final Subscription subscription;

  const SubscriptionItem({Key? key, required this.subscription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageSubscription(src: subscription.image, size: 60),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subscription.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subscription.fullPrice(),
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  )
                ],
              )
            ],
          ),
          _Date(date: subscription.getDate())
        ],
      ),
    );
  }
}

class _Date extends StatelessWidget {
  final String date;

  const _Date({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.purple[100], borderRadius: BorderRadius.circular(10)),
      child: Text(
        date,
        style: const TextStyle(
            color: Colors.deepPurple, fontWeight: FontWeight.bold),
      ),
    );
  }
}
