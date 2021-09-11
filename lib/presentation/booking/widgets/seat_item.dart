import 'package:airplane/presentation/booking/enums/e_seat_status.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class SeatItem extends StatelessWidget {
  const SeatItem({
    Key? key,
    required this.status,
  }) : super(key: key);

  final ESeatStatus status;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor() {
      switch (status) {
        case ESeatStatus.available:
          return kAvailableColor;
        case ESeatStatus.unavailable:
          return kUnavailableColor;
        case ESeatStatus.selected:
          return kPrimaryColor;
      }
    }

    Color borderColor() {
      switch (status) {
        case ESeatStatus.available:
          return kPrimaryColor;
        case ESeatStatus.unavailable:
          return kUnavailableColor;
        case ESeatStatus.selected:
          return kPrimaryColor;
      }
    }

    Widget child() {
      switch (status) {
        case ESeatStatus.available:
          return const SizedBox();
        case ESeatStatus.unavailable:
          return const SizedBox();
        case ESeatStatus.selected:
          return Center(
            child: Text(
              "You",
              style: whiteTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
          );
      }
    }

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: backgroundColor(),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor(),
          width: 2,
        ),
      ),
      child: child(),
    );
  }
}
