import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription_tracker/widgets/wrapper.dart';

class FormSubscriptionRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      title: const Text(
        'Leave a subscription request',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      child: Column(
        children: [
          CupertinoTextField(
            placeholder: 'Service name',
          ),
          const SizedBox(height: 10),
          CupertinoTextField(
            placeholder: 'Service url',
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 30,
            child: CupertinoButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {},
              color: Colors.purple[400],
              child: const Text('Submit request'),
            ),
          )
        ],
      ),
    );
  }
}
