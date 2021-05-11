import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:device_info/device_info.dart';

class PlatformSwitch extends StatelessWidget {
  final bool value;
  final void Function(bool)? onChanged;

  const PlatformSwitch({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Platform.isAndroid
          ? _AndroidSwitch(
              value: value,
              onChanged: onChanged,
            )
          : _IosSwitch(
              value: value,
              onChanged: onChanged,
            ),
    );
  }
}

class _AndroidSwitch extends StatelessWidget {
  final bool value;
  final void Function(bool)? onChanged;

  const _AndroidSwitch({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Switch(value: value, onChanged: onChanged),
    );
  }
}

class _IosSwitch extends StatelessWidget {
  final bool value;
  final void Function(bool)? onChanged;

  const _IosSwitch({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoSwitch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
