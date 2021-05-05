// import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SettingsScreen extends StatelessWidget {
  // Future<Null> selectTime(BuildContext context) async {
  //   var picked = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //     builder: (context, child) {
  //       return CupertinoTimerPicker(
  //         onTimerDurationChanged: (time) {},
  //         backgroundColor: Colors.white,
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Notifications',
                            style: TextStyle(fontSize: 16),
                          ),
                          CupertinoSwitch(value: true, onChanged: (value) {})
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey[400]),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Notification time',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '10:10',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey[400]),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Default currency',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'USD (\$)',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey[400]),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Show paused items',
                            style: TextStyle(fontSize: 16),
                          ),
                          CupertinoSwitch(value: true, onChanged: (value) {})
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Leave a subscription request',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    CupertinoTextField(
                      placeholder: 'Service name',
                    ),
                    const SizedBox(height: 15),
                    CupertinoTextField(
                      placeholder: 'Service url',
                    ),
                    const SizedBox(height: 15),
                    CupertinoButton(
                      child: Text('Send'),
                      onPressed: () {},
                      color: Colors.purple,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
