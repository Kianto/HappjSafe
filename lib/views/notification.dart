import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happjsafe/views/widget/notification_Card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        child: StreamBuilder(
            stream:
                Firestore.instance.collection('news').snapshots(), // async work
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[CircularProgressIndicator()],
                ));
              return ListView.builder(
                shrinkWrap: false,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) =>
                    _buildItems(context, snapshot.data.documents[index]),
              );
            }));
  }

  Widget _buildItems(BuildContext context, DocumentSnapshot document) {
    return newCard(
      title: document['title'],
      dateTime: document['time'].toDate(),
      content: document['content'],
    );
  }
}
