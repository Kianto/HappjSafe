import 'package:flutter/material.dart';
import 'package:happjsafe/models/user.dart';

///
/// Show user info
///

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, @required this.loggedUser}) : super(key: key);

  final User loggedUser;

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String urlImgGood = "assets/images/happy-face.png";
  String statusGood = "SAFE";
  String urlImgSick = "assets/images/sick-face.png";
  String statusSick = "INFECTED";
  Color color = Colors.blue;
  TextEditingController _name = new TextEditingController();
  TextEditingController _phone = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _name.text = widget.loggedUser.name;
    _phone.text = widget.loggedUser.phone;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildHeader(widget.loggedUser),
            _buildInfo(),
            _buildActionButtons(),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(User user) {
    return Container(
      width: double.infinity,
      color: color,
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            "Your Info",
            style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Container(
            width: 250,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)),
            child: Column(
              children: <Widget>[
                Image.asset(
                  user.isGood ? urlImgGood : urlImgSick,
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
                Text(
                  user.isGood ? statusGood : statusSick,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            _name.text,
            style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            StreamBuilder(
                builder: (context, snapshot) => TextField(
                    controller: _name,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(
                      errorText:
                      snapshot.hasError ? snapshot.error : null,
                      labelText: "Name",
                      filled: true,
                      fillColor: Colors.white,
                    ))),
            Container(
              child: StreamBuilder(
                  builder: (context, snapshot) => TextField(
                      controller: _phone,
                      style:
                      TextStyle(fontSize: 20, color: Colors.black),
                      decoration: InputDecoration(
                        errorText:
                        snapshot.hasError ? snapshot.error : null,
                        labelText: "Phone",
                        filled: true,
                        fillColor: Colors.white,
                      ))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      child: Container(
        margin: EdgeInsets.fromLTRB(8, 0, 8, 8),
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10))),
                  onPressed: () {},
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10))),
                  onPressed: () {},
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
