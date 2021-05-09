import 'package:flutter/material.dart';
import 'package:subscription_tracker/config/constants.dart';

class ImageSubscription extends StatelessWidget {
  final String src;
  final double size;

  const ImageSubscription({Key? key, required this.src, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadiusImage),
      child: Image.network(
        src,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
