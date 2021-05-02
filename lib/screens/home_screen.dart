import 'package:flutter/material.dart';
import 'package:subscription_tracker/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Subscription',
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
              padding: const EdgeInsets.symmetric(vertical: 20),
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...List.generate(5, (index) {
                    if (index == 4) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: HorizontalCard(),
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: HorizontalCard(),
                    );
                  }).toList()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
