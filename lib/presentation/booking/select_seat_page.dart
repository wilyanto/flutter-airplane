import 'package:airplane/presentation/booking/enums/e_seat_status.dart';
import 'package:airplane/presentation/booking/widgets/seat_item.dart';
import 'package:airplane/presentation/checkout/checkout_page.dart';
import 'package:airplane/presentation/core/widgets/cta_button.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class SelectSeatPage extends StatelessWidget {
  static const routeName = 'select-seat';

  @override
  Widget build(BuildContext context) {
    Widget title() => Container(
          margin: const EdgeInsets.only(top: 30),
          child: Text(
            'Select Your\nFavorite Seat',
            style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
        );

    Widget seatStatus() => Container(
          margin: const EdgeInsets.only(top: 30),
          child: Row(
            children: [
              // NOTE: AVAILABLE
              Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.only(right: 6),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icon_available.png'),
                  ),
                ),
              ),
              Text(
                'Available',
                style: blackTextStyle,
              ),

              // NOTE: SELECTED
              Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.only(left: 10, right: 6),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icon_selected.png'),
                  ),
                ),
              ),
              Text(
                'Selected',
                style: blackTextStyle,
              ),

              // NOTE: UNAVAILABLE
              Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.only(left: 10, right: 6),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icon_unavailable.png'),
                  ),
                ),
              ),
              Text(
                'Unavailable',
                style: blackTextStyle,
              ),
            ],
          ),
        );

    Widget selectSeat() {
      Widget labelOnly({required String label}) => SizedBox(
            width: 48,
            height: 48,
            child: Center(
              child: Text(
                label,
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
          );

      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: kWhiteColor,
        ),
        child: Column(
          children: [
            // NOTE: SEAT INDICATORS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                labelOnly(label: 'A'),
                labelOnly(label: 'B'),
                labelOnly(label: ''),
                labelOnly(label: 'C'),
                labelOnly(label: 'D'),
              ],
            ),

            // NOTE: SEAT 1
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SeatItem(
                    status: ESeatStatus.unavailable,
                  ),
                  const SeatItem(
                    status: ESeatStatus.unavailable,
                  ),
                  labelOnly(label: "1"),
                  const SeatItem(
                    status: ESeatStatus.available,
                  ),
                  const SeatItem(
                    status: ESeatStatus.unavailable,
                  ),
                ],
              ),
            ),

            // NOTE: SEAT 2
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SeatItem(
                    status: ESeatStatus.available,
                  ),
                  const SeatItem(
                    status: ESeatStatus.available,
                  ),
                  labelOnly(label: "2"),
                  const SeatItem(
                    status: ESeatStatus.available,
                  ),
                  const SeatItem(
                    status: ESeatStatus.unavailable,
                  ),
                ],
              ),
            ),

            // NOTE: SEAT 3
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SeatItem(
                    status: ESeatStatus.selected,
                  ),
                  const SeatItem(
                    status: ESeatStatus.selected,
                  ),
                  labelOnly(label: "3"),
                  const SeatItem(
                    status: ESeatStatus.available,
                  ),
                  const SeatItem(
                    status: ESeatStatus.available,
                  ),
                ],
              ),
            ),

            // NOTE: SEAT 4
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SeatItem(
                    status: ESeatStatus.available,
                  ),
                  const SeatItem(
                    status: ESeatStatus.unavailable,
                  ),
                  labelOnly(label: "4"),
                  const SeatItem(
                    status: ESeatStatus.available,
                  ),
                  const SeatItem(
                    status: ESeatStatus.available,
                  ),
                ],
              ),
            ),

            // NOTE: SEAT 5
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SeatItem(
                    status: ESeatStatus.available,
                  ),
                  const SeatItem(
                    status: ESeatStatus.available,
                  ),
                  labelOnly(label: "5"),
                  const SeatItem(
                    status: ESeatStatus.unavailable,
                  ),
                  const SeatItem(
                    status: ESeatStatus.available,
                  ),
                ],
              ),
            ),

            // NOTE: YOUR SEAT
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your seat',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                  Text(
                    'A3, B3',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),

            // NOTE: TOTAL
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                  Text(
                    'IDR 540.000.000',
                    style: purpleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget checkoutButton() => CtaButton(
          margin: const EdgeInsets.only(top: 30, bottom: 46),
          title: 'Continue to Checkout',
          onPressed: () {
            Navigator.pushNamed(context, CheckoutPage.routeName);
          },
        );

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            seatStatus(),
            selectSeat(),
            checkoutButton(),
          ],
        ),
      ),
    );
  }
}
