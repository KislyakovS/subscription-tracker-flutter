import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateSubscriptionScreen extends StatelessWidget {
  final TextEditingController _titleController =
      TextEditingController(text: 'Netflix');
  final TextEditingController _priceController =
      TextEditingController(text: '12.99');
  final TextEditingController _currencyController =
      TextEditingController(text: 'USD (\$)');
  final TextEditingController _periodController =
      TextEditingController(text: 'Every 1 month');
  final TextEditingController _dateController =
      TextEditingController(text: '10.10.2021');
  final TextEditingController _notificationsController =
      TextEditingController(text: 'Yes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Netflix',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Save',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              children: [
                // Container(
                //   width: 150,
                //   height: 150,
                //   decoration: BoxDecoration(
                //     color: Colors.grey[300],
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                // ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://cdn.vox-cdn.com/thumbor/QuS2QKQys3HhosKiV-2IuKhphbo=/39x0:3111x2048/1400x1050/filters:focal(39x0:3111x2048):format(png)/cdn.vox-cdn.com/uploads/chorus_image/image/49901753/netflixlogo.0.0.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Title',
                    ),
                    Expanded(
                      child: CupertinoTextField(
                        placeholder: 'Hello',
                        controller: _titleController,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                        ),
                      ),
                    )
                  ],
                ),
                Divider(color: Colors.grey[400]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Price'),
                    Expanded(
                      child: CupertinoTextField(
                        placeholder: '100',
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                        ),
                      ),
                    )
                  ],
                ),
                Divider(color: Colors.grey[400]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Currency'),
                    Expanded(
                      child: CupertinoTextField(
                        placeholder: 'USD',
                        controller: _currencyController,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                        ),
                      ),
                    )
                  ],
                ),
                Divider(color: Colors.grey[400]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Period'),
                    Expanded(
                      child: CupertinoTextField(
                        placeholder: 'Every 1 month',
                        controller: _periodController,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                        ),
                      ),
                    )
                  ],
                ),
                Divider(color: Colors.grey[400]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Date'),
                    Expanded(
                      child: CupertinoTextField(
                        placeholder: '29.10.2021',
                        controller: _dateController,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                        ),
                      ),
                    )
                  ],
                ),
                Divider(color: Colors.grey[400]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Notifications'),
                    Expanded(
                      child: CupertinoTextField(
                        placeholder: 'No',
                        controller: _notificationsController,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
