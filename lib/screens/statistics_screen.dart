import 'package:flutter/material.dart';
import 'package:subscription_tracker/widgets/widgets.dart';

class StatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Your statistics',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              // height: 300,
              // padding: const EdgeInsets.all(10),
              // margin: const EdgeInsets.all(10),
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.circular(20),
              // ),
              // child: Chart(),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total subscriptions',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '5',
                          style: TextStyle(fontSize: 16),
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
                          'Total subscriptions',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '5',
                          style: TextStyle(fontSize: 16),
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
                          'Total subscriptions',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '5',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 300,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Chart(),
            ),
          ),
        ],
      ),
    );
  }
}
