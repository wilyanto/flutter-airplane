import 'package:airplane/cubit/seat/seat_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/presentation/booking/enums/e_seat_status.dart';
import 'package:airplane/presentation/booking/widgets/seat_item.dart';
import 'package:airplane/presentation/core/utils.dart';
import 'package:airplane/presentation/core/widgets/cta_button.dart';
import 'package:airplane/presentation/routers/routers.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SelectSeatPage extends StatelessWidget {
  const SelectSeatPage({
    Key? key,
    required this.destination,
  }) : super(key: key);

  final DestinationModel destination;

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
                    seatId: 'A1',
                    status: ESeatStatus.unavailable,
                  ),
                  const SeatItem(
                    seatId: 'B1',
                    status: ESeatStatus.unavailable,
                  ),
                  labelOnly(label: '1'),
                  const SeatItem(
                    seatId: 'C1',
                    status: ESeatStatus.available,
                  ),
                  const SeatItem(
                    seatId: 'D1',
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
                    seatId: 'A2',
                    status: ESeatStatus.available,
                  ),
                  const SeatItem(
                    seatId: 'B2',
                    status: ESeatStatus.available,
                  ),
                  labelOnly(label: '2'),
                  const SeatItem(
                    seatId: 'C2',
                    status: ESeatStatus.available,
                  ),
                  const SeatItem(
                    seatId: 'D2',
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
                    seatId: 'A3',
                    status: ESeatStatus.selected,
                  ),
                  const SeatItem(
                    seatId: 'B3',
                    status: ESeatStatus.selected,
                  ),
                  labelOnly(label: '3'),
                  const SeatItem(
                    seatId: 'C3',
                    status: ESeatStatus.available,
                  ),
                  const SeatItem(
                    seatId: 'D3',
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
                    seatId: 'A4',
                    status: ESeatStatus.available,
                  ),
                  const SeatItem(
                    seatId: 'B4',
                    status: ESeatStatus.unavailable,
                  ),
                  labelOnly(label: '4'),
                  const SeatItem(
                    seatId: 'C4',
                    status: ESeatStatus.available,
                  ),
                  const SeatItem(
                    seatId: 'D4',
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
                    seatId: 'A5',
                    status: ESeatStatus.available,
                  ),
                  const SeatItem(
                    seatId: 'B5',
                    status: ESeatStatus.available,
                  ),
                  labelOnly(label: '5'),
                  const SeatItem(
                    seatId: 'C5',
                    status: ESeatStatus.unavailable,
                  ),
                  const SeatItem(
                    seatId: 'D5',
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
                  SizedBox(width: defaultMargin),
                  Expanded(
                    child: BlocBuilder<SeatCubit, List<String>>(
                      builder: (context, state) {
                        return Text(
                          state.isEmpty ? 'No seat selected' : state.join(', '),
                          textAlign: TextAlign.right,
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        );
                      },
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
                  BlocBuilder<SeatCubit, List<String>>(
                    builder: (context, state) {
                      return Text(
                        getStringInCurrencyFormat(
                          destination.price * state.length,
                        ),
                        style: purpleTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return CtaButton(
            margin: const EdgeInsets.only(top: 30, bottom: 46),
            title: 'Continue to Checkout',
            onPressed: () {
              final _price = destination.price * state.length;
              Get.toNamed(
                Routers.checkout,
                arguments: TransactionModel(
                  destination: destination,
                  amountOfTraveler: state.length,
                  selectedSeats: state.join(', '),
                  isInsurance: true,
                  price: _price,
                  vat: 0.45,
                  grandTotal: _price + (_price * 0.45).toInt(),
                ),
              );
            },
          );
        },
      );
    }

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
