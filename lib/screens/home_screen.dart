import 'package:flutter/material.dart';
import 'package:subscription_tracker/screens/subscription_screen.dart';
import 'package:subscription_tracker/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Subscriptions',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...List.generate(5, (index) {
                    if (index == 4) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SubscriptionScreen())),
                          child: HorizontalCard(),
                        ),
                      );
                    }

                    return Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SubscriptionScreen())),
                          child: HorizontalCard(),
                        ));
                  }).toList()
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Text(
                    'Active',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  ...List.generate(2, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: VerticalCard(),
                    );
                  }).toList(),
                  const SizedBox(height: 10),
                  Text(
                    'Paused',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  ...List.generate(2, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: VerticalCard(),
                    );
                  }).toList(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
