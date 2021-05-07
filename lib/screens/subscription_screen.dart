import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription_tracker/config/palette.dart';
import 'package:subscription_tracker/widgets/widgets.dart';

class SubscriptionScreen extends StatelessWidget {
  void _showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      backgroundColor: Palette.background,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          maxChildSize: 0.92,
          initialChildSize: 0.92,
          minChildSize: 0.92,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // IconButton(
                      //   icon: Icon(
                      //     CupertinoIcons.chevron_down,
                      //     size: 30,
                      //   ),
                      //   onPressed: () => Navigator.of(context).pop(),
                      // ),
                      Flexible(
                          child: Text(
                        'Netflix',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      )),
                      // TextButton(
                      //   onPressed: null,
                      //   child: Text(
                      //     'Save',
                      //     style: TextStyle(fontSize: 18),
                      //   ),
                      // )
                    ],
                  ),
                  const SizedBox(height: 25),
                  Column(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10)),
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
            );
          },
        );
      },
    );
  }

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
          IconButton(
              icon: Icon(Icons.edit), onPressed: () => _showModal(context))
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: VerticalCard(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Statistics',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 250,
                    //color: Colors.red,
                    child: Chart(),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Payment History',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ...List.generate(10, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: VerticalCard(),
                        );
                      }).toList()
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
