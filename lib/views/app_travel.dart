import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:happjsafe/controllers/user_controller.dart';
import 'package:happjsafe/models/inspector.dart';
import 'package:happjsafe/resources/constant.dart';
import 'package:happjsafe/views/profile.dart';
import 'package:happjsafe/views/travel_scanner.dart';
import 'package:happjsafe/views/service_code.dart';

class TravelProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName_TRAVEL,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MainTravelScreen(),
    );
  }
}

class MainTravelScreen extends StatefulWidget {
  @override
  _MainTravelScreenState createState() => _MainTravelScreenState();
}

class _MainTravelScreenState extends State<MainTravelScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    Widget screen = Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(Constants.appName_TRAVEL),
      ),

      body: StreamBuilder<DocumentSnapshot>(
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
  
            Inspector loggedUser = Inspector.fromJson(snapshot.data.data);
            loggedUser.id = snapshot.data.documentID;

          return PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: <Widget>[
              ServiceCodePage(inspector: loggedUser),
              TravelScannerPage(serviceId: loggedUser.inspectingServiceId),
              ProfilePage(loggedUser: loggedUser),
            ],
          );
        }
      ),
      floatingActionButton:  new FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: () => _pageController.jumpToPage(1),
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
            SizedBox(width: 100),
            _createIcon(Icons.person, 2),
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
        ? Theme.of(context).backgroundColor
        : Theme.of(context).textTheme.caption.color;
  }

}