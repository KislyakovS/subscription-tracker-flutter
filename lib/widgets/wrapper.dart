import 'package:flutter/material.dart';
import 'package:subscription_tracker/config/constants.dart';
import 'package:subscription_tracker/config/palette.dart';

class Wrapper extends StatelessWidget {
  final String? title;
  final Widget child;

  const Wrapper({Key? key, this.title, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Palette.wrapperBg,
        borderRadius: BorderRadius.circular(defaultBorderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Column(
              children: [
                Text(
                  title!,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: defaultPadding),
              ],
            ),
          child
        ],
      ),
    );
  }
}
