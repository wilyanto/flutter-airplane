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
    late bool isSelected;

    Color backgroundColor() {
      switch (status) {
        case ESeatStatus.unavailable:
          return kUnavailableColor;
        case ESeatStatus.available:
        case ESeatStatus.selected:
          if (isSelected) {
            return kPrimaryColor;
          } else {
            return kAvailableColor;
          }
      }
    }

    Color borderColor() {
      switch (status) {
        case ESeatStatus.unavailable:
          return kUnavailableColor;
        case ESeatStatus.available:
        case ESeatStatus.selected:
          return kPrimaryColor;
      }
    }

    Widget child() {
      switch (status) {
        case ESeatStatus.unavailable:
          return const SizedBox();
        case ESeatStatus.available:
        case ESeatStatus.selected:
          if (isSelected) {
            return Center(
              child: Text(
                'You',
                style: whiteTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
      }
    }

    return GestureDetector(
      onTap: () {
        if (status != ESeatStatus.unavailable) {
          context.read<SeatCubit>().selectSeat(seatId);
        }
      },
      child: BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          isSelected = context.read<SeatCubit>().isSelected(seatId);

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
        },
      ),
    );
  }
}
