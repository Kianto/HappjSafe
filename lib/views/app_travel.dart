import 'package:flutter/material.dart';
import 'package:happjsafe/resources/constant.dart';
import 'package:happjsafe/views/profile.dart';
import 'package:happjsafe/views/scanner.dart';
import 'package:happjsafe/views/service_code.dart';

class TravelProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName_TRAVEL,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MainTravelScreen(),
    );
  }
}

class MainTravelScreen extends StatefulWidget {
  @override
  _MainTravelScreenState createState() => _MainTravelScreenState();
}

class _MainTravelScreenState extends State<MainTravelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Text("APP");
  }

}