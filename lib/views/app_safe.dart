import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:happjsafe/controllers/user_controller.dart';
import 'package:happjsafe/models/user.dart';
import 'package:happjsafe/resources/constant.dart';
import 'package:happjsafe/views/history.dart';
import 'package:happjsafe/views/profile.dart';
import 'package:happjsafe/views/scanner.dart';
import 'package:happjsafe/views/user_code.dart';

import 'notification.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    Widget screen = Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(Constants.appName_SAFE),
      ),

      body: StreamBuilder<DocumentSnapshot>(
//        stream: UserController.getUserStream("7gU0TRNZGyRIxORoGiz5fNVS5Hx1"),
        stream: UserController.getUserStream("rqja0ZD4YsXS4b2MHdiRmqIDetH3"),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[CircularProgressIndicator()],
              )
            );
          }

          User loggedUser = User.fromJson(snapshot.data.data);
          loggedUser.id = snapshot.data.documentID;

          return PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: <Widget>[
              UserCodePage(loggedUser: loggedUser),
              HistoryPage(loggedUser: loggedUser),
              ScannerPage(userId: loggedUser.id),
              NotificationPage(loggedUser: loggedUser),
              ProfilePage(loggedUser: loggedUser),
            ],
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        child:_createIcon(Icons.camera, 2),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 10),
            _createIcon(Icons.filter_center_focus, 0),
            SizedBox(width: 10),
            _createIcon(Icons.public, 1),
            SizedBox(width: 100),
            _createIcon(Icons.notifications, 3),
            SizedBox(width: 10),
            _createIcon(Icons.person, 4),
            SizedBox(width: 10),
          ],
        ),
        color: Theme.of(context).primaryColor,
      ),
    );

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: screen,
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  IconButton _createIcon(IconData icon, int index) {
    return IconButton(
      icon: Icon(icon,size: 25.0),
      color: _getBottomIconColor(index),
      onPressed: () => _pageController.jumpToPage(index),
    );
  }

  Color _getBottomIconColor(int index) {
    return _page == index
        ? Colors.white
        : Theme.of(context).textTheme.caption.color;
  }

}