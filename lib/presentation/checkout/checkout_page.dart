import 'package:airplane/presentation/checkout/widgets/booking_detail_item.dart';
import 'package:airplane/presentation/core/widgets/cta_button.dart';
import 'package:airplane/presentation/core/widgets/tac.dart';
import 'package:airplane/presentation/routers/routers.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget route() => Container(
          margin: const EdgeInsets.only(top: 30),
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                            fontWeight: semiBold,
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

              // NOTE: BOOKING DETAILS TEXT
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                  'Booking Details',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
              ),

              // NOTE: BOOKING DETAILS ITEM
              BookingDetailItem(
                title: 'Traveler',
                valueText: '2 person',
                valueColor: kBlackColor,
              ),
              BookingDetailItem(
                title: 'Seat',
                valueText: 'A3, B3',
                valueColor: kBlackColor,
              ),
              BookingDetailItem(
                title: 'Insurance',
                valueText: 'YES',
                valueColor: kGreenColor,
              ),
              BookingDetailItem(
                title: 'Refundable',
                valueText: 'NO',
                valueColor: kRedColor,
              ),
              BookingDetailItem(
                title: 'VAT',
                valueText: '45%',
                valueColor: kBlackColor,
              ),
              BookingDetailItem(
                title: 'Price',
                valueText: 'IDR 8.500.690',
                valueColor: kBlackColor,
              ),
              BookingDetailItem(
                title: 'Grand Total',
                valueText: 'IDR 12.000.000',
                valueColor: kPrimaryColor,
              ),
            ],
          ),
        );

    Widget paymentDetails() => Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payment Details',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 70,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(defaultRadius),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/image_card.png'),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 25,
                              margin: const EdgeInsets.only(right: 6),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/icon_plane.png'),
                                ),
                              ),
                            ),
                            Text(
                              'Pay',
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'IDR 80.400.000',
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Current Balance',
                          style: greyTextStyle.copyWith(
                            fontWeight: light,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );

    Widget payNowButton() => CtaButton(
          margin: const EdgeInsets.only(top: 30),
          title: 'Pay Now',
          onPressed: () {
            Get.toNamed(Routers.checkoutSuccess);
          },
        );

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            route(),
            bookingDetails(),
            paymentDetails(),
            payNowButton(),
            TacButton(),
          ],
        ),
      ),
    );
  }
}
