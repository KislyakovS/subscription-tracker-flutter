import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription_tracker/config/constants.dart';
import 'package:subscription_tracker/models/subscription.dart';
import 'package:subscription_tracker/screens/home/components/nearest_card.dart';
import 'package:subscription_tracker/screens/home/data/action_sub.dart';
import 'package:subscription_tracker/screens/home/data/nearest_sub.dart';
import 'package:subscription_tracker/screens/home/data/paused_sub.dart';
import 'package:subscription_tracker/widgets/list_subscripiton.dart';
import 'package:subscription_tracker/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearch = false;
  double _height = 0;
  final double targetElevation = 3;
  double _elevation = 0;
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
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
  void dispose() {
    super.dispose();
    _controller.removeListener(_scrollListener);
    _controller.dispose();
  }

  void _pressedButtonSearch() {
    setState(() {
      _isSearch = !_isSearch;
      if (_isSearch) {
        _height = 50;
      } else {
        _height = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: _elevation,
        centerTitle: false,
        title: const Text(
          'Subscriptions',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 30,
              color: Colors.black,
            ),
            onPressed: _pressedButtonSearch,
          )
        ],
      ),
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          _SearchContainer(height: _height),
          _NearestContainer(),
          _ListContainer(title: 'Actions', list: actionSub),
          _ListContainer(title: 'Paused', list: pausedSub),
        ],
      ),
    );
  }
}

class _SearchContainer extends StatelessWidget {
  final double height;

  const _SearchContainer({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Search(height: height),
      ),
    );
  }
}

class _NearestContainer extends StatelessWidget {
  final listWidgets = nearestSubs
      .map(
        (subscription) => NearestCard(subscription: subscription),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: 200,
        child: ListView(
            padding: const EdgeInsets.only(left: defaultPadding),
            scrollDirection: Axis.horizontal,
            children: listWidgets),
      ),
    );
  }
}

class _ListContainer extends StatelessWidget {
  final List<Subscription> list;
  final String title;

  const _ListContainer({Key? key, required this.list, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.only(
          top: 10, left: defaultPadding, right: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ListSubscription(subscriptions: list),
          const SizedBox(height: defaultPadding)
        ],
      ),
    ));
  }
}
