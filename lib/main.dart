import 'package:airplane/presentation/destination/destination_detail_page.dart';
import 'package:airplane/presentation/get_started/get_started.dart';
import 'package:airplane/presentation/main/main_page.dart';
import 'package:airplane/presentation/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';

import 'presentation/bonus/bonus_page.dart';
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
        SignUpPage.routeName: (context) => SignUpPage(),
        BonusPage.routeName: (context) => BonusPage(),
        MainPage.routeName: (context) => MainPage(),
        DestinationDetailPage.routeName: (context) => DestinationDetailPage(),
      },
    );
  }
}
