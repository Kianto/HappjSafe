import 'package:flutter/material.dart';
import 'package:happjsafe/models/journey.dart';

class JourneyCard extends StatelessWidget {
  const JourneyCard({Key key, this.journey}) : super(key: key);

  final Journey journey;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(20),
            color: journey.isGood ? Colors.white : Color(0xfff1444a),
            boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 6)]),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  "assets/images/Location-red.png",
                  width: 30,
                  height: 30,
                ),
                Text(
                  journey.fromPlace,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 30,
                ),
                Icon(
                  Icons.access_time,
                  size: 20,
                ),
                Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(width: 2, color: Colors.grey))),
                    child: Text(
                      journey.departureTime,
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    )),
              ],
            ),
            Image.asset(
              "assets/images/From-to.png",
              fit: BoxFit.fill,
              width: 70,
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    child: Text(
                      journey.toPlace,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    )),
                Image.asset(
                  "assets/images/Location-blue.png",
                  width: 30,
                  height: 30,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(width: 2, color: Colors.grey))),
                    child: Text(
                      journey.arrivalTime,
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    )),
                Icon(
                  Icons.access_time,
                  size: 20,
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
