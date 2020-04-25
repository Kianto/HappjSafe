import 'package:cloud_firestore/cloud_firestore.dart';
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
  String currentUserID = "7gU0TRNZGyRIxORoGiz5fNVS5Hx1";

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[200],
        child: StreamBuilder(
            stream:
                Firestore.instance.collection('user').document(currentUserID).snapshots(), // async work
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
                itemCount: snapshot.data['history'].length,
                itemBuilder: (context, index) =>
                    _buildItems(context, snapshot.data['history'][index]),
              );
            }));
  }

  Widget _buildItems(BuildContext context, document) {
    print(document);
    return history_card(
      
      title: "Scan history",
      type: 0, //Background red for infected case notification : type != 0
      from: document['fromPlace'],
      to: document['toPlace'],
      datefrom: document['fromTime'].toDate(),
      dateto: document['toTime'].toDate()
    );
  }
}
