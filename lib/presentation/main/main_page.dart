import 'package:airplane/cubit/bottom_navigation/page_cubit.dart';
import 'package:airplane/presentation/home/home_page.dart';
import 'package:airplane/presentation/main/setting_page.dart';
import 'package:airplane/presentation/main/widgets/custom_bottom_navigation_item.dart';
import 'package:airplane/presentation/transaction/transaction_page.dart';
import 'package:airplane/presentation/wallet/wallet_page.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  static const routeName = 'main-page';

  Widget buildContent(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return const HomePage();
      case 1:
        return TransactionPage();
      case 2:
        return WalletPage();
      case 3:
        return SettingPage();
      default:
        return const HomePage();
    }
  }

  Widget customBottomNavigation() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: const EdgeInsets.only(bottom: 30, left: 24, right: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadius),
            color: kWhiteColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              // ignore: prefer_const_constructors
              CustomBottomNavigationItem(
                pageIndex: 0,
                filename: 'icon_home',
              ),
              // ignore: prefer_const_constructors
              CustomBottomNavigationItem(
                pageIndex: 1,
                filename: 'icon_booking',
              ),
              // ignore: prefer_const_constructors
              CustomBottomNavigationItem(
                pageIndex: 2,
                filename: 'icon_card',
              ),
              // ignore: prefer_const_constructors
              CustomBottomNavigationItem(
                pageIndex: 3,
                filename: 'icon_settings',
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: BlocBuilder<PageCubit, int>(
          builder: (context, pageIndex) {
            return Stack(
              children: [
                buildContent(pageIndex),
                customBottomNavigation(),
              ],
            );
          },
        ),
      ),
    );
  }
}
