import 'package:airplane/presentation/core/widgets/cta_button.dart';
import 'package:airplane/presentation/routers/routers.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessCheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              margin: const EdgeInsets.only(bottom: 80),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image_success.png'),
                ),
              ),
            ),
            Text(
              'Well Booked 😍',
              style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Are you ready to explore the new world of experiences?',
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
            ),
            CtaButton(
              width: 220,
              margin: const EdgeInsets.only(top: 50),
              title: 'My Bookings',
              onPressed: () {
                Get.offAllNamed(Routers.main);
              },
            )
          ],
        ),
      ),
    );
  }
}
