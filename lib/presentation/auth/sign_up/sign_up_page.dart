import 'package:airplane/cubit/auth/auth_cubit.dart';
import 'package:airplane/presentation/core/widgets/cta_button.dart';
import 'package:airplane/presentation/core/widgets/custom_text_form_field.dart';
import 'package:airplane/presentation/core/widgets/snack_bar.dart';
import 'package:airplane/presentation/routers/routers.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController hobbyC = TextEditingController();

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
      Widget nameInput() => CustomTextFormField(
            title: 'Full Name',
            hintText: 'Your fullname',
            controller: nameC,
          );

      Widget emailInput() => CustomTextFormField(
            title: 'Email Address',
            hintText: 'Your email address',
            controller: emailC,
          );

      Widget passwordInput() => CustomTextFormField(
            title: 'Password',
            hintText: 'Your password',
            isObscureText: true,
            controller: passwordC,
          );

      Widget hobbyInput() => CustomTextFormField(
            title: 'Hobby',
            hintText: 'Your hobby',
            controller: hobbyC,
          );

      Widget submitButton() => BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Get.offAllNamed(Routers.bonus);
              } else if (state is AuthFailed) {
                CustomSnackBar().show(descrption: state.error);
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return CtaButton(
                title: 'Get Started',
                onPressed: () => context.read<AuthCubit>().signUp(
                      email: emailC.text,
                      password: passwordC.text,
                      name: nameC.text,
                      hobby: hobbyC.text,
                    ),
              );
            },
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

    Widget signInButton() => GestureDetector(
          onTap: () {
            Get.toNamed(Routers.signIn);
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 35, bottom: defaultMargin),
            child: Text(
              'Have an account? Sign In',
              style: greenTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline,
              ),
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
            signInButton(),
          ],
        ),
      ),
    );
  }
}
