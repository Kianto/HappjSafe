import 'package:flutter/material.dart';
import 'package:happjsafe/resources/constant.dart';
import 'package:happjsafe/views/splash.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName_SAFE,
      home: SplashScreen(),
    );
  }
}