import 'package:flutter/material.dart';

class ScanTravelPage extends StatefulWidget {
  @override
  _ScanTravelPageState createState() => _ScanTravelPageState();
}

class _ScanTravelPageState extends State<ScanTravelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.purple,
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
         Text("Jonh Wick",style: TextStyle(fontSize: 30,color: Colors.white, fontWeight: FontWeight.bold)),
         SizedBox(height: 10,),
         Text("+84999999999",style: TextStyle(fontSize: 30,color: Colors.white, fontWeight: FontWeight.bold)),
         SizedBox(height: 10,),
         Container(
           margin: EdgeInsets.all(20),
              width: double.infinity,
              height: 50,
                child: RaisedButton(
                child:Text("Continue Scanning",style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold)) ,
                 onPressed:_continue ,
                 color: Colors.deepPurple,
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                   ),
                ),
          ],
        ),
      ),
    );
  }
  void  _continue(){

  }
}