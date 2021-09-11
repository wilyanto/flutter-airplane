import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  static const routeName = '/checkout';
  @override
  Widget build(BuildContext context) {
    Widget route() => Container(
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Image.asset('assets/image_checkout.png'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CGK',
                        style: blackTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        'Tangerang',
                        style: blackTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'TLC',
                        style: blackTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        'Ciliwung',
                        style: blackTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );

    Widget bookingDetails() => Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              defaultRadius,
            ),
            color: kWhiteColor,
          ),
          child: Column(
            children: [
              // NOTE: DESTIONATION TILE
              Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/image_destination1.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lake Ciliwung',
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Tangerang',
                          style: greyTextStyle.copyWith(fontWeight: light),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.only(right: 2),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icon_star.png'),
                          ),
                        ),
                      ),
                      Text(
                        '4.8',
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        );

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          route(),
          bookingDetails(),
        ],
      ),
    );
  }
}
