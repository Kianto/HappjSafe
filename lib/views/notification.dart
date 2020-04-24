import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// Show list notification from government and urgent from user
///

class NotificationPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _NotificationPageState();

}

class _NotificationPageState extends State<NotificationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Text("Noty");
  }

}