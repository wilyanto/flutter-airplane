import 'package:airplane/cubit/bottom_navigation/page_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  const CustomBottomNavigationItem({
    Key? key,
    required this.filename,
    required this.pageIndex,
  }) : super(key: key);

  final String filename;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setSelectedPageIndex(pageIndex);
      },
      behavior: HitTestBehavior.translucent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Image.asset(
            'assets/$filename.png',
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == pageIndex
                ? kPrimaryColor
                : kGreyColor,
          ),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
              color: context.read<PageCubit>().state == pageIndex
                  ? kPrimaryColor
                  : kTransparentColor,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
          )
        ],
      ),
    );
  }
}
