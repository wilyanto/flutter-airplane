import 'package:airplane/cubit/seat/seat_cubit.dart';
import 'package:airplane/presentation/booking/enums/e_seat_status.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  const SeatItem({
    Key? key,
    required this.status,
    required this.seatId,
  }) : super(key: key);

  final ESeatStatus status;
  final String seatId;

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
              'You',
              style: whiteTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
          );
      }
    }

    return GestureDetector(
      onTap: () {
        context.read<SeatCubit>().selectSeat(seatId);
      },
      child: Container(
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
      ),
    );
  }
}
