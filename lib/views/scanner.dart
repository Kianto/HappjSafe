import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

///
/// Scan other QR codes
/// Show result after scanning successfully
///

class ScannerPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ScannerPageState();

}

class _ScannerPageState extends State<ScannerPage> {
  String scanResult = "...";

  @override
  void initState() {
    super.initState();
    _scan();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(child: Text(scanResult, style: Theme.of(context).textTheme.subtitle,)),
          Divider(),
          Center(
            child: RaisedButton(
              child: Text("Continue"),
              onPressed: _scan,
            ),
          )

        ]
    );
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    print(barcode);
    setState(() {
      scanResult = barcode;
    });
  }

}