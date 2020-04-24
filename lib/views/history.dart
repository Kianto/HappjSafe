import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// Show list scan history
/// Background red for infected case route
///

class HistoryPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HistoryPageState();

}

class _HistoryPageState extends State<HistoryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Text("History");
  }

}