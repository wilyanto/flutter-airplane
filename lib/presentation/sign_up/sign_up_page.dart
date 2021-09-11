import 'package:airplane/presentation/bonus/bonus_page.dart';
import 'package:airplane/presentation/core/widgets/cta_button.dart';
import 'package:airplane/presentation/core/widgets/custom_text_form_field.dart';
import 'package:airplane/presentation/core/widgets/tac.dart';
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
      Widget nameInput() => const CustomTextFormField(
            title: 'Full Name',
            hintText: 'Your fullname',
          );

      Widget emailInput() => const CustomTextFormField(
            title: 'Email Address',
            hintText: 'Your email address',
          );

      Widget passwordInput() => const CustomTextFormField(
            title: 'Password',
            hintText: 'Your password',
            isObscureText: true,
          );

      Widget hobbyInput() => const CustomTextFormField(
            title: 'Hobby',
            hintText: 'Your hobby',
          );

      Widget submitButton() => CtaButton(
            title: 'Get Started',
            onPressed: () => Navigator.pushNamed(context, BonusPage.routeName),
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

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            inputSection(),
            TacButton(),
          ],
        ),
      ),
    );
  }
}
