import 'package:flutter/material.dart';


class UserScannerPage extends StatefulWidget {
  @override
  _UserScannerPageState createState() => _UserScannerPageState();
}

class _UserScannerPageState extends State<UserScannerPage> {
  String _provider ="Vietnam Airline";
  String _from ="Thủ dầu một, Bình Dương, Việt Nam ";
  String _to ="San Franssico, United State, USA";
  String _datefrom="20 Apr 2020, 20:30 PM";
  String _dateto="30 Apr 2020, 24:00 AM";
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
                     borderRadius: BorderRadius.circular(30)
                   ),
                 ),
               ),
               Container(
                 alignment: Alignment.topCenter,
                 child: Image.asset("assets/images/like.png")
                 ),
             ],
           ),
           SizedBox(height: 20,),
           Text("Done!",style: TextStyle(fontSize: 40,color: Colors.white, fontWeight: FontWeight.bold),),
           SizedBox(height: 20,),
           Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width:1,color:Colors.white)
            ),
           ),
           SizedBox(height: 20,),
           Container(
             padding: EdgeInsets.all(20),
             child: Column(
               children: <Widget>[
                Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                   "Provider: ",
                   style: TextStyle(fontSize: 20,color: Colors.white),
                    ),
                SizedBox(width: 5),
                Text(
                  _provider,
                   style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                     ],
                    ),
                Row(
                  children: <Widget>[
                    Text(
                    "From: ",
                    style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    _from,
                     style: TextStyle(
                         fontSize: 18,color: Colors.white),
                              )),
                        ],
                      ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Text(
                      "To: ",
                      style: TextStyle(fontSize: 20,color: Colors.white),
                        ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                    _to,
                      style: TextStyle(
                      fontSize: 18, color: Colors.white),
                              )),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Text(
                            "Date: ",
                            style: TextStyle(fontSize: 20,color: Colors.white),
                          ),
                          SizedBox(width: 5),
                          Column(
                            children: <Widget>[
                              Text(
                                _datefrom,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                              Text(
                                "- - - - - To - - - - -",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellowAccent),
                              ),
                              Text(
                                _dateto,
                                style: TextStyle(
                                    fontSize: 18,
                                   color: Colors.white),
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
                  child:Text("Continue Scanning",style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold)) ,
                   onPressed:_continue ,
                   color: Colors.blue[600],
                   shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                     ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
  void  _continue(){

  }
}