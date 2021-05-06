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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          CupertinoIcons.chevron_down,
                          size: 30,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      Flexible(
                          child: Text(
                        'Netflix',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      )),
                      TextButton(
                          onPressed: null,
                          child: Text(
                            'Save',
                            style: TextStyle(fontSize: 18),
                          ))
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
