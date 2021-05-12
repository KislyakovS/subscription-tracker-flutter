import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:subscription_tracker/models/subscription.dart';
import 'package:subscription_tracker/widgets/image_subscription.dart';

class FormItem {
  final String label;
  final Widget field;

  FormItem({required this.label, required this.field});
}

class FormSubscriptionScreen extends StatelessWidget {
  final Subscription subscription;

  final List<FormItem> formItems = [
    FormItem(
        label: 'Title',
        field: CupertinoTextField(
          placeholder: 'Hello',
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
          ),
        )),
    FormItem(
        label: 'Price',
        field: CupertinoTextField(
          placeholder: 'Hello',
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
          ),
        )),
    FormItem(
        label: 'Currency',
        field: CupertinoTextField(
          placeholder: 'Hello',
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
          ),
        )),
    FormItem(
        label: 'Period',
        field: CupertinoTextField(
          placeholder: 'Hello',
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
          ),
        )),
    FormItem(
        label: 'Date',
        field: CupertinoTextField(
          placeholder: 'Hello',
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
          ),
        )),
    FormItem(
        label: 'Notifications',
        field: CupertinoTextField(
          placeholder: 'Hello',
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
          ),
        ))
  ];

  FormSubscriptionScreen({
    Key? key,
    required this.subscription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          subscription.title,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              children: [
                ImageSubscription(src: subscription.image, size: 150),
                const SizedBox(height: 50),
                ...formItems
                    .asMap()
                    .entries
                    .map((item) => _RowForm(
                          item: item.value,
                          isShowDivider: item.key != formItems.length - 1,
                        ))
                    .toList()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _RowForm extends StatelessWidget {
  final FormItem item;
  final bool isShowDivider;

  const _RowForm({Key? key, required this.item, required this.isShowDivider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(item.label), Expanded(child: item.field)],
        ),
        if (isShowDivider) Divider(color: Colors.grey[400]),
      ],
    );
  }
}
