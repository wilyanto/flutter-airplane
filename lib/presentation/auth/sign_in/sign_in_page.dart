import 'package:airplane/cubit/auth/auth_cubit.dart';
import 'package:airplane/presentation/core/widgets/cta_button.dart';
import 'package:airplane/presentation/core/widgets/custom_text_form_field.dart';
import 'package:airplane/presentation/core/widgets/snack_bar.dart';
import 'package:airplane/presentation/routers/routers.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget title() => Container(
          margin: const EdgeInsets.only(top: 30),
          child: Text(
            'Sign In with your\nexisting account',
            style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
        );

    Widget inputSection() {
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

      Widget submitButton() => BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Get.offAllNamed(Routers.main);
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
                title: 'Sign In',
                onPressed: () => context.read<AuthCubit>().signIn(
                      email: emailC.text,
                      password: passwordC.text,
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
            emailInput(),
            passwordInput(),
            submitButton(),
          ],
        ),
      );
    }

    Widget signUpButton() => GestureDetector(
          onTap: () {
            Get.offAndToNamed(Routers.signUp);
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 35, bottom: defaultMargin),
            child: Text(
              "Don't have an account? Sign Up",
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
            signUpButton(),
          ],
        ),
      ),
    );
  }
}
