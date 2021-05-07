import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription_tracker/config/palette.dart';
import 'package:subscription_tracker/widgets/widgets.dart';

class SubscriptionScreen extends StatelessWidget {
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
