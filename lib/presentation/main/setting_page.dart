import 'package:airplane/cubit/auth/auth_cubit.dart';
import 'package:airplane/cubit/bottom_navigation/page_cubit.dart';
import 'package:airplane/presentation/core/widgets/cta_button.dart';
import 'package:airplane/presentation/core/widgets/snack_bar.dart';
import 'package:airplane/presentation/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          CustomSnackBar().show(descrption: state.error);
        } else if (state is AuthInitial) {
          context.read<PageCubit>().setSelectedPageIndex(0);
          Get.offAllNamed(Routers.signIn);
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
