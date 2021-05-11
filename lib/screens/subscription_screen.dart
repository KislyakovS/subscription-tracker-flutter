import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription_tracker/screens/create_subscription_screen.dart';
import 'package:subscription_tracker/widgets/widgets.dart';

enum NavigationPopup { edit }

class SubscriptionScreen extends StatelessWidget {
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
          PopupMenuButton(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.more_vert),
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('Edit'),
                  value: NavigationPopup.edit,
                ),
                // PopupMenuItem(child: Text('Paused')),
                // PopupMenuItem(child: Text('Delete')),
              ];
            },
            onSelected: (result) {
              if (result == NavigationPopup.edit) {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => CreateSubscriptionScreen(),
                //   ),
                // );
              }
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              //child: VerticalCard(),
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
                          //child: VerticalCard(),
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
