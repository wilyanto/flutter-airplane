import 'package:airplane/presentation/core/widgets/cta_button.dart';
import 'package:airplane/presentation/sign_up/sign_up_page.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  static const routeName = '/get-started';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/image_get_started.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Fly Like a Bird',
                  style: whiteTextStyle.copyWith(
                      fontSize: 32, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  // ignore: lines_longer_than_80_chars
                  'Explore new world with us and let yourself get an amazing experiences',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: light,
                  ),
                  textAlign: TextAlign.center,
                ),
                CtaButton(
                  title: 'Get Started',
                  width: 220,
                  margin: const EdgeInsets.only(top: 50, bottom: 80),
                  onPressed: () =>
                      Navigator.pushNamed(context, SignUpPage.routeName),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
