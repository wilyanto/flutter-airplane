import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/presentation/booking/select_seat_page.dart';
import 'package:airplane/presentation/checkout/checkout_page.dart';
import 'package:airplane/presentation/checkout/success/sucess_checkout_page.dart';
import 'package:airplane/presentation/destination/destination_detail_page.dart';
import 'package:airplane/presentation/get_started/get_started.dart';
import 'package:airplane/presentation/main/main_page.dart';
import 'package:airplane/presentation/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/bonus/bonus_page.dart';
import 'presentation/splash/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => PageCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SplashPage.routeName: (BuildContext context) => SplashPage(),
          GetStartedPage.routeName: (BuildContext context) => GetStartedPage(),
          SignUpPage.routeName: (BuildContext context) => SignUpPage(),
          BonusPage.routeName: (BuildContext context) => BonusPage(),
          MainPage.routeName: (BuildContext context) => MainPage(),
          DestinationDetailPage.routeName: (BuildContext context) =>
              DestinationDetailPage(),
          SelectSeatPage.routeName: (BuildContext context) => SelectSeatPage(),
          CheckoutPage.routeName: (BuildContext context) => CheckoutPage(),
          SuccessCheckoutPage.routeName: (BuildContext context) =>
              SuccessCheckoutPage(),
        },
      ),
    );
  }
}
