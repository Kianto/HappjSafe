import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happjsafe/models/user.dart';

///
/// Show user QR code
/// Background red if user is detected virus infected
///

class UserCodePage extends StatefulWidget {
  UserCodePage({Key key, @required this.loggedUser}) : super(key: key);

  final User loggedUser;
 
  @override
  State<StatefulWidget> createState() => _UserCodePageState();
}

class _UserCodePageState extends State<UserCodePage> {
   bool isDanger =false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color:isDanger?Colors.red: Colors.grey[100],
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Text("SCAN HERE",
                      style: TextStyle(
                        fontSize: 20,
                        color:isDanger?Colors.white : Color(0xff707070),
                        fontWeight: FontWeight.bold)
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 70,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
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
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Image.network(
                            widget.loggedUser.qrCode,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                          child: Center(
                            child: Text(
                              "${widget.loggedUser.id}",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ]),
      ),
    );
  }
}
