import 'package:airplane/cubit/auth/auth_cubit.dart';
import 'package:airplane/presentation/core/widgets/cta_button.dart';
import 'package:airplane/presentation/core/widgets/snack_bar.dart';
import 'package:airplane/presentation/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          CustomSnackBar().show(descrption: state.error);
        } else if (state is AuthInitial) {
          Navigator.pushNamedAndRemoveUntil(
              context, SignUpPage.routeName, (route) => false);
        }
      },
      builder: (context, state) {
        return Center(
          child: state is AuthLoading
              ? const CircularProgressIndicator()
              : CtaButton(
                  width: 220,
                  title: 'Sign Out',
                  onPressed: () {
                    context.read<AuthCubit>().signOut();
                  },
                ),
        );
      },
    );
  }
}
