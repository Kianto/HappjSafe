import 'package:flutter/material.dart';
import 'package:happjsafe/models/journey.dart';
import 'package:happjsafe/models/user.dart';
import 'package:happjsafe/service/services.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class TravelScannerPage extends StatefulWidget {
  TravelScannerPage({Key key, @required this.serviceId}) : super(key: key);

  final String serviceId;

  @override
  _TravelScannerPageState createState() => _TravelScannerPageState();
}

class _TravelScannerPageState extends State<TravelScannerPage> {
  // TODO: GET user id after scan and with widget.serviceId to update
  // TODO: update data for both service passengers list and user history
  String scannedId;
  String scanResult = "...";
  bool isSuccess;
  Journey route;
  User user;
  String userName;
  String userPhoneNumber;

  @override
  void initState() {
    super.initState();
    setState(() {
      userName = 'Unknown';
      userPhoneNumber = 'Unknow phone number';
      isSuccess = false;
    });
    _scan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isSuccess
          ? Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.blue[300],
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomCenter,
                        // margin: EdgeInsets.all(10),
                        padding: EdgeInsets.fromLTRB(0, 70, 30, 0),
                        child: Container(
                          width: 200,
                          height: 180,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      Container(
                          alignment: Alignment.topCenter,
                          child: Image.asset("assets/images/like.png")),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Done!",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.white)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(userName,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(userPhoneNumber,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      child: Text("Continue Scanning",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      onPressed: _continue,
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.blue[300],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Press the button below to scan!",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.white)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      child: Text("Continue Scanning",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      onPressed: _continue,
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void _continue() {
    _scan();
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    print(barcode);
    setState(() {
      scanResult = barcode;
    });

    var data;
    data = UserService.get_user_info(barcode);
    data.then((value) {
      setState(() {
        userName = value['name'];
        userPhoneNumber = value['phone'];
      });
    });

    data = ServiceService.get_service_info(widget.serviceId);
    data.then((value) {
      route = new Journey(
        serviceId: barcode,
        fromPlace: value['fromPlace'],
        toPlace: value['toPlace'],
        fromTime: value['fromTime'].toDate(),
        toTime: value['toTime'].toDate(),
        isGood: value['isGood'],
      );
      setState(() {
        isSuccess = true;
      });
      UserService.update_user_history(barcode, route);
      ServiceService.update_passenger(barcode, widget.serviceId);
    });
    //route = new Journey.fromJson(ServiceService.get_service_info(barcode));
  }
}
