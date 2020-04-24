import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class newCard extends StatelessWidget {
  final DateTime dateTime;
  final String title;
  final String content;
  final bool isDanger;

  const newCard({Key key, this.dateTime, this.title, this.content, this.isDanger}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String _formatFrom = new DateFormat.yMMMd().format(dateTime);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Color(0xfff8fbff)),
      padding: EdgeInsets.fromLTRB(15, 15, 20, 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: 8,
            height: 150,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: !isDanger ? Colors.blueGrey : Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(color: Colors.black45, blurRadius: 6)
              ]
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(height: 5,),

                Container(
                  width: MediaQuery.of(context).size.width - 103,
                  height: 2,
                  color: Color(0xfff5e8e8),
                ),

                SizedBox(height: 15,),
                Container(
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                    Icon(Icons.timer, color: Color(0xff3e444c),),
                    SizedBox(width: 5,),
                    Text (_formatFrom,
                      style: TextStyle (
                        color: Color(0xff3e444c),
                        fontStyle: FontStyle.italic,
                        //fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                    )
                  ],),
                ),

                SizedBox(height: 15),

                Container(
                 width: MediaQuery.of(context).size.width - 103,
                 child: Text(
                   content,
                   style: TextStyle (
                        color: Color(0xff3e444c),
                        fontStyle: FontStyle.italic,
                        //fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                 ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}