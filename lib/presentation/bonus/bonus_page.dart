import 'package:airplane/cubit/auth/auth_cubit.dart';
import 'package:airplane/presentation/routers/routers.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class BonusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget bonusCard() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              height: 211,
              width: 300,
              padding: EdgeInsets.all(defaultMargin),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/image_card.png',
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.5),
                    blurRadius: 50,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: whiteTextStyle.copyWith(fontWeight: light),
                            ),
                            Text(
                              state.user.name,
                              style: whiteTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: medium,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
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
                      ),
                    ],
                  ),
                  const SizedBox(height: 41),
                  Text(
                    'Balance',
                    style: whiteTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                  Text(
                    'IDR 280.000.000',
                    style: whiteTextStyle.copyWith(
                      fontSize: 26,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    Widget title() => Container(
          margin: const EdgeInsets.only(top: 80),
          child: Text(
            'Big Bonus 🎉',
            style: blackTextStyle.copyWith(
              fontSize: 32,
              fontWeight: semiBold,
            ),
          ),
        );

    Widget subtitle() => Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            'We give you early credit so that\nyou can buy a flight ticket',
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
            ),
            textAlign: TextAlign.center,
          ),
        );

    Widget startButton() => Container(
          margin: const EdgeInsets.only(top: 50),
          height: 55,
          width: 220,
          child: TextButton(
            onPressed: () {
              Get.offAllNamed(Routers.main);
            },
            style: TextButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
              ),
            ),
            child: Text(
              'Start Fly Now',
              style: whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
          ),
        );

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bonusCard(),
            title(),
            subtitle(),
            startButton(),
          ],
        ),
      ),
    );
  }
}
