import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happjsafe/views/widget/notification_Card.dart';

///
/// Show list notification from government and urgent from user
///

class NotificationPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _NotificationPageState();

}

class _NotificationPageState extends State<NotificationPage> {
List place;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListView.builder(
          shrinkWrap: false,
          scrollDirection: Axis.vertical,
          itemCount: place.length,
          itemBuilder: (_,index) {
            return  newCard(
              title: place[index].title,
              dateTime: place[index].time,
              content: place[index].content,
              );
          },
      ),
    );
  }

}