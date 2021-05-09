import 'package:flutter/material.dart';
import 'package:subscription_tracker/config/constants.dart';
import 'package:subscription_tracker/models/new_subscription.dart';
import 'package:subscription_tracker/widgets/image_subscription.dart';

class SubscriptionItemAdd extends StatelessWidget {
  final NewSubscription subscription;

  const SubscriptionItemAdd({Key? key, required this.subscription})
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
                    subscription.description,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  )
                ],
              )
            ],
          ),
          _ButtonAdded()
        ],
      ),
    );
  }
}

class _ButtonAdded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        backgroundColor:
            MaterialStateProperty.all<Color>(Colors.purple.shade100),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: const Text(
        'Add',
        style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
      ),
    );
  }
}
