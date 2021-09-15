import 'dart:async';

import 'package:airplane/cubit/auth/auth_cubit.dart';
import 'package:airplane/presentation/routers/routers.dart';
import 'package:airplane/shared/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      final User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        Get.offAllNamed(Routers.getStarted);
      } else {
        context.read<AuthCubit>().getCurrentUser(user.uid);
        Get.offAllNamed(Routers.main);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(bottom: 50),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icon_plane.png'),
                  ),
                ),
              ),
              Text(
                'AIRPLANE',
                style: whiteTextStyle.copyWith(
                  fontSize: 32,
                  fontWeight: medium,
                  letterSpacing: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
