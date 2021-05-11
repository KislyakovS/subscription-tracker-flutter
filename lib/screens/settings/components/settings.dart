import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription_tracker/widgets/widgets.dart';
import 'package:subscription_tracker/widgets/wrapper.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _switch = false;

  void _changeSwitch(bool value) {
    setState(() {
      _switch = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Column(
        children: [
          _Item(
            label: 'Notifications',
            child: PlatformSwitch(
              value: _switch,
              onChanged: _changeSwitch,
            ),
          ),
          const Divider(),
          const _Item(
            label: 'Notification time',
            child: const Text(
              '10:10',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          const _Item(
            label: 'Default currency',
            child: Text(
              'USD (\$)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String label;
  final Widget child;

  const _Item({Key? key, required this.label, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(label), child],
    );
  }
}
