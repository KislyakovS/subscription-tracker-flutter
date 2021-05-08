import 'package:flutter/material.dart';
import 'package:subscription_tracker/screens/screens.dart';
import 'package:subscription_tracker/widgets/widgets.dart';

class NewSubscriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          'New subscription',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(
                Icons.add,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            CreateSubscriptionScreen()));
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            ...List.generate(100, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                CreateSubscriptionScreen()));
                  },
                  child: CreateCard(),
                ),
              );
              //return CreateCard();
            }).toList()
          ],
        ),
      ),
    );
  }
}
