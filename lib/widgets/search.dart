import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final double height;

  const Search({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 70),
      height: height,
      curve: Curves.bounceIn,
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: const CupertinoSearchTextField(),
      ),
    );
  }
}
