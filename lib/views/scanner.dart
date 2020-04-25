import 'package:flutter/material.dart';
import 'package:happjsafe/service/services.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:happjsafe/models/route.dart';

///
/// Scan other QR codes
/// Show result after scanning successfully
///

class ScannerPage extends StatefulWidget {
  ScannerPage({Key key, @required this.userId}) : super(key: key);

  final String userId;

  @override
  State<StatefulWidget> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  // TODO: GET service id after scan and with widget.userId to update
  // TODO: update data for both service passengers list and user history
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
        UserService.update_user_history(widget.userId, route);
        ServiceService.update_passenger(widget.userId, barcode);
    });
    //route = new MovementRoute.fromJson(ServiceService.get_service_info(barcode));
    
  }

}