import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// Show user QR code
/// Background red if user is detected virus infected
///

class UserCodePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _UserCodePageState();
}

class _UserCodePageState extends State<UserCodePage> {
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
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Text("YOUR CODE: ABCD@1234",style: TextStyle(fontSize: 20,color: Colors.grey, fontWeight: FontWeight.bold),),
                  ),
                    ),
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