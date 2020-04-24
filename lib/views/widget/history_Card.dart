import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class history_card extends StatelessWidget {
  final String title;
  final String from;
  final String to;
  final DateTime datefrom;
  final DateTime dateto;
  final int type;
  

  const history_card({Key key, this.title, this.from, this.to, this.datefrom, this.dateto, this.type}) : super(key: key);@override
  Widget build(BuildContext context) {
    String _formatFrom = new DateFormat.yMMMd().format(datefrom);
    String _formatTo = new DateFormat.yMMMd().format(dateto);
    return Container(
    color: Colors.grey[100],
     child: Container(
       margin: EdgeInsets.all(10),
       padding: EdgeInsets.all(20),
       decoration: BoxDecoration(
         border: Border.all(width: 1,color: Colors.grey),
         borderRadius: BorderRadius.circular(20),
         color:type == 0? Colors.white:Colors.red,
       ),
       child: Column(
         children: <Widget>[
           Row(
             children: <Widget>[
               Image.asset("assets/images/Location-red.png",
               width: 30,
               height: 30,),
               Text(from,style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)
             ],
           ),
           Row(
             children: <Widget>[
               SizedBox(width: 30,),
               Icon(Icons.access_time, size: 20,),
               Container(
                 padding: EdgeInsets.all(5),
                 decoration: BoxDecoration(
                   border: Border(
                     top: BorderSide(width:2,color:Colors.grey)
                   )
                 ),
                 child: Text(_formatFrom,style: TextStyle(fontSize: 18,color: Colors.black87),)
                 ),
             ],
           ),
               Image.asset("assets/images/From-to.png",
               fit: BoxFit.fill,
               width: 70,
               height: 60,
               ),
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
             children: <Widget>[
               Container(child: Text(to,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,),)),
               Image.asset("assets/images/Location-blue.png",
               width: 30,
               height: 30,),
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: <Widget>[
               Container(
                 padding: EdgeInsets.all(5),
                 decoration: BoxDecoration(
                   border: Border(
                     top: BorderSide(width:2,color:Colors.grey)
                   )
                 ),
                 child: Text(_formatTo,style: TextStyle(fontSize: 18,color: Colors.black87),)
                 ),
                 Icon(Icons.access_time, size: 20,),
                 SizedBox(width: 30,),
             ],
           ),
         ],
       ),
     ),
      
    );
  }
}