import 'package:flutter/material.dart';
import 'package:happjsafe/service/services.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:happjsafe/models/route.dart';

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
  MovementRoute route;

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
    var data = ServiceService.get_service_info(barcode);
    data.then((value){
        route = new MovementRoute(
          serviceId: barcode,
          fromPlace: value['fromPlace'],
          toPlace: value['toPlace'],
          fromTime: value['fromTime'].toDate(),
          toTime: value['toTime'].toDate(),
          isGood: true,
        );
        UserService.update_user_history('7gU0TRNZGyRIxORoGiz5fNVS5Hx1', route);
        ServiceService.update_passenger('7gU0TRNZGyRIxORoGiz5fNVS5Hx1', barcode);
    });
    //route = new MovementRoute.fromJson(ServiceService.get_service_info(barcode));
    
  }

}