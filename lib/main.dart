import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happjsafe/resources/constant.dart';
import 'package:happjsafe/views/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName_SAFE,
      home: SplashScreen(),
    );
  }
}