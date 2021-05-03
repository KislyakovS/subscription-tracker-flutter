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
                height: 400,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black12,
                  //     offset: Offset(0, 2),
                  //     blurRadius: 6.0,
                  //   )
                  // ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Main',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Notifications'),
                        CupertinoSwitch(value: true, onChanged: (value) {})
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Notification time'),
                        GestureDetector(
                          onTap: () {
                            // DatePicker.showTimePicker(context,
                            //     showTitleActions: true,
                            //     showSecondsColumn: false, onChanged: (date) {
                            //   print('change $date');
                            // }, onConfirm: (date) {
                            //   print('confirm $date');
                            // },
                            //     currentTime: DateTime.now(),
                            //     locale: LocaleType.en);
                          },
                          child: Text('10:10'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Default currency'),
                        GestureDetector(
                          onTap: () {
                            // showCurrencyPicker(
                            //     context: context,
                            //     showFlag: true,
                            //     onSelect: (Currency currency) {
                            //       print(currency.code);
                            //       print(currency.symbol);
                            //     });
                          },
                          child: Text('USD (\$)'),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
