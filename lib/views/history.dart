import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happjsafe/models/journey.dart';
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
    List<Journey> history = widget.loggedUser.history.reversed.toList();

    return Container(
        color: Colors.grey[200],
        child: ListView.builder(
                shrinkWrap: false,
                scrollDirection: Axis.vertical,
                itemCount: history.length,
                itemBuilder: (context, index) =>
                    _buildItems(context, history[index]),
              )
    );
  }

  Widget _buildItems(BuildContext context, Journey journey) {
    return JourneyCard(journey: journey);
  }
}
