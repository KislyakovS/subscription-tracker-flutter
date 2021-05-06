import 'package:flutter/material.dart';

class CreateSubscriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (context, scrollController) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Netflix'),
          ),
        );
      },
    );
  }
}
