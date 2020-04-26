import 'package:flutter/material.dart';
import 'package:happjsafe/models/journey.dart';
import 'package:happjsafe/models/service.dart';
import 'package:happjsafe/service/services.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class UserScannerPage extends StatefulWidget {
  UserScannerPage({Key key, @required this.userId}) : super(key: key);

  final String userId;

  @override
  _UserScannerPageState createState() => _UserScannerPageState();
}

class _UserScannerPageState extends State<UserScannerPage> {
  String _provider;
  String _from;
  String _to;
  String _datefrom;
  String _dateto;

  String scanResult = "...";
  Journey route;

  @override
  void initState() {
    super.initState();
    setState(() {
      _provider = "";
      _from = "";
      _to = "";
      _datefrom = "";
      _dateto = "";
    });
    _scan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Stack(
                children: <Widget>[
                  // Container(
                  //   alignment: Alignment.bottomCenter,
                  //   // margin: EdgeInsets.all(10),
                  //   padding: EdgeInsets.fromLTRB(0, 70, 30, 0),
                  //   child: Container(
                  //     width: 200,
                  //     height: 180,
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(30)),
                  //   ),
                  // ),
                  Container(
                      height: 100,
                      width: 100,
                      //alignment: Alignment.topCenter,
                      child: Image.asset("assets/images/done.gif", fit: BoxFit.fill,)),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Done!",
                style: TextStyle(
                    fontSize: 30,
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
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 70.0,
                          child: Text(
                            "Provider: ",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          _provider,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 70.0,
                          child: Text(
                            "From: ",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                            child: Text(
                          _from,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 70.0,
                          child: Text(
                            "To: ",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                            child: Text(
                          _to,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 70.0,
                          child: Text(
                            "Date: ",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 5),
                        Column(
                          children: <Widget>[
                            Text(
                              _datefrom,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            Text(
                              "- - - - - To - - - - -",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellowAccent),
                            ),
                            Text(
                              _dateto,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
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
                  color: Colors.blue[600],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _continue() => _scan();

  Future _scan() async {
    String barcode = await scanner.scan();
    print(barcode);
    setState(() {
      scanResult = barcode;
    });
    var data = ServiceService.get_service_info(barcode);

    data.then((value){
      Service s = Service.fromJson(value.data);

      setState(() {
        _provider = value['provider'];
        _from = value['fromPlace'];
        _to = value['toPlace'];
        _datefrom = s.departureTime;
        _dateto = s.departureTime;
      });
    });

    data.then((value) {
      route = new Journey(
        serviceId: barcode,
        fromPlace: value['fromPlace'],
        toPlace: value['toPlace'],
        fromTime: value['fromTime'].toDate(),
        toTime: value['toTime'].toDate(),
        isGood: value['isGood'],
      );
      UserService.update_user_history(widget.userId, route);
      ServiceService.update_passenger(widget.userId, barcode);
    });
    //route = new Journey.fromJson(ServiceService.get_service_info(barcode));
  }
}
