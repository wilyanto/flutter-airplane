import 'package:airplane/presentation/get_started/get_started.dart';
import 'package:flutter/material.dart';

import 'presentation/splash/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashPage.routeName: (context) => SplashPage(),
        GetStartedPage.routeName: (context) => GetStartedPage(),
      },
    );
  }
}
