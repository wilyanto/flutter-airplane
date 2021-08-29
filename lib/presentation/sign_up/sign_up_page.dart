import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  static const routeName = 'sign-up';
  @override
  Widget build(BuildContext context) {
    Widget title() => Container(
          margin: const EdgeInsets.only(top: 30),
          child: Text(
            'Join us and get\nyour next journey',
            style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
        );

    Widget inputSection() {
      Widget nameInput() => Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Full Name',
                  style: blackTextStyle.copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormField(
                  cursorColor: kBlackColor,
                  style: blackTextStyle.copyWith(fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Your fullname',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        defaultRadius,
                      ),
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                  ),
                )
              ],
            ),
          );

      Widget emailInput() => Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email Address',
                  style: blackTextStyle.copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormField(
                  cursorColor: kBlackColor,
                  style: blackTextStyle.copyWith(fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Your email address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        defaultRadius,
                      ),
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                  ),
                )
              ],
            ),
          );

      Widget passwordInput() => Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Password',
                  style: blackTextStyle.copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormField(
                  obscureText: true,
                  cursorColor: kBlackColor,
                  style: blackTextStyle.copyWith(fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        defaultRadius,
                      ),
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                  ),
                )
              ],
            ),
          );

      Widget hobbyInput() => Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hobby',
                  style: blackTextStyle.copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormField(
                  cursorColor: kBlackColor,
                  style: blackTextStyle.copyWith(fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Your hobby',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        defaultRadius,
                      ),
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                  ),
                )
              ],
            ),
          );

      Widget submitButton() => Container(
            width: double.infinity,
            height: 55,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
              ),
              child: Text(
                'Get Started',
                style: whiteTextStyle.copyWith(
                  fontSize: 19,
                  fontWeight: medium,
                ),
              ),
            ),
          );

      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          children: [
            nameInput(),
            emailInput(),
            passwordInput(),
            hobbyInput(),
            submitButton(),
          ],
        ),
      );
    }

    Widget tacButton() => Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 50, bottom: 73),
          child: Text(
            'Terms and Conditions',
            style: greenTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        );

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            inputSection(),
            tacButton(),
          ],
        ),
      ),
    );
  }
}
