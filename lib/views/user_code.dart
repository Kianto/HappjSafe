import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// Show user QR code
/// Background red if user is detected virus infected
///

class UserCodePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _UserCodePageState();
}

class _UserCodePageState extends State<UserCodePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(36.0),
              // TODO: get user image from storage
              child: Image.network(
                'https://cdn.quantrinhahang.edu.vn/wp-content/uploads/2019/07/qr-code-la-gi-400x400.jpg',
                fit: BoxFit.fill,
              )
          ),

        ]
    );
  }

}