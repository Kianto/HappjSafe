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
          Container(
           margin: EdgeInsets.all(50),
              width: double.infinity,
              height: 50,
                child: RaisedButton(
                child:Text("Continue",style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold)) ,
                 onPressed:_scan ,
                 color: Colors.blue,
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                   ),
                ),
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