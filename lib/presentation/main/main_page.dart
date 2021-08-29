import 'package:airplane/presentation/home/home_page.dart';
import 'package:airplane/presentation/main/widgets/custom_bottom_navigation_item.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  static const routeName = 'main-page';

  Widget buildContent() => HomePage();

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
            children: const <Widget>[
              CustomBottomNavigationItem(
                filename: 'icon_home',
                isSelected: true,
              ),
              CustomBottomNavigationItem(
                filename: 'icon_booking',
              ),
              CustomBottomNavigationItem(
                filename: 'icon_card',
              ),
              CustomBottomNavigationItem(
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
      body: Stack(
        children: [
          buildContent(),
          customBottomNavigation(),
        ],
      ),
    );
  }
}
