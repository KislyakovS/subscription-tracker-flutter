import 'package:flutter/material.dart';
import 'package:subscription_tracker/config/palette.dart';
import 'package:subscription_tracker/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter subscriotions',
      theme: ThemeData(
        scaffoldBackgroundColor: Palette.background,
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.black),
          backgroundColor: Palette.background,
        ),
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      home: BottomNavScreen(),
    );
  }
}
