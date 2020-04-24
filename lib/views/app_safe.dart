import 'package:flutter/material.dart';
import 'package:happjsafe/resources/constant.dart';
import 'package:happjsafe/views/history.dart';
import 'package:happjsafe/views/profile.dart';
import 'package:happjsafe/views/scanner.dart';
import 'package:happjsafe/views/user_code.dart';

import 'notification.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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