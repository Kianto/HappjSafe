import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class newCard extends StatelessWidget {
  final DateTime dateTime;
  final String title;
  final String content;

  const newCard({Key key, this.dateTime, this.title, this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String _formatFrom = new DateFormat.yMMMd().format(dateTime);
    return Container(
      color: Colors.grey[100],
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              border: Border(
                left:BorderSide(width: 8,color: Colors.blueGrey)
              ),
            ),
            child: Container(
              width: double.infinity,
             margin: EdgeInsets.only(left:10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1.5,color: Colors.grey[300]
                ),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(5),
                    margin:EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width:2,color: Colors.grey))
                    ),
                    child: Text(title, style: TextStyle(fontSize: 20,color: Colors.blueGrey),)
                    ),
                    Row(
                    children: <Widget>[
                      Icon(Icons.access_time,size: 22,),
                      Text(_formatFrom,style: TextStyle(fontSize: 20, color: Colors.blueGrey),)
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(content, style: TextStyle(fontSize: 18,color: Colors.black),),
                  
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}