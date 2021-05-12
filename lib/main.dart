import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:subscription_tracker/config/palette.dart';
import 'package:subscription_tracker/screens/screens.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //Lets make the Status Bar Transparent
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Palette.background,

    //Lets make the status bar icon brightness to bright
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
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
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.black),
          backgroundColor: Palette.background,
          brightness: Brightness.light,
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
