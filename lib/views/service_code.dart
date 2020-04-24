import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// Show user QR code
/// Background red if user is detected virus infected
///

class ServiceCodePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ServiceCodePageState();
}

class _ServiceCodePageState extends State<ServiceCodePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
        color: Colors.grey[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height:20),
            Center(
              child: Text("SCAN HERE",style: TextStyle(fontSize: 25,color: Colors.black, fontWeight: FontWeight.bold),),
            ),
             Center(
              child: Icon(Icons.arrow_drop_down,size: 80,color: Colors.blue,)
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              // TODO: get user image from storage
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width:1,color:Colors.grey[300])
                ),
                child: Column(
                  children: <Widget>[
                    Image.network(
                      'https://cdn.quantrinhahang.edu.vn/wp-content/uploads/2019/07/qr-code-la-gi-400x400.jpg',
                      fit: BoxFit.fill,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom:BorderSide(width: 3, color: Colors.grey,)
                           )
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Text("YOUR CODE: ABCD@1234",style: TextStyle(fontSize: 20,color: Colors.grey, fontWeight: FontWeight.bold),),
                       ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Name: ", style: TextStyle(fontSize: 18),),
                        SizedBox(width: 5),
                        Text("Vietnam Airline", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      ],
                    ),
                     Row(
                      children: <Widget>[
                        Text("From: ", style: TextStyle(fontSize:18),),
                        SizedBox(width: 5),
                        Expanded(child: Text("Thủ dầu một, Bình Dương, Việt Nam ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                      ],
                    ),
                    SizedBox(height:10),
                     Row(
                      children: <Widget>[
                        Text("To: ", style: TextStyle(fontSize: 18),),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text("San Franssico, United State, USA", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                      ],
                    ),
                     SizedBox(height:10),
                     Row(
                      children: <Widget>[
                        Text("Date: ", style: TextStyle(fontSize: 18),),
                        SizedBox(width: 5),
                        Column(
                          children: <Widget>[
                            Text("20 Apr 2020, 20:30 PM", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            Text("- - - - - To - - - - -", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.blue),),
                            Text("20 Apr 2020, 20:30 PM", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ),

          ]
        ),
      ),
    );

  }

}