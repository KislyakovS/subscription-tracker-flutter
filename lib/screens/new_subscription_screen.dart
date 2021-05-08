import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription_tracker/screens/screens.dart';
import 'package:subscription_tracker/widgets/widgets.dart';

class NewSubscriptionScreen extends StatefulWidget {
  @override
  _NewSubscriptionScreenState createState() => _NewSubscriptionScreenState();
}

class _NewSubscriptionScreenState extends State<NewSubscriptionScreen> {
  bool _isSearch = false;
  double _height = 0;

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
            onPressed: () {
              setState(() {
                _isSearch = !_isSearch;
                if (_isSearch) {
                  _height = 50;
                } else {
                  _height = 0;
                }
              });
            },
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
            AnimatedContainer(
              duration: Duration(milliseconds: 70),
              height: _height,
              curve: Curves.bounceIn,
              child: Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: CupertinoSearchTextField(),
              ),
            ),
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
            }).toList()
          ],
        ),
      ),
    );
  }
}

// class NewSubscriptionScreen extends StatelessWidget {
//   bool _isSearch = false;
//   double _height = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: false,
//         title: Text(
//           'New subscription',
//           style: TextStyle(fontSize: 25, color: Colors.black),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.search,
//               size: 30,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               setState(() {
//                 _isSearch = !_isSearch;
//                 if (_isSearch) {
//                   _height = 50;
//                 } else {
//                   _height = 0;
//                 }
//               });
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 10),
//             child: IconButton(
//               icon: Icon(
//                 Icons.add,
//                 size: 30,
//                 color: Colors.black,
//               ),
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (BuildContext context) =>
//                             CreateSubscriptionScreen()));
//               },
//             ),
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: ListView(
//           shrinkWrap: true,
//           children: [
//             AnimatedContainer(
//               duration: Duration(milliseconds: 70),
//               height: _height,
//               curve: Curves.bounceIn,
//               child: Container(
//                 padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
//                 child: CupertinoSearchTextField(),
//               ),
//             ),
//             ...List.generate(100, (index) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 5),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (BuildContext context) =>
//                                 CreateSubscriptionScreen()));
//                   },
//                   child: CreateCard(),
//                 ),
//               );
//             }).toList()
//           ],
//         ),
//       ),
//     );
//   }
// }
