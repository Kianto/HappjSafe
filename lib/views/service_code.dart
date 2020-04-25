import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happjsafe/controllers/service_controller.dart';
import 'package:happjsafe/models/inspector.dart';
import 'package:happjsafe/models/service.dart';

///
/// Show user QR code
/// Background red if user is detected virus infected
///

class ServiceCodePage extends StatefulWidget {
  ServiceCodePage({Key key, @required this.inspector}) : super(key: key);

  final Inspector inspector;

  @override
  State<StatefulWidget> createState() => _ServiceCodePageState();
}

class _ServiceCodePageState extends State<ServiceCodePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[100],
        child: StreamBuilder<DocumentSnapshot>(
          stream: ServiceController.getUserStream(widget.inspector.inspectingServiceId),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[CircularProgressIndicator()],
                  )
              );

            Service service = Service.fromJson(snapshot.data.data);
            service.id = snapshot.data.documentID;

            return _buildBody(service);
          }
        ),
      ),
    );
  }

  Widget _buildBody(Service service) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 20),
          Center(
            child: Text(
              "SCAN HERE",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Center(
              child: Icon(
                Icons.arrow_drop_down,
                size: 80,
                color: Colors.blue,
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: Colors.grey[300]),
                    boxShadow: [
                      BoxShadow(color: Colors.black45, blurRadius: 6)
                    ]),
                child: Column(
                  children: <Widget>[
                    Image.network(
                      service.qrCode,
                      fit: BoxFit.fill,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                width: 3,
                                color: Colors.grey,
                              ))),
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          "${service.id}",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Provider: ",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: 5),
                        Text(
                          service.provider,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "From: ",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                            child: Text(
                              service.fromPlace,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Text(
                          "To: ",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                            child: Text(
                              service.toPlace,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Text(
                          "Date: ",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: 5),
                        Column(
                          children: <Widget>[
                            Text(
                              service.departureTime,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "- - - - - To - - - - -",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            Text(
                              service.arrivalTime,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ]);
  }
}
