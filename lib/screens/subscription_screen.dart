import 'package:flutter/material.dart';
import 'package:subscription_tracker/widgets/widgets.dart';

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
        actions: [IconButton(icon: Icon(Icons.edit), onPressed: () {})],
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
              //height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
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
                    height: 200,
                    color: Colors.red,
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
