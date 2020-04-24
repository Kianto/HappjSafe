import 'package:flutter/material.dart';
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

      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: <Widget>[ 
          UserCodePage(),
          HistoryPage(),
          ScannerPage(),
          NotificationPage(),
          ProfilePage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child:_createIcon(Icons.camera, 2),
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
      icon: Icon(icon,size: 25.0,),
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