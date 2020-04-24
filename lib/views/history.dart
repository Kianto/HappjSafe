import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happjsafe/views/widget/history_Card.dart';

///
/// Show list scan history
/// Background red for infected case route
///

class HistoryPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HistoryPageState();

}

class _HistoryPageState extends State<HistoryPage> {

  List place ;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListView.builder(
          shrinkWrap: false,
          scrollDirection: Axis.vertical,
          itemCount: place.length,
          itemBuilder: (_,index) {
            return history_card(
                title: "Scan history",
                type: 0, //Background red for infected case notification : type != 0
                from:place[index].fromPlace ,
                to: place[index].toPlace,
                datefrom: place[index].fromTime,
                dateto: place[index].toTime,
            );
          },
      ),
    );
  }
}