import 'package:flutter/material.dart';
import 'package:subscription_tracker/config/constants.dart';
import 'package:subscription_tracker/models/subscription.dart';
import 'package:subscription_tracker/widgets/image_subscription.dart';
import 'package:percent_indicator/percent_indicator.dart';

class NearestCard extends StatelessWidget {
  final Subscription subscription;

  const NearestCard({Key? key, required this.subscription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: defaultPadding),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadiusImage),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageSubscription(src: subscription.image, size: 50),
              const SizedBox(width: 15),
              _FullPrice(price: subscription.fullPrice()),
            ],
          ),
          Text(
            subscription.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              _ProggressIndicator(remained: subscription.remained()),
              const SizedBox(
                width: 12,
              ),
              const Text('Days \nRemain')
            ],
          ),
        ],
      ),
    );
  }
}

class _ProggressIndicator extends StatelessWidget {
  final int remained;

  const _ProggressIndicator({Key? key, required this.remained})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 45,
      lineWidth: 4,
      percent: (10 - remained) / 10,
      animation: true,
      animationDuration: 800,
      backgroundColor: Colors.grey.shade100,
      progressColor: Colors.purple,
      circularStrokeCap: CircularStrokeCap.round,
      center: Text(
        '$remained',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _FullPrice extends StatelessWidget {
  final String price;

  const _FullPrice({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          price,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          'Monthly',
          style: TextStyle(fontSize: 14, color: Colors.grey[400]),
        )
      ],
    );
  }
}
