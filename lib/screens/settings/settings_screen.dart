import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription_tracker/config/constants.dart';
import 'package:subscription_tracker/screens/settings/components/form_subscription_request.dart';
import 'package:subscription_tracker/screens/settings/components/settings.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _indexSliding = 0;
  final double targetElevation = 3;
  double _elevation = 0;
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_scrollListener);
    _controller.dispose();
  }

  void _scrollListener() {
    double newElevation = _controller.offset > 1 ? targetElevation : 0;
    if (_elevation != newElevation) {
      setState(() {
        _elevation = newElevation;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        controller: _controller,
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            Settings(),
            const SizedBox(height: defaultPadding),
            FormSubscriptionRequest()
          ],
        ),
      ),
    );
  }
}
