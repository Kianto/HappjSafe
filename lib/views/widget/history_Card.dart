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
      margin: EdgeInsets.all(2),
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
        border: Border(
        left:type == 0?BorderSide(width: 4.0, color: Colors.green):
        BorderSide(width: 4.0, color: Colors.red,)
        )
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title,style: TextStyle(fontSize: 25, color: type==0?Colors.green:Colors.red),),
            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                Icon(Icons.account_circle, size:50,color: Colors.grey,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on,size: 20,color: Colors.grey,),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Form : $from", style: TextStyle(fontSize: 20, color: Colors.black87),)
                      ],
                      ),
                    Text(" Date From : ${_formatFrom}", style: TextStyle(fontSize: 20, color: Colors.black54),),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on,size: 20,color: Colors.grey,),
                        SizedBox(
                          width: 10,
                        ),
                        Text("To: $to", style: TextStyle(fontSize: 20, color: Colors.black87,),)
                      ],
                      ),
                    Text("Date To: ${_formatTo}", style: TextStyle(fontSize: 20, color: Colors.black54),maxLines: 2)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      
    );
  }
}