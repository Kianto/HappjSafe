import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happjsafe/models/route.dart';
import 'package:happjsafe/models/user.dart';
import 'package:happjsafe/views/widgets/journey_card.dart';

///
/// Show list scan history
/// Background red for infected case Journey
///

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key, @required this.loggedUser}) : super(key: key);

  final User loggedUser;

  @override
  State<StatefulWidget> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[200],
        child: StreamBuilder(
            stream:
                Firestore.instance.collection('user').document(widget.loggedUser.id).snapshots(), // async work
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
    var journey = new MovementRoute(
      isGood: document['isGood'],
      fromPlace: document['fromPlace'],
      toPlace: document['toPlace'],
      fromTime: document['fromTime'].toDate(),
      toTime: document['toTime'].toDate()
    );
    return JourneyCard(journey: journey);
  }
}
